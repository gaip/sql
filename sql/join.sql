/*
Write Your First JOIN
Below we see an example of a query using a JOIN statement. Let's discuss what the different clauses of this query mean.
*/
SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;


As we've learned, the SELECT clause indicates which column(s) of data you'd like to see in the output. The FROM clause indicates the first table from which we're pulling data, and the JOIN indicates the second table. The ON clause specifies the column on which you'd like to merge the two tables together. Try running this query yourself below.

Setting Up
Copying archive to your Workspace...
Please waitLoading…
What to Notice
We are able to pull data from two tables:

orders
accounts
Above, we are only pulling data from the orders table since in the SELECT statement we only reference columns from the orders table.

The ON statement holds the two columns that get linked across the two tables. This will be the focus in the next concepts.

Additional Information
If we wanted to only pull individual elements from either the orders or accounts table, we can do this by using the exact same information in the FROM and ON statements. However, in your SELECT statement, you will need to know how to specify tables and columns in the SELECT statement:

The table name is always before the period.
The column you want from that table is always after the period.
For example, if we want to pull only the account name and the dates in which that account placed an order, but none of the other columns, we can do this with the following query:

SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;
This query only pulls two columns, not all the information in these two tables. Alternatively, the below query pulls all the columns from _ both_ the accounts and orders table.

SELECT *
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;
And the first query you ran pull all the information from only the orders table:

SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;
Joining tables allows you access to each of the tables in the SELECT statement through the table name, and the columns will always follow a . after the table name.


/*
Now it's your turn.
Quiz Questions
Try pulling all the data from the accounts table, and all the data from the orders table.

Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.
Another environment is below to practice these two questions, and you can check your solutions on the next concept.


*/

SELECT orders.*, accounts.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;
Notice this result is the same as if you switched the tables in the FROM and JOIN. Additionally, which side of the = a column is listed doesn't matter.

SELECT orders.standard_qty, orders.gloss_qty,
       orders.poster_qty,  accounts.website,
       accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
/*
JOIN Revisited
Let's look back at the first JOIN you wrote.
*/
SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

/*
the Code
If we wanted to join all three of these tables, we could use the same logic. The code below pulls all of the data from all of the joined tables.
*/

SELECT *  /*SELECT web_events.channel, accounts.name, orders.total*/
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id


/*
ALIAS - ALIAS -ALIAS - ALIAS -ALIAS - ALIAS -ALIAS - ALIAS -ALIAS - ALIAS
*/

FROM tablename AS t1
JOIN tablename2 AS t2

SELECT col1 + col2 AS total, col3

Select t1.column1 aliasname, t2.column2 aliasname2
FROM tablename AS t1
JOIN tablename2 AS t2

/*
Solutions
Provide a table for all the for all web_events associated with account name of Walmart. There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.
*/
SELECT a.primary_poc, w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';

/*
Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
*/
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;

/*
Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.
*/
SELECT r.name region, a.name account,
       o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;
