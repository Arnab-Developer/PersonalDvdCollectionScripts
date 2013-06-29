USE [master]
GO

CREATE DATABASE PersonalDvdCollection ON PRIMARY
(
	NAME = N'PersonalDvdCollection',
	FILENAME = N'C:\DatabaseProblem\PersonalDvdCollection.mdf',
	SIZE = 3MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10%
),

FILEGROUP FG1 DEFAULT
(
	NAME = N'PersonalDvdCollectionData1',
	FILENAME = N'C:\DatabaseProblem\PersonalDvdCollectionData1.ndf',
	SIZE = 2MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10%
),
(
	NAME = N'PersonalDvdCollectionData2',
	FILENAME = N'C:\DatabaseProblem\PersonalDvdCollectionData2.ndf',
	SIZE = 2MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10%
),
FILEGROUP FG2
(
	NAME = N'PersonalDvdCollectionData3',
	FILENAME = N'C:\DatabaseProblem\PersonalDvdCollectionData3.ndf',
	SIZE = 2MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10%
),
(
	NAME = N'PersonalDvdCollectionData4',
	FILENAME = N'C:\DatabaseProblem\PersonalDvdCollectionData4.ndf',
	SIZE = 2MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10%
)

LOG ON
(
	NAME = N'PersonalDvdCollectionLog',
	FILENAME = N'C:\DatabaseProblem\PersonalDvdCollectionLog.ldf',
	SIZE = 2MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10%
)
GO