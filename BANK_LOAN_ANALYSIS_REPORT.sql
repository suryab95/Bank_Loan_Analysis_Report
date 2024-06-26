SELECT * FROM `bank_loan`.`bank_loan_analysis`;
SELECT count(ID) AS TOTAL_APPLICATIONS FROM bank_loan.bank_loan_analysis;

-- MTD LOAN APPLICATIONS
SELECT COUNT(ID) AS TOTAL_APPLICATIONS FROM bank_loan.bank_loan_analysis
WHERE MONTH(issue_date) =12;
-- MTD LOAN APPLICATIONS
SELECT COUNT(ID) AS TOTAL_APPLICATIONS FROM bank_loan.bank_loan_analysis
WHERE MONTH(issue_date) =12 AND YEAR(ISSUE_DATE)=2021;

-- TOATAL FUNDED AMOUNT
SELECT SUM(loan_amount) AS TOTAL_FUNDED_AMOUNT FROM bank_loan.bank_loan_analysis;
-- TOATAL  AMOUNT RECEIVED
SELECT SUM(total_payment) AS TOTAL_FUNDED_AMOUNT FROM bank_loan.bank_loan_analysis;

--- AVERAGE INTERSET RATE
SELECT ROUND(avg(INT_RATE),4)* 100 AS AVERAGE_INTEREST_RATE FROM bank_loan.bank_loan_analysis
where month(ISSUE_DATE)=12 AND YEAR(issue_date)=2021;

--- Average Debt-to-Income Ratio (DTI):
SELECT ROUND(avg(dti),4)*100  AS AVERAGE_DTI_RATIO  FROM bank_loan.bank_loan_analysis
where month(ISSUE_DATE)=12 AND YEAR(issue_date)=2021;

--- Good Loan Application Percentage
SELECT
	(COUNT(CASE WHEN LOAN_STATUS ="FULLY PAID" OR LOAN_STATUS="CURRENT" THEN ID END ) *100) /
     COUNT(ID) AS GOOD_LOAN_PERCENTAGE
  FROM bank_loan.bank_loan_analysis;
--- GOOD LOAN APPLICATIONS
SELECT count(ID) AS GOOD_LOAN_APPLICATIONS FROM bank_loan.BANK_LOAN_ANALYSIS WHERE LOAN_STATUS = 'FULLY PAID' OR 'CURRENT'; 

 --- GOOD LOAN FUNDED AMOUNT
SELECT sum(LOAN_AMOUNT) AS GOOD_LOAN_FUNDED_AMOUNT FROM bank_loan.bank_loan_analysis
WHERE LOAN_STATUS ="FULLY PAID" OR LOAN_STATUS="CURRENT" ;
 --- GOOD LOAN RECEIVED AMOUNT
SELECT sum(TOTAL_PAYMENT) AS GOOD_LOAN_RECEIVED_AMOUNT FROM bank_loan.bank_loan_analysis
WHERE LOAN_STATUS ="FULLY PAID" OR LOAN_STATUS="CURRENT" ;

-- BAD LOAN PERCENTAGE
SELECT 
	(count(CASE WHEN LOAN_STATUS ='CHARGED OFF' THEN ID END) * 100)/ 
		COUNT(ID) AS BAD_LOAN_PERCENTAGE
FROM bank_loan.BANK_LOAN_ANALYSIS;
-- BAD LOAN APPLICATION
select COUNT(ID) AS BAD_LOAN_APPLICATIONS FROM bank_loan.bank_loan_analysis WHERE LOAN_STATUS = 'CHARGED OFF' ;
-- BAD LOAN FUNDED AMOUNT
select SUM(LOAN_AMOUNT) AS BAD_LOAN_FUNDED_AMOUNT FROM bank_loan.bank_loan_analysis WHERE LOAN_STATUS = 'CHARGED OFF' ;
-- BAD LOAN RECEIVED AMOUNT
select SUM(TOTAL_PAYMENT) AS BAD_LOAN_FUNDED_AMOUNT FROM bank_loan.bank_loan_analysis WHERE LOAN_STATUS = 'CHARGED OFF' ;



--- DASHBOARD 2
select
LOAN_STATUS,
COUNT(ID) AS LOAN_COUNT,
SUM(LOAN_AMOUNT) AS TOTAL_FUNDED_AMOUNT,
SUM(TOTAL_PAYMENT) AS TOTAL_AMOUNT_RECEIVED,
ROUND(AVG(INT_RATE),2) AS AVERAGE_INTERSEST_RATE,
ROUND(AVG(DTI),2) AS AVERAGE_DTI 
FROM bank_loan.bank_loan_analysis
GROUP BY LOAN_STATUS;


-- MTD LOAN AMOUNT
select 
LOAN_STATUS,
SUM(LOAN_AMOUNT) AS MTD_TOTAL_FUNDED_AMOUNT,
SUM(TOTAL_PAYMENT) AS MTD_TOTAL_AMOUNT_RECEIVED
FROM bank_loan.bank_loan_analysis
WHERE MONTH(ISSUE_DATE)=12
GROUP BY LOAN_STATUS;

-- REGINOL ANALYSIS
SELECT ADDRESS_STATE AS STATE,
COUNT(ID) AS TOTAL_LOAN_COUNT,
SUM(LOAN_AMOUNT) AS TOTAL_FUNDED_AMOUNT,
SUM(TOTAL_PAYMENT) AS TOTAL_AMOUNT_RECEIVED
FROM bank_loan.bank_loan_analysis
GROUP BY address_state;

-- BANK LOAN REPORT OVERVIEW
SELECT 
month(ISSUE_DATE) AS MONTH_NUMBER,
monthname(ISSUE_DATE) AS MONTH_NAME,
COUNT(ID) AS TOTAL_LOAN_APPLICATIONS,
SUM(LOAN_AMOUNT) AS TOTAL_FUNDED_AMOUNT,
SUM(TOTAL_PAYMENT) AS TOTAL_AMOUNT_RECEIVED
 FROM bank_loan.bank_loan_analysis
GROUP BY month(ISSUE_DATE), monthname(issue_date)
order by month(ISSUE_DATE);


---- REGINOL ANALYSIS
SELECT 
ADDRESS_STATE,
COUNT(ID) AS TOTAL_LOAN_APPLICATIONS,
SUM(LOAN_AMOUNT) AS TOTAL_FUNDED_AMOUNT,
SUM(TOTAL_PAYMENT) AS TOTAL_AMOUNT_RECEIVED
 FROM bank_loan.bank_loan_analysis
GROUP BY ADDRESS_STATE
order by ADDRESS_STATE desc;

-- TERM ANALYSIS
SELECT 
TERM,
COUNT(ID) AS TOTAL_LOAN_APPLICATIONS,
SUM(LOAN_AMOUNT) AS TOTAL_FUNDED_AMOUNT,
SUM(TOTAL_PAYMENT) AS TOTAL_AMOUNT_RECEIVED
 FROM bank_loan.bank_loan_analysis
GROUP BY TERM
order by TERM;

-- EMPLOYEE LENGTH
SELECT 
emp_length,
COUNT(ID) AS TOTAL_LOAN_APPLICATIONS,
SUM(LOAN_AMOUNT) AS TOTAL_FUNDED_AMOUNT,
SUM(TOTAL_PAYMENT) AS TOTAL_AMOUNT_RECEIVED
 FROM bank_loan.bank_loan_analysis
GROUP BY emp_length
order by COUNT(ID);

--- PURPOSE
SELECT 
purpose,
COUNT(ID) AS TOTAL_LOAN_APPLICATIONS,
SUM(LOAN_AMOUNT) AS TOTAL_FUNDED_AMOUNT,
SUM(TOTAL_PAYMENT) AS TOTAL_AMOUNT_RECEIVED
 FROM bank_loan.bank_loan_analysis
GROUP BY purpose
order by purpose DESC ;

--- PURPOSE
SELECT 
home_ownership,
COUNT(ID) AS TOTAL_LOAN_APPLICATIONS,
SUM(LOAN_AMOUNT) AS TOTAL_FUNDED_AMOUNT,
SUM(TOTAL_PAYMENT) AS TOTAL_AMOUNT_RECEIVED
 FROM bank_loan.bank_loan_analysis
GROUP BY home_ownership
order by COUNT(ID) DESC ;




