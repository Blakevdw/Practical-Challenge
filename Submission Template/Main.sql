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

Booking, (DataBooked, Payment, ClientID, EventYear, EventMonth, EventDay, Fee)
PK, (EventYear, EventMonth, EventDay, ClientID)
FK, (EvenntYear, EventMonth, EventDay, ClientID)
