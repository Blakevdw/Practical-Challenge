/* 102535342
Blake van der Wal */

/* Relational Schema

Tour, (TourName, Description)
PK, (TourName)

Client, (ClientID, Surname, GivenName, Gender)
PK, (ClientID)

Event, (EventYear, EventMonth, EventDay, Fee, TourName)
PK, (EventYear, EventMonth, EventDay, TourName)
FK, (TourName)

Booking, (DateBooked, Payment, ClientID, EventYear, EventMonth, EventDay, Fee)
PK, (EventYear, EventMonth, EventDay, ClientID)
FK, (EventYear, EventMonth, EventDay, ClientID, Fee) */

IF OBJECT_ID('dbo.Tour', 'U') IS NOT NULL
DROP TABLE dbo.Tour
GO

CREATE TABLE dbo.Tour
(
    TourName [NVARCHAR](50) NOT NULL PRIMARY KEY,
    Description [NVARCHAR](100) NOT NULL
);
GO

INSERT INTO dbo.Tour
    ([TourName], [Description])

VALUES
    ('North', 'Tour of wineries and outlets of the Bedigo and Castlemaine region'),
    ('South', 'Tour of wineries and outlets of Mornington Penisula'),
    ('West', 'Tour of wineries and outlets of the Geelong and Otways region')

GO

SELECT *
FROM DBO.TOUR

IF OBJECT_ID('dbo.client', 'U') IS NOT NULL
DROP TABLE dbo.client
GO

CREATE TABLE dbo.client
(
    ClientID INT NOT NULL PRIMARY KEY,
    Surname [NVARCHAR](50) NOT NULL,
    GivenName [NVARCHAR](50) NOT NULL,
    Gender [NVARCHAR] (50) NOT NULL,
);
GO

INSERT INTO dbo.Client
    ([ClientID], [Surname], [GivenName], [Gender])

VALUES
    (1, 'Price', 'Taylor', 'M'),
    (2, 'Gamble', 'Ellyse', 'F'),
    (3, 'Tan', 'Tilly', 'F'),
    (102535342, 'van der Wal', 'Blake', 'M')

GO

SELECT *
FROM dbo.Client

IF OBJECT_ID('dbo.Event', 'U') IS NOT NULL
DROP TABLE dbo.Event
GO

CREATE TABLE dbo.Event
(
    EventYear INT,
    EventMonth [NVARCHAR] (50),
    EventDay INT,
    Fee INT,
    TourName [NVARCHAR] (50),
    PRIMARY KEY (EventYear, EventMonth, EventDay, TourName),
    FOREIGN KEY (TourName) REFERENCES TOUR
);
GO

INSERT INTO dbo.Event
    ([EventYear], [EventMonth], [EventDay], [Fee], [TourName])

VALUES
    (2016, 'Jan', 9, 200, 'North'),
    (2016, 'Feb', 13, 225, 'North'),
    (2016, 'Jan', 9, 200, 'South'),
    (2016, 'Jan', 16, 200, 'South'),
    (2016, 'Jan', 29, 225, 'West')

    GO

SELECT *
from dbo.Event


IF OBJECT_ID('dbo.Booking', 'U') IS NOT NULL
DROP TABLE dbo.Booking
GO

CREATE TABLE dbo.Booking
(
    DateBooked INT,
    Payment INT,
    ClientID INT,
    EventYear INT,
    EventMonth [NVARCHAR] (50),
    EventDay INT,
    TourName [NVARCHAR] (50),
    Fee INT,
    PRIMARY KEY (EventYear, EventMonth, EventDay, TourName, ClientID),
    FOREIGN KEY (EventYear, EventMonth, EventDay, TourName) REFERENCES EVENT,
    FOREIGN KEY (ClientID) REFERENCES CLIENT

);
GO

INSERT INTO dbo.Booking
    ([DateBooked], [Payment], [ClientID], [EventYear], [EventMonth], [EventDay], [TourName], [Fee])

VALUES
    (10/12/2015, 200, 1, 2016, 'Jan', 9, 'North', 200),
    (16/12/2015, 200, 2, 2016, 'Jan', 9, 'North', 200),
    (08/01/2016, 225, 1, 2016, 'Feb', 13, 'North', 200),
    (14/01/2016, 125, 2, 2016, 'Feb', 13, 'North', 125),
    (03/02/2016, 225, 3, 2016, 'Feb', 13, 'North', 225),
    (10/12/2015, 200, 1, 2016, 'Jan', 9, 'South', 200),
    (18/12/2015, 200, 2, 2016, 'Jan', 16, 'South', 200),
    (09/01/2016, 200, 3, 2016, 'Jan', 16, 'South', 200),
    (17/12/2015, 225, 2, 2016, 'Jan', 29, 'West', 225),
    (18/12/2015, 200, 3, 2016 , 'Jan', 29, 'West', 200)

    GO

SELECT *
from dbo.Booking
