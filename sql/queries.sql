/*Try using LIMIT yourself below by writing a query that displays all the data in the occurred_at, account_id, and channel columns of the web_events table, and limits the output to only the first 15 rows. */
SELECT occurred_at, account_id, channel FROM web_events LIMIT 15

/*Solutions to previous ORDER BY questions
*/

/*Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd.*/
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

/*Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd.*/

SELECT id, account_id, total
FROM orders
ORDER BY total
LIMIT 20;

/*top 5 orders in terms of largest account_id, total_amt_usd */
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC



/*Write a query that returns the top 5 rows from orders ordered from newest to oldest, but with the largest total_amt_usd for each date listed first. You will notice each of these dates shows up as unique because of the time element. When you learn about truncating dates in a later lesson, you will better be able to tackle this question on a day, month, or yearly basis.
*/

SELECT *
FROM orders
ORDER BY occurred_at DESC, total_amt_usd DESC
LIMIT 5;
/*
Write a query that returns the top 10 rows from orders ordered from oldest to newest, but with the smallest total_amt_usd for each date listed first. You will notice each of these dates shows up as unique because of the time element. When you learn about truncating dates in a later lesson, you will better be able to tackle this question on a day, month, or yearly basis.
*/

SELECT *
FROM orders
ORDER BY occurred_at , total_amt_usd ASC
LIMIT 10;


/*

Common symbols used in WHERE statements include:
Using the WHERE statement, we can display subsets of tables based on conditions that must be met. You can also think of the WHERE command as filtering the data.

    > (greater than)
    < (less than)
    >= (greater than or equal to)
    <= (less than or equal to)
    = (equal to)
    != (not equal to)
*/

/*
Pulls the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.
*/

SELECT *
    FROM orders
    WHERE gloss_amt_usd >= 1000
    LIMIT 5;
/*
Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.
*/
SELECT *
    FROM orders
    WHERE total_amt_usd < 500
    LIMIT 10;

/* The WHERE statement can also be used with non-numeric data. We can use the = and != operators here. You need to be sure to use single quotes (just be careful if you have quotes in the original text) with the text data, not double quotes.

Commonly when we are using WHERE with non-numeric data fields, we use the LIKE, NOT, or IN operators. We will see those before the end of this lesson!
*/

/*Practice Question Using WHERE with Non-Numeric Data

    Filter the accounts table to include the company name, website, and the primary point of contact (primary_poc) just for the Exxon Mobil company in the accounts table.

*/

SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

SELECT name,website
    FROM accounts
    WHERE primary_poc = '% Exxon Mobil'
    ;

/*
Derived Columns
Creating a new column that is a combination of existing columns is known as a derived column.
Common operators include:

    * (Multiplication)
    + (Addition)
    - (Subtraction)
    / (Division)
Order of Operations
Remember PEMDAS from math class to help remember the order of operations? If not, check out this link as a reminder. The same order of operations applies when using arithmetic operators in SQL.
The following two statements have very different end results:
    Standard_qty / standard_qty + gloss_qty + poster_qty
    standard_qty / (standard_qty + gloss_qty + poster_qty)
It is likely that you mean to do the calculation as written in statement number 2!

*/

/*

Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. Limit the results to the first 10 orders, and include the id and account_id fields.
*/

SELECT standard_amt_usd, standard_qty,id, account_id,
standard_amt_usd / standard_qty AS unit_unit

FROM orders
LIMIT 10;

/*
Write a query that finds the percentage of revenue that comes from poster paper for each order. You will need to use only the columns that end with _usd. (Try to do this without using the total column.) Display the id and account_id fields also. NOTE - you will receive an error with the correct solution to this question. This occurs because at least one of the values in the data creates a division by zero in your formula. You will learn later in the course how to fully handle this issue. For now, you can just limit your calculations to the first 10 orders, as we did in question #1, and you'll avoid that set of data that causes the problem.
*/


SELECT id, account_id,
   poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders
LIMIT 10


/*
The LIKE operator is extremely useful for working with text. You will use LIKE within a WHERE clause. The LIKE operator is frequently used with %. The % tells us that we might want any number of characters leading up to a particular set of characters or following a certain set of characters, as we saw with the google syntax above. Remember you will need to use single quotes for the text you pass to the LIKE operator, because of this lower and uppercase letters are not the same within the string. Searching for 'T' is not the same as searching for 't'. In other SQL environments (outside the classroom), you can use either single or double quotes.

Hopefully you are starting to get more comfortable with SQL, as we are starting to move toward operations that have more applications, but this also means we can't show you every use case. Hopefully, you can start to think about how you might use these types of applications to identify phone numbers from a certain region, or an individual where you can't quite remember the full name.
*/
LIKE
/*
filter all where names start with "C"
*/

SELECT * FROM accounts
WHERE name LIKE 'C%'

/* end with "S"*/
SELECT * FROM accounts
WHERE name LIKE '%s'

IN
/*
The IN operator is useful for working with both numeric and text columns. This operator allows you to use an =, but for more than one item of that particular column. We can check one, two or many column values for which we want to pull data, but all within the same query. In the upcoming concepts, you will see the OR operator that would also allow us to perform these tasks, but the IN operator is a cleaner way to write these queries.
Expert Tip

In most SQL environments, you can use single or double quotation marks - and you may NEED to use double quotation marks if you have an apostrophe within the text you are attempting to pull.

In the work spaces in the classroom, note you can include an apostrophe by putting two single quotes together. Example Macy's in our work space would be 'Macy''s'.


Solutions to IN Questions*/

    SELECT name, primary_poc, sales_rep_id
    FROM accounts
    WHERE name IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
    FROM web_events
    WHERE channel IN ('organic', 'adwords');

NOT IN

The NOT operator is an extremely useful operator for working with the previous two operators we introduced: IN and LIKE. By specifying NOT LIKE or NOT IN, we can grab all of the rows that do not meet a particular criteria.


Solutions: NOT
Solutions to NOT IN Questions

    SELECT name, primary_poc, sales_rep_id
    FROM accounts
    WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

    SELECT *
    FROM web_events
    WHERE channel NOT IN ('organic', 'adwords');

Solutions to NOT LIKE Questions

    SELECT name
    FROM accounts
    WHERE name NOT LIKE 'C%';

    SELECT name
    FROM accounts
    WHERE name NOT LIKE '%one%';

    SELECT name
    FROM accounts
    WHERE name NOT LIKE '%s';
