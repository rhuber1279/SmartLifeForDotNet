USE [smartlife-120303]
GO
/****** Object:  BrokerService [http://schemas.microsoft.com/SQL/Notifications/EventNotificationService]    Script Date: 04/28/2014 11:27:33 ******/
ALTER SERVICE [http://schemas.microsoft.com/SQL/Notifications/EventNotificationService]  ON QUEUE [dbo].[EventNotificationErrorsQueue] 


CREATE MESSAGE TYPE
       [//ETLDB/1DBSample/RequestMessage]
       VALIDATION = WELL_FORMED_XML;
CREATE MESSAGE TYPE
       [//ETLDB/1DBSample/ReplyMessage]
       VALIDATION = WELL_FORMED_XML;
GO

CREATE CONTRACT [//ETLDB/1DBSample/SampleContract]
      ([//ETLDB/1DBSample/RequestMessage]
       SENT BY INITIATOR,
       [//ETLDB/1DBSample/ReplyMessage]
       SENT BY TARGET
      );
GO

CREATE QUEUE TargetQueue1DB;

CREATE SERVICE
       [//ETLDB/1DBSample/TargetService]
       ON QUEUE TargetQueue1DB
       ([//ETLDB/1DBSample/SampleContract]);
GO

CREATE QUEUE InitiatorQueue1DB;

CREATE SERVICE
       [//ETLDB/1DBSample/InitiatorService]
       ON QUEUE InitiatorQueue1DB;
GO

DECLARE @InitDlgHandle UNIQUEIDENTIFIER;
DECLARE @RequestMsg NVARCHAR(100);

BEGIN TRANSACTION;

BEGIN DIALOG @InitDlgHandle
     FROM SERVICE
      [//ETLDB/1DBSample/InitiatorService]
     TO SERVICE
      N'//ETLDB/1DBSample/TargetService'
     ON CONTRACT
      [//ETLDB/1DBSample/SampleContract]
     WITH
         ENCRYPTION = OFF;

SELECT @RequestMsg =
       N'<RequestMsg>Message for Target service.</RequestMsg>';

SEND ON CONVERSATION @InitDlgHandle
     MESSAGE TYPE 
     [//ETLDB/1DBSample/RequestMessage]
     (@RequestMsg);

SELECT @RequestMsg AS SentRequestMsg;

COMMIT TRANSACTION;
GO
