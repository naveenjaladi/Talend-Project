/* 1. What is the total revenue for New business in 2011*/
SELECT sum(TRANSACTION_AMT) AS TOTAL_NEW_BUSINESS_REVENUE,TRANSACTION_TYPE
FROM transaction_dim WHERE TRANSACTION_TYPE='NB' AND DATE LIKE '%2011%';

/* 2. What is the total new business transactions amount per Agent */
SELECT DISTINCT A.AGENT_NAME,B.TRANSACTION_TYPE,B.NEW_BUSINESS_TOTAL FROM agent_dim A JOIN (SELECT *,sum(TRANSACTION_AMT) AS NEW_BUSINESS_TOTAL
FROM transaction_dim where TRANSACTION_TYPE='NB' group by AGENT_ID) B ON A.AGENT_ID=B.AGENT_ID;

/* 3.Who are top three performing agents for renewals? */
SELECT DISTINCT A.AGENT_NAME, TRANSACTION_TYPE, RENEWALS_TOTAL
FROM agent_dim A JOIN (SELECT *, sum(TRANSACTION_AMT) as RENEWALS_TOTAL
FROM transaction_dim WHERE TRANSACTION_TYPE='REN' GROUP BY AGENT_ID) B ON A.AGENT_ID = B.AGENT_ID
order by renewals_total DESC limit 3;

/* 4.What is the most popular payment method? */
select payment_method,count(*) as TRANSACTION_COUNT 
from policy_fact group by PAYMENT_METHOD order by TRANSACTION_COUNT DESC limit 1;