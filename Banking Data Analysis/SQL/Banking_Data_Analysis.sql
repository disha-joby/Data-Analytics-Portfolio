USE ASSIGNMENT3_BANK;

SELECT * FROM dbo.[bank-full];

SELECT COUNT(*) AS total_rows FROM dbo.[bank-full];
------------------------------------------------------------------
SELECT TOP 5
    job,
    COUNT(*) AS total_clients,
    AVG(CAST(balance AS DECIMAL(18, 2))) AS average_balance
FROM dbo.[bank-full]
GROUP BY job
ORDER BY average_balance DESC;
------------------------------------------------------------------
WITH CampaignSummary AS (
    SELECT
        education,
        COUNT(*) AS total_clients,
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)
            AS successful_clients
    FROM dbo.[bank-full]
    GROUP BY education
)
SELECT
    e.education,
    e.total_clients,
    e.successful_clients,
    CAST(
        100.0 * e.successful_clients
        / NULLIF(e.total_clients, 0)
        AS DECIMAL(5, 2)
    ) AS success_rate_percent
FROM CampaignSummary AS e
INNER JOIN (
    SELECT DISTINCT education
    FROM dbo.[bank-full]
) AS d
    ON e.education = d.education
ORDER BY success_rate_percent DESC;
------------------------------------------------------------------
CREATE VIEW dbo.vw_ClientSummary
AS
SELECT
    age,
    job,
    marital,
    education,
    balance,
    housing,
    loan,
    CASE WHEN housing = 'yes' THEN 1 ELSE 0 END
      + CASE WHEN loan = 'yes' THEN 1 ELSE 0 END
        AS number_of_loan_types
FROM dbo.[bank-full];

SELECT * FROM dbo.vw_ClientSummary;
------------------------------------------------------------------
CREATE VIEW dbo.vw_CampaignPerformance
AS
SELECT
    month,
    COUNT(*) AS total_clients,
    SUM(campaign) AS total_contacts,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)
        AS successful_clients,
    CAST(
        100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0)
        AS DECIMAL(5, 2)
    ) AS success_rate_percent
FROM dbo.[bank-full]
GROUP BY month;

SELECT *
FROM dbo.vw_CampaignPerformance
ORDER BY
    CASE month
        WHEN 'jan' THEN 1 WHEN 'feb' THEN 2
        WHEN 'mar' THEN 3 WHEN 'apr' THEN 4
        WHEN 'may' THEN 5 WHEN 'jun' THEN 6
        WHEN 'jul' THEN 7 WHEN 'aug' THEN 8
        WHEN 'sep' THEN 9 WHEN 'oct' THEN 10
        WHEN 'nov' THEN 11 WHEN 'dec' THEN 12
        ELSE 13
    END;
------------------------------------------------------------------
CREATE INDEX IX_bank_full_age
ON dbo.[bank-full] (age);

CREATE INDEX IX_bank_full_job
ON dbo.[bank-full] (job);

CREATE INDEX IX_bank_full_marital
ON dbo.[bank-full] (marital);

SELECT
    name AS index_name,
    type_desc
FROM sys.indexes
WHERE object_id = OBJECT_ID('dbo.[bank-full]')
  AND name IS NOT NULL;
------------------------------------------------------------------
-- SINCE THERE ISNT REAL TRANSACTION DETAILS FOR THIS DATASET
-- I HAVE USED 2 FALSE TABLES TO DEMOSTRATE HOW THE PROCEDURE WOULD WORK

CREATE TABLE dbo.Clients (
    ClientID INT PRIMARY KEY,
    ClientName VARCHAR(100),
    Balance DECIMAL(12, 2)
);

CREATE TABLE dbo.TransactionHistory (
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT,
    TransactionAmount DECIMAL(12, 2),
    FOREIGN KEY (ClientID)
        REFERENCES dbo.Clients(ClientID)
);

INSERT INTO dbo.Clients
    (ClientID, ClientName, Balance)
VALUES
    (1, 'Client A', 1000.00),
    (2, 'Client B', 2000.00),
    (3, 'Client C', 1500.00);

INSERT INTO dbo.TransactionHistory
    (ClientID, TransactionAmount)
VALUES
    (1, 500.00),
    (1, -100.00),
    (2, 300.00),
    (2, -50.00),
    (3, 200.00);

SELECT * FROM dbo.Clients
SELECT * FROM dbo.TransactionHistory

CREATE PROCEDURE dbo.UpdateClientBalance
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE c
    SET c.Balance = c.Balance + COALESCE(t.TotalAmount, 0)
    FROM dbo.Clients AS c
    LEFT JOIN (
        SELECT
            ClientID,
            SUM(TransactionAmount) AS TotalAmount
        FROM dbo.TransactionHistory
        GROUP BY ClientID
    ) AS t
        ON c.ClientID = t.ClientID;
END;

EXEC dbo.UpdateClientBalance;

SELECT * FROM dbo.Clients;
------------------------------------------------------------------