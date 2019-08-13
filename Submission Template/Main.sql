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
    Description [NVARCHAR](50) NOT NULL
);
GO


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
