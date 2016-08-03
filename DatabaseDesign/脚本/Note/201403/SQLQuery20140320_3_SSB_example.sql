CREATE DATABASE ServiceBrokerTest
 GO
 USE ServiceBrokerTest
 GO
 -- Enable Service Broker
 ALTER DATABASE ServiceBrokerTest SET ENABLE_BROKER
 GO
 -- Create Message Type
 CREATE MESSAGE TYPE SBMessage
 VALIDATION = NONE
 GO
 -- Create Contract
 CREATE CONTRACT SBContract
 (SBMessage SENT BY INITIATOR)
 GO
 -- Create Send Queue
 CREATE QUEUE SBSendQueue
 GO
 -- Create Receive Queue
 CREATE QUEUE SBReceiveQueue
 GO
 -- Create Send Service on Send Queue
 CREATE SERVICE SBSendService
 ON QUEUE SBSendQueue (SBContract)
 GO
 -- Create Receive Service on Recieve Queue
 CREATE SERVICE SBReceiveService
 ON QUEUE SBReceiveQueue (SBContract)
 GO
 -- Begin Dialog using service on contract
 DECLARE @SBDialog uniqueidentifier
 DECLARE @Message NVARCHAR(128)
 BEGIN DIALOG CONVERSATION @SBDialog
 FROM SERVICE SBSendService
 TO SERVICE 'SBReceiveService'
 ON CONTRACT SBContract
 WITH ENCRYPTION = OFF
 -- Send messages on Dialog
 SET @Message = N'Very First Message';
 SEND ON CONVERSATION @SBDialog
 MESSAGE TYPE SBMessage (@Message)
 SET @Message = N'Second Message';
 SEND ON CONVERSATION @SBDialog
 MESSAGE TYPE SBMessage (@Message)
 SET @Message = N'Third Message';
 SEND ON CONVERSATION @SBDialog
 MESSAGE TYPE SBMessage (@Message)
 GO
 -- View messages from Receive Queue
 SELECT CONVERT(NVARCHAR(MAX), message_body) AS Message
 FROM SBReceiveQueue
 GO
 -- Receive messages from Receive Queue
 RECEIVE TOP(1) CONVERT(NVARCHAR(MAX), message_body) AS Message
 FROM SBReceiveQueue
 GO
 -- Receive messages from Receive Queue
 RECEIVE CONVERT(NVARCHAR(MAX), message_body) AS Message
 FROM SBReceiveQueue
 GO
 -- Clean Up
 USE master
 GO
 DROP DATABASE ServiceBrokerTest
 GO
 
 -----------===========
step 1��perpar database & data


���ƴ��� ��������:www.mb5u.com


use master
go
Create database Inventory
go
use Inventory
go
Create table inventory
(
 TitleId nvarchar(6) not null,
 Quantity int not null,
primary key (TitleId,Quantity)
);
go
 
insert inventory values ('pc1001',100);
insert inventory values ('pc1002',200);
insert inventory values ('pc1003',300);
insert inventory values ('pc1004',400);



step 2: ��������SSB�Ļ������.
 
���ȴ�����Ϣ����


���ƴ��� ��������:www.mb5u.com


Create Message Type [//mark/v10/types/inventory]
Create Message Type [//mark/v10/types/inventoryresponse] 


������Լ 

���ƴ��� ��������:www.mb5u.com


Create contracts [//mark/v10/contracts/inventorycontract]
( 
[//mark/v10/types/inventory] send by initiator,
 [//mark/v10/types/inventoryresponse] send by target 
); 



�������������


���ƴ��� ��������:www.mb5u.com


create queue [inventory client queue];
create service [//mark/v10/services/inventory client]
 on queue [inventory client queue]

 go
--create inventory service
 create queue [inventory queue];
 create service [//mark/v10/services/inventory]
 on queue [inventory queue]
 (
 [//mark/v10/contracts/inventorycontract]
 );



step 3��������Ϣ����Ϣ������


���ƴ��� ��������:www.mb5u.com


use Inventory
go
--send message
begin transaction
 declare @dialog_id uniqueidentifier
 begin dialog conversation @dialog_id
 from service [//mark/v10/services/inventory client]
 to service '//mark/v10/services/inventory'
 on contract [//mark/v10/contracts/inventorycontract]
 with encryption = off;
 send on conversation @dialog_id message type [//mark/v10/types/inventory]
 (
 '<InventoryUpdate>
 <TitleId>pc1001</TitleId>
 <Quantity>102</Quantity>
 </InventoryUpdate>' 
);
 commit transaction;


���ͳɹ��󣬿��Բ�ѯ inventory_queue

���ƴ��� ��������:www.mb5u.com


select conversation_handle, cast(message_body as xml) as conversation_body from [Inventory queue] 


����ֻ�ǲ�ѯ�����С�
 
����conversation_body ���� ���Ƿ�������Ϣ�ˡ� 

setp 4: �� inventory queue �л�ȡ��Ϣ����������
 

���ƴ��� ��������:www.mb5u.com


use inventory
go
begin transaction
 declare @dialog_id uniqueidentifier
 declare @message_body xml
 declare @amount int;
 declare @title nvarchar(128);

 receive
 @dialog_id = conversation_handle,
 @message_body = message_body 
from [dbo].[Inventory queue]

 print 'handle is' + cast(@dialog_id as nvarchar(90))
 print 'message body is' + cast(@message_body as nvarchar(max) )
 if(@dialog_id is not null)
 begin 
set @amount = @message_body.value('(/InventoryUpdate/Quantity)[1]','int');
 set @title = @message_body.value('(/InventoryUpdate/TitleId)[1]','nvarchar(100)');
 print 'a:'+cast(@amount as nvarchar(100))
 print 'b:'+@title;

 Update inventory set Quantity = @amount where TitleId = @title;
 end
 end conversation @dialog_id;
 commit transaction;


�����ɹ�����ȥ��ѯinventory queue�ı� ��ԥ����������Ѿ���receive ���� ��Ϊ���ˡ�
 
����ͬʱ��������
 


step 5: �����������Զ��������ܣ�ֻҪ����Ϣ���͵����У���ض��У��Ϳ����Զ�ִ�й���.
 
���Ƚ������洢���̣�����receive �е��Ƕδ����ù����Ϳ����ˣ�


���ƴ��� ��������:www.mb5u.com


use Inventory
go
--create procedure to receive message and update table
create proc InventoryProc as
 
begin transaction
 declare @dialog_id uniqueidentifier
 declare @message_body xml
 declare @amount int;
 declare @title nvarchar(128);

 waitfor(
 receive
 @dialog_id = conversation_handle,
 @message_body = message_body 
from [dbo].[Inventory queue]),timeout 5000;

 print 'handle is' + cast(@dialog_id as nvarchar(90))
 print 'message body is' + cast(@message_body as nvarchar(max) )
 if(@dialog_id is not null)
 begin 
set @amount = @message_body.value('(/InventoryUpdate/Quantity)[1]','int');
 set @title = @message_body.value('(/InventoryUpdate/TitleId)[1]','nvarchar(100)');
 print 'a:'+cast(@amount as nvarchar(100))
 print 'b:'+@title;

 Update inventory set Quantity = @amount where TitleId = @title;
 end
 end conversation @dialog_id;
 commit transaction;
 go


���м���

���ƴ��� ��������:www.mb5u.com


alter queue [inventory queue]
 with activation(
 status = on,
 procedure_name= InventoryProc,
 max_queue_readers=2,
 execute as self
 );

 go


��ɺ�ֻҪ���Ͷ�����Ϣ�󣬾Ϳ�����
 
PS�� ���Ƕ����� �������� ���и� inventory client queue
 
������б�����ǳɹ�����error ��ʾ����receive ����Ҳ������ȡ������


���ƴ��� ��������:www.mb5u.com


select message_type_name from [Inventory client queue]


 




���ϵ� message type service ����Ϣ ��ͼ��ʾ����������.
 
������SSB������ʵ�����Ժ����дһƪʵ��Ӧ���ϵģ����ϵ�sql code ���Ǵ��ֹ����룬���ܻ����ڴ�����ȻУ�������飩,����������󣬶Բ������ˡ���
