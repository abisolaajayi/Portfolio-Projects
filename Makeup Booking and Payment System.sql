CREATE TABLE Clients (
    client_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    phone NVARCHAR(30),
    email NVARCHAR(100),
    instagram NVARCHAR(50)
);

CREATE TABLE Services (
    service_id INT IDENTITY(1,1) PRIMARY KEY,
    service_name NVARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Appointments (
    appointment_id INT IDENTITY(1,1) PRIMARY KEY,
    client_id INT NOT NULL,
    service_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status NVARCHAR(20) DEFAULT 'Booked',
    notes NVARCHAR(255),

    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

INSERT INTO Clients (first_name, last_name, phone, email, instagram)
VALUES ('Eniola', 'Adegbule', '12406040434', 'eniolaadeg@gmail.com', '@eniola');

INSERT INTO Appointments (client_id, service_id, appointment_date, appointment_time, status, notes)
VALUES (1, 1, '2025-01-05', '09:00', 'Booked', 'Soft glam trial');

INSERT INTO Services (service_name, price)
VALUES 
('Soft Glam', 80),
('Full Glam', 120);

SELECT * FROM Services;

INSERT INTO Appointments (client_id, service_id, appointment_date, appointment_time, status, notes)
VALUES (1, 1, '2025-01-05', '09:00', 'Booked', 'Soft glam');

SELECT * FROM Clients;

INSERT INTO Appointments (client_id, service_id, appointment_date, appointment_time, status, notes)
VALUES (1, 1, '2025-01-05', '09:00', 'Booked', 'Soft glam');

SELECT * FROM Clients;
SELECT * FROM Services;

INSERT INTO Appointments (client_id, service_id, appointment_date, appointment_time, status, notes)
VALUES (1, 1, '2025-01-05', '09:00', 'Booked', 'Soft glam');

SELECT * FROM Clients;
SELECT * FROM Services;
SELECT * FROM Appointments;

CREATE TABLE Payments (
    payment_id INT IDENTITY(1,1) PRIMARY KEY,
    appointment_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_type NVARCHAR(20) NOT NULL,   -- Deposit, Balance, Full
    payment_method NVARCHAR(30),          -- Cash, Zelle, Card, etc.
    payment_status NVARCHAR(20) DEFAULT 'Paid',
    payment_date DATE DEFAULT GETDATE(),

    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

SELECT * FROM Appointments;

SELECT * FROM Clients;
SELECT * FROM Services;
SELECT * FROM Appointments;

INSERT INTO Payments (appointment_id, amount, payment_type, payment_method, payment_status)
VALUES (2, 50, 'Deposit', 'Zelle', 'Paid');

SELECT * FROM Payments;

SELECT SUM(amount) AS total_revenue
FROM Payments
WHERE payment_status = 'Paid';

SELECT payment_type, SUM(amount) AS total_amount
FROM Payments
GROUP BY payment_type;

SELECT s.service_name, SUM(p.amount) AS total_revenue
FROM Payments p
JOIN Appointments a ON p.appointment_id = a.appointment_id
JOIN Services s ON a.service_id = s.service_id
GROUP BY s.service_name;

SELECT 
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent
FROM Payments p
JOIN Appointments a ON p.appointment_id = a.appointment_id
JOIN Clients c ON a.client_id = c.client_id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC;

INSERT INTO Clients (first_name, last_name, phone, email, instagram)
VALUES
('Blessing', NULL, NULL, NULL, NULL),
('Jovi', NULL, NULL, NULL, NULL),

('Tehilla', 'Agyeman', '+12242374118', 'tehillaboachie.1@gmail.com', NULL),
('Abisola', 'Ajayi', '2404138747', 'abiso09@gmail.com', NULL),
('Olufikayo', 'Alabi', '+13018024286', 'Olufikayoalabi@gmail.com', NULL),
('Ruth', 'Awoyera', NULL, 'raawoyera@gmail.com', NULL),
('Oreoluwa', 'Ayinde', '+12022816636', 'oreoluwa439@gmail.com', NULL),
('Basiratu', 'Bello', '+15712990633', 'bello.basiratu@gmail.com', NULL),
('Bona', 'Busari', NULL, NULL, NULL),
('Ashley', 'Egeonu', '+13013394970', 'ashleyche321@gmail.com', NULL),
('Rena', 'Enwesi', '+12403748447', 'Renaenwesi@gmail.com', NULL),
('Lauryn', 'Gahkila', '4694318317', 'gahkilal@gmail.com', NULL),
('Alyssa', 'Gallishaw', '+13018067096', 'aly.gallishaw0457@hotmail.com', NULL),
('Kahira', 'Hicks', '+13473972957', 'kahirahicks@gmail.com', NULL),
('Areanna', 'Johnson', '+12623859355', 'areanna72@gmail.com', NULL),
('Vanessa', 'Koroma', '2403776419', 'vanessakanu18@gmail.com', NULL),
('Jane', 'McTest', '1235550101', 'jane.mctest@example.com', NULL),
('Lexi', 'Megginson', '+12672219500', 'leximegginson@gmail.com', NULL),
('Dorcus', 'Moore', '+12406818397', 'dorcusmoore26@yahoo.com', NULL),
('Gaelle', 'Njou', '+12404183414', 'gealle.njoumagem@gmail.com', NULL),
('Olabisi', 'Odediran', '+12404625910', 'odediran70@yahoo.co.uk', NULL),
('Shukurat', 'Olaitan', '+12404139578', 'shukudam@yahoo.co.uk', NULL),
('Erhuvwu', 'Orhoevwri', '+12406052013', 'orhonicole@yahoo.com', NULL),
('Opeyemi', 'Oshod', NULL, 'Opeyemioshod@gmail.com', NULL),
('Jarne', 'Smith', '+16193660910', 'jarnesmith@yahoo.com', NULL),
('Sydney', 'Stokes', '+12409700590', 'adr1hana111@gmail.com', NULL),
('Oyinkansola', 'Sulaiman', '3013168837', 'oyinkansolasulaiman0@gmail.com', NULL),
('Busola', 'Sule', '+13013854998', 'busola.sule@yahoo.com', NULL),
('Lara', 'Sule', '3013854998', 'busola.sule@yahoo.com', NULL),
('Feyi', 'Talabi', '+14109675227', 'feyi.talabi@gmail.com', NULL),
('Dyani', 'Toomer', '+12023446870', 'nkcanada03@yahoo.com', NULL),
('Onyeka', 'Udoye', '+12403743889', 'kachiudoye022@gmail.com', NULL),
('Jada', 'Williams', '+18048400688', 'jadanwilliams8199@gmail.com', NULL),
('Maleah', 'Williams', '+14435000191', 'maleah7@live.com', NULL);

SELECT * FROM Clients;

DECLARE @startDate DATE = '2025-01-01';

WITH Numbers AS (
    SELECT TOP (520)
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects
),
ClientsCTE AS (
    SELECT client_id,
           ROW_NUMBER() OVER (ORDER BY client_id) AS rn,
           COUNT(*) OVER () AS total_clients
    FROM Clients
)

INSERT INTO Appointments (client_id, service_id, appointment_date, appointment_time, status, notes)
SELECT 
    c.client_id,

    -- Alternate services (Soft Glam = 1, Full Glam = 2)
    CASE 
        WHEN n.n % 2 = 0 THEN 1 
        ELSE 2 
    END AS service_id,

    -- Spread across 52 weeks, 10 clients per week
    DATEADD(DAY, (n.n - 1) * 1, @startDate) AS appointment_date,

    -- Realistic time slots (9AM - 6PM rotation)
    CASE 
        WHEN n.n % 5 = 0 THEN '09:00'
        WHEN n.n % 5 = 1 THEN '11:00'
        WHEN n.n % 5 = 2 THEN '13:00'
        WHEN n.n % 5 = 3 THEN '15:00'
        ELSE '17:00'
    END AS appointment_time,

    'Booked' AS status,

    CASE 
        WHEN n.n % 2 = 0 THEN 'Soft Glam booking'
        ELSE 'Full Glam booking'
    END AS notes

FROM Numbers n
JOIN ClientsCTE c
    ON c.rn = ((n.n - 1) % c.total_clients) + 1;

SELECT COUNT(*) AS total_appointments FROM Appointments;

SELECT 
    SUM(amount) AS total_revenue
FROM Payments
WHERE payment_status = 'Paid';

SELECT * FROM Appointments;

-- Soft Glam or Full Glam depending on service_id
INSERT INTO Payments (appointment_id, amount, payment_type, payment_method, payment_status)
VALUES (2, 20, 'Deposit', 'Zelle', 'Paid');

DECLARE @appointment_id INT;
DECLARE @service_id INT;

DECLARE appointment_cursor CURSOR FOR
SELECT appointment_id, service_id
FROM Appointments;

OPEN appointment_cursor;
FETCH NEXT FROM appointment_cursor INTO @appointment_id, @service_id;

WHILE @@FETCH_STATUS = 0
BEGIN

    -- 💄 Soft Glam
    IF @service_id = 1
    BEGIN
        INSERT INTO Payments (appointment_id, amount, payment_type, payment_method, payment_status)
        VALUES (@appointment_id, 20, 'Deposit', 'Zelle', 'Paid');

        INSERT INTO Payments (appointment_id, amount, payment_type, payment_method, payment_status)
        VALUES (@appointment_id, 70, 'Balance', 'Cash', 'Paid');

        INSERT INTO Payments (appointment_id, amount, payment_type, payment_method, payment_status)
        VALUES (
            @appointment_id,
            FLOOR(RAND(CHECKSUM(NEWID())) * 20) + 1,
            'Tip',
            'Cash',
            'Paid'
        );
    END

    -- 💋 Full Glam
    ELSE IF @service_id = 2
    BEGIN
        INSERT INTO Payments (appointment_id, amount, payment_type, payment_method, payment_status)
        VALUES (@appointment_id, 20, 'Deposit', 'Zelle', 'Paid');

        INSERT INTO Payments (appointment_id, amount, payment_type, payment_method, payment_status)
        VALUES (@appointment_id, 100, 'Balance', 'Cash', 'Paid');

        INSERT INTO Payments (appointment_id, amount, payment_type, payment_method, payment_status)
        VALUES (
            @appointment_id,
            FLOOR(RAND(CHECKSUM(NEWID())) * 20) + 1,
            'Tip',
            'Cash',
            'Paid'
        );
    END

    FETCH NEXT FROM appointment_cursor INTO @appointment_id, @service_id;
END

CLOSE appointment_cursor;
DEALLOCATE appointment_cursor;

SELECT COUNT(*) AS total_payments FROM Payments;

SELECT SUM(amount) AS total_revenue
FROM Payments
WHERE payment_status = 'Paid';

SELECT COUNT(*) AS total_payments
FROM Payments;

SELECT COUNT(*) AS total_clients
FROM Clients;

SELECT COUNT(*) AS total_appointments
FROM Appointments;

SELECT 
    YEAR(payment_date) AS year,
    MONTH(payment_date) AS month,
    SUM(amount) AS revenue
FROM Payments
WHERE payment_status = 'Paid'
GROUP BY YEAR(payment_date), MONTH(payment_date)
ORDER BY year, month;

SELECT 
    s.service_name,
    SUM(p.amount) AS revenue
FROM Payments p
JOIN Appointments a ON p.appointment_id = a.appointment_id
JOIN Services s ON a.service_id = s.service_id
WHERE p.payment_status = 'Paid'
GROUP BY s.service_name;

SELECT TOP 10
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent
FROM Payments p
JOIN Appointments a ON p.appointment_id = a.appointment_id
JOIN Clients c ON a.client_id = c.client_id
WHERE p.payment_status = 'Paid'
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC;

SELECT 
    payment_type,
    SUM(amount) AS total_amount
FROM Payments
GROUP BY payment_type;

SELECT 
    appointment_date,
    COUNT(*) AS bookings
FROM Appointments
GROUP BY appointment_date
ORDER BY appointment_date;