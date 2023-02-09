CREATE DATABASE air_travel;

CREATE TABLE company
(
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    company_name varchar(30) NOT NULL UNIQUE
);

CREATE TABLE passenger
(
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY ,
    passenger_name varchar(30)
);


CREATE TABLE trip
(
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY ,
    company_id int NOT NULL REFERENCES company(id),
    plane varchar(30) NOT NULL,
    town_from varchar(30) NOT NULL,
    town_to varchar(30) NOT NULL,
    time_out timestamp NOT NULL,
    time_in timestamp NOT NULL

);

CREATE TABLE pass_in_trip
(
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    trip_id int NOT NULL REFERENCES trip(id),
    passenger_id int NOT NULL REFERENCES passenger (id),
    place varchar(30) NOT NULL
);



INSERT INTO company (company_name) VALUES ('Don_avia'),
                                          ('Aeroflot'),
                                          ('Dale_avia'),
                                          ('air_France'),
                                          ('British_AW');



INSERT INTO passenger (passenger_name) VALUES ('Bruce Willis'),
                                              ('George Clooney'),
                                              ('Kevin Costner'),
                                              ('Donald Sutherland'),
                                              ('Jennifer Lopez'),
                                              ('Ray Liotta'),
                                              ('Samuel L. Jackson'),
                                              ('Nikole Kidman'),
                                              ('Alan Rickman'),
                                              ('Kurt Russell'),
                                              ('Harrison Ford'),
                                              ('Russell Crowe'),
                                              ('Steve Martin'),
                                              ('Michael Caine'),
                                              ('Angelina Jolie'),
                                              ('Mel Gibson'),
                                              ('Michael Douglas'),
                                              ('John Travolta'),
                                              ('Sylvester Stallone'),
                                              ('Tommy Lee Jones');


INSERT INTO trip (company_id, plane, town_from, town_to, time_out, time_in) VALUES (4, 'Boeing', 'Rostov', 'Paris',
                                                                                    '1900-01-01T14:30:00.000Z',
                                                                                    '1900-01-01T17:50:00.000Z');
INSERT INTO trip (company_id, plane, town_from, town_to, time_out, time_in) VALUES (4, 'Boeing', 'Paris', 'Rostov',
                                                                                    '1900-01-01T08:12:00.000Z',
                                                                                    '1900-01-01T11:45:00.000Z'),
                                                                                   (3, 'TU-154','Rostov','Vladivostok',
                                                                                    '1900-01-01T16:20:00.000Z',
                                                                                    '1900-01-02T03:40:00.000Z'),
                                                                                   (3, 'TU-154', 'Vladivostok', 'Rostov',
                                                                                    '1900-01-01T09:00:00.000Z',
                                                                                    '1900-01-01T19:50:00.000Z'),
                                                                                   (2, 'IL-86', 'Moscow', 'Rostov',
                                                                                    '1900-01-01T09:35:00.000Z',
                                                                                    '1900-01-01T11:23:00.000Z'),
                                                                                   (2, 'IL-86', 'Rostov', 'Moscow',
                                                                                    '1900-01-01T17:55:00.000Z',
                                                                                    '1900-01-01T20:01:00.000Z'),
                                                                                   (1, 'TU-134', 'Moscow', 'Rostov',
                                                                                    '1900-01-01T12:35:00.000Z',
                                                                                    '1900-01-01T14:30:00.000Z'),
                                                                                   (1, 'TU-134', 'Rostov','Moscow',
                                                                                    '1900-01-01T06:12:00.000Z',
                                                                                    '1900-01-01T08:01:00.000Z'),
                                                                                   (1, 'TU-134', 'Rostov','Moscow',
                                                                                    '1900-01-01T15:42:00.000Z',
                                                                                    '1900-01-01T17:39:00.000Z'),
                                                                                   (1, 'TU-134', 'Moscow', 'Rostov',
                                                                                    '1900-01-01T22:50:00.000Z',
                                                                                    '1900-01-02T00:48:00.000Z'),
                                                                                   (1, 'TU-134', 'Rostov','Moscow',
                                                                                    '1900-01-01T23:30:00.000Z',
                                                                                    '1900-01-02T01:11:00.000Z'),
                                                                                   (1, 'TU-134', 'Moscow', 'Rostov',
                                                                                    '1900-01-01T04:00:00.000Z',
                                                                                    '1900-01-01T05:45:00.000Z'),
                                                                                   (5, 'Boeing', 'London', 'Singapore',
                                                                                    '1900-01-01T01:00:00.000Z',
                                                                                    '1900-01-01T11:00:00.000Z'),
                                                                                   (5, 'Boeing', 'London', 'Singapore',
                                                                                    '1900-01-01T12:00:00.000Z',
                                                                                    '1900-01-02T02:00:00.000Z'),
                                                                                   (5, 'Boeing', 'London', 'Singapore',
                                                                                    '1900-01-01T03:00:00.000Z',
                                                                                    '1900-01-01T13:00:00.000Z'),
                                                                                   (5, 'Boeing', 'London', 'Singapore',
                                                                                    '1900-01-01T14:00:00.000Z',
                                                                                    '1900-01-02T06:00:00.000Z'),
                                                                                   (5, 'Boeing', 'London', 'Paris',
                                                                                    '1900-01-01T03:00:00.000Z',
                                                                                    '1900-01-01T04:00:00.000Z'),
                                                                                   (5, 'Boeing', 'Paris', 'London',
                                                                                    '1900-01-01T22:00:00.000Z',
                                                                                    '1900-01-01T23:00:00.000Z');

INSERT INTO pass_in_trip (trip_id, passenger_id, place) VALUES (1, 1, '1a'),
                                                               (2, 3, '2a'),
                                                               (3 , 1, '4c'),
                                                               (4, 13, '1d'),
                                                               (5, 13, '2d'),
                                                               (6, 14, ' 4d'),
                                                               (7, 11, '4a');



--1
SELECT (passenger_name) FROM passenger;

--2
SELECT (company_name) FROM company;

--3
SELECT * FROM trip WHERE town_from = 'Moscow';

--4
SELECT (passenger_name) FROM passenger
WHERE passenger_name LIKE  '%man';

--5
SELECT * FROM trip WHERE plane = 'TU-134';

--6
SELECT company_name, plane FROM trip JOIN company
                                          ON trip.company_id = company.id
WHERE plane = 'Boeing';

--7
SELECT plane FROM trip WHERE town_to = 'Moscow';

--9
SELECT company_name, town_from
FROM trip JOIN company c on c.id = trip.company_id
WHERE town_from = 'Vladivostok';

--12
SELECT trip.id, count(pass_in_trip.passenger_id) as passenger_count FROM trip JOIN pass_in_trip ON trip.id = pass_in_trip.trip_id
group by trip.id;

--14
SELECT town_from FROM trip JOIN pass_in_trip ON trip.id = pass_in_trip.trip_id
WHERE passenger_id = 1;

--15
SELECT time_in, time_out FROM trip JOIN pass_in_trip ON trip.id = pass_in_trip.trip_id
WHERE passenger_id = 13 AND town_to = 'London';

--16
SELECT count(*) FROM trip
WHERE town_from = 'Rostov' AND town_to = 'Moscow';


--17
SELECT passenger_name FROM passenger
WHERE LENGTH (passenger_name) =
(SELECT MAX (LENGTH (passenger_name)) FROM passenger);

--18
SELECT passenger_name FROM passenger
GROUP BY passenger_name HAVING count(passenger_name) > 1;

----19
SELECT passenger_name, count(*) FROM passenger JOIN pass_in_trip
ON passenger.id = pass_in_trip.passenger_id
GROUP BY passenger_name
HAVING count(trip_id) >= 1
ORDER BY count(trip_id) DESC , passenger_name ASC;

--20
SELECT company_name, count(*)FROM trip JOIN company
ON trip.company_id = company.id
WHERE town_from = 'Rostov' AND town_to = 'Moscow'
group by company_name;

--21
DELETE FROM trip
WHERE town_from = 'Moscow';

