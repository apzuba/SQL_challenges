
-- A construction company pays its workers on an hourly basis. 
-- Given a database of employee information, return a list of employee names 
-- and the amounts they are owed. The amount owed is the sum of the hours worked 
-- times 30 per hour, plus any previous balance. 
-- Only include employees who are owed an amount, and order the result by employee name.


CREATE TABLE LABORERS (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(30),
    previous_balance INT
);

CREATE TABLE DAILY_HOURS (
    labor_id SERIAL NOT NULL,
    entry_time VARCHAR(20),
    exit_time VARCHAR(20),
	FOREIGN KEY(labor_id) REFERENCES EMPLOYEE(id)
);

INSERT INTO LABORERS(id, name,previous_balance) VALUES
(338, 'Kasi Linder', 155),
(339, 'Roxann Rawls', 319),
(340, 'Perla Rahman', 259),
(341, 'Dotty Naranjo', 447),
(342, 'Christy Mitten', 254);

INSERT INTO DAILY_HOURS(labor_id, entry_time, exit_time) 
VALUES 
(342, '2022-01-03 06:56:34', '2022-01-03 15:56:34'),
(340, '2022-01-20 10:34:47', '2022-01-20 17:34:47'),
(339, '2022-01-07 05:41:48', '2022-01-07 12:41:48'),
(340, '2022-01-10 16:57:30', '2022-01-11 00:57:30'),
(342, '2022-01-20 09:45:09', '2022-01-20 16:45:09'),
(339, '2022-01-02 01:27:55', '2022-01-02 08:27:55'),
(340, '2022-01-21 23:04:45', '2022-01-22 04:04:45'),
(341, '2022-01-08 04:31:46', '2022-01-08 12:31:46'),
(339, '2022-01-26 02:30:34', '2022-01-26 12:30:34'),
(342, '2022-01-24 06:03:31', '2022-01-24 14:03:31'),
(338, '2022-01-07 18:05:08', '2022-01-08 03:05:08'),
(340, '2022-01-29 16:50:37', '2022-01-29 23:50:37'),
(341, '2022-01-11 03:51:25', '2022-01-11 13:51:25'),
(342, '2022-01-30 23:20:45', '2022-01-31 06:20:45');


SELECT name, amount_payable
FROM (
	SELECT l.name AS name, 
	CAST(SUM(
		ROUND(EXTRACT(EPOCH FROM (TO_TIMESTAMP(dh.exit_time, 'YYYY-MM-DD HH24:MI:SS') - 
		TO_TIMESTAMP(dh.entry_time, 'YYYY-MM-DD HH24:MI:SS')))/3600))*30 
		AS integer  
	) + l.previous_balance AS amount_payable
	FROM DAILY_HOURS dh 
	JOIN laborers l ON dh.labor_id = l.id
	GROUP BY l.name, l.previous_balance
) subquery
WHERE amount_payable > 0
ORDER BY name;