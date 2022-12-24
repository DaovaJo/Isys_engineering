SET ANSI_PADDING ON
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE DATABASE chat
GO

USE chat
GO

CREATE TABLE chats /*Чаты*/
(
[ID_CHAT] INT NOT NULL IDENTITY(1,1),
[NAME_CHAT] VARCHAR(100) NOT NULL,
CONSTRAINT [ID_CHAT] PRIMARY KEY CLUSTERED
([ID_CHAT] ASC) ON [PRIMARY]
)
GO

CREATE TABLE users /*Пользователи*/
(
[ID_USER] INT NOT NULL IDENTITY(1,1),
[LOGIN] VARCHAR(50) NOT NULL,
[PASSWORD] VARCHAR(50) NOT NULL,
CONSTRAINT [ID_USER] PRIMARY KEY CLUSTERED
([ID_USER] ASC) ON [PRIMARY]
)
GO

CREATE TABLE dictionary /*Словарь*/
(
[ID_DICT] INT NOT NULL IDENTITY(1,1),
[WORD] VARCHAR(150) NOT NULL,
[MEANING] VARCHAR (150) NOT NULL,
CONSTRAINT [ID_DICT] PRIMARY KEY CLUSTERED
([ID_DICT] ASC) ON [PRIMARY]
)
GO

CREATE TABLE messagen /*Сообщения, строка ввода*/
(
[ID_MES] INT NOT NULL IDENTITY(1,1),
[CHAT_ID] INT NOT NULL,
[USER_ID] INT NOT NULL,
[REPLACE] INT NOT NULL,
CONSTRAINT [ID_MES] PRIMARY KEY CLUSTERED
([ID_MES] ASC) ON [PRIMARY],
CONSTRAINT [FK_ID_CHAT] FOREIGN KEY ([CHAT_ID])
REFERENCES chats ([ID_CHAT]),
CONSTRAINT [FK_ID_USER] FOREIGN KEY ([USER_ID])
REFERENCES users ([ID_USER]),
CONSTRAINT [FK_ID_DICT] FOREIGN KEY ([REPLACE])
REFERENCES dictionary ([ID_DICT])
)
GO

CREATE TABLE story_chat /*История чата*/
(
[ID_STORY] INT NOT NULL IDENTITY(1,1),
[USER1_ID] INT NOT NULL,
[USER2_ID] INT NOT NULL,
[CHATS_ID] INT NOT NULL,
[MES_ID] INT NOT NULL,
[DATA_MES] DATE NOT NULL,
[MESSAGE_TEXT] VARCHAR(200) NOT NULL,
CONSTRAINT [ID_STORY] PRIMARY KEY CLUSTERED
([ID_STORY] ASC) ON [PRIMARY],
CONSTRAINT [FK_ID_USER1] FOREIGN KEY ([USER1_ID])
REFERENCES users ([ID_USER]),
CONSTRAINT [FK_ID_USER2] FOREIGN KEY ([USER2_ID])
REFERENCES users ([ID_USER]),
CONSTRAINT [FK_ID_CHATS] FOREIGN KEY ([CHATS_ID])
REFERENCES chats ([ID_CHAT]),
CONSTRAINT [FK_ID_MES] FOREIGN KEY ([MES_ID])
REFERENCES messagen ([ID_MES])
)
GO
