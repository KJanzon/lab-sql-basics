{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Query 1: Get the ID values of the first 5 clients from district_id = 1\
SELECT client_id \
FROM client \
WHERE district_id = 1 \
ORDER BY client_id \
LIMIT 5;\
\
-- Query 2: Get the ID of the last client where district_id = 72\
SELECT client_id \
FROM client \
WHERE district_id = 72 \
ORDER BY client_id DESC \
LIMIT 1;\
\
-- Query 3: Get the 3 lowest amounts in the loan table\
SELECT amount \
FROM loan \
ORDER BY amount \
LIMIT 3;\
\
-- Query 4: Possible values for status ordered alphabetically\
SELECT DISTINCT status \
FROM loan \
ORDER BY status ASC;\
\
-- Query 5: Loan ID of the highest payment received\
SELECT loan_id \
FROM loan \
ORDER BY payments DESC \
LIMIT 1;\
\
-- Query 6: Loan amount of the lowest 5 account_ids\
SELECT account_id, amount \
FROM loan \
ORDER BY account_id \
LIMIT 5;\
\
-- Query 7: Account IDs with the lowest loan amount where duration = 60\
SELECT account_id \
FROM loan \
WHERE duration = 60 \
ORDER BY amount ASC \
LIMIT 5;\
\
-- Query 8: Unique values of k_symbol in the order table\
SELECT DISTINCT k_symbol \
FROM `order`;\
\
-- Query 9: Order IDs for client with account_id = 34\
SELECT order_id \
FROM `order` \
WHERE account_id = 34;\
\
-- Query 10: Account IDs for orders between order_id 29540 and 29560\
SELECT DISTINCT account_id \
FROM `order` \
WHERE order_id BETWEEN 29540 AND 29560;\
\
-- Query 11: Individual amounts sent to account_to 30067122\
SELECT amount \
FROM `order` \
WHERE account_to = 30067122;\
\
-- Query 12: First 10 transactions for account_id 793 ordered newest to oldest\
SELECT trans_id, date, type, amount \
FROM trans \
WHERE account_id = 793 \
ORDER BY date DESC \
LIMIT 10;\
\
-- Query 13: Count of clients per district_id lower than 10\
SELECT district_id, COUNT(*) AS client_count \
FROM client \
WHERE district_id < 10 \
GROUP BY district_id \
ORDER BY district_id ASC;\
\
-- Query 14: Count of cards per type ranked by frequency\
SELECT type, COUNT(*) AS card_count \
FROM card \
GROUP BY type \
ORDER BY card_count DESC;\
\
-- Query 15: Top 10 account_ids by total loan amount\
SELECT account_id, SUM(amount) AS total_loan \
FROM loan \
GROUP BY account_id \
ORDER BY total_loan DESC \
LIMIT 10;\
\
-- Query 16: Number of loans issued per day before 930907\
SELECT date, COUNT(*) AS loan_count \
FROM loan \
WHERE date < 930907 \
GROUP BY date \
ORDER BY date DESC;\
\
-- Query 17: Loans issued per unique duration in December 1997\
SELECT date, duration, COUNT(*) \
FROM loan \
WHERE date BETWEEN 971201 AND 971231 \
GROUP BY date, duration \
ORDER BY date ASC, duration ASC;\
\
-- Query 18: Sum of transactions for account_id 396 by type\
SELECT account_id, type, SUM(amount) AS total_amount \
FROM trans \
WHERE account_id = 396 \
GROUP BY type \
ORDER BY type ASC;\
}