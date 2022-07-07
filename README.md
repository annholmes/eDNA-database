# eDNA-database
Code for SQL database of eDNA samples, metadata, and species detections

## What is a relational database and why are we using it?

A relational database is a system that stores information that is related to each other. The type of data that is stored in these databases is tabular and can be related to each other by referencing unique identifiers (primary keys) in the tables.

A relational database management system (RDBMS) is simply the place that holds the information and lets people interact with it. The RDBMS that we use is MySQL. 

One is able to interact with an RDBMS using Structured Query Language (SQL).
For our intents and purposes, SQL executes queries in order to...
- retrieve data
- insert records
- update records
- delete records
- create new databases
- create new tables in a database

## How to download MySQL and MySQL Workbench
In order to use our database you will need to install MySQL and MySQL Workbench. Depending on the OS you use the installation process will be different, but both are pretty simple and painless.

### Windows:
If you are installing MySQL onto a windows machine please watch [this video](https://www.youtube.com/watch?v=u96rVINbAUI).

### Mac:
If you are installing MySQL onto a macOS machine please watch [this video](https://www.youtube.com/watch?v=43o-xXcKr_M).

### Establishing a connection to our database:
Luckily, setting up a new connection to the database is simple as well. When you open MySQL Workbench you are greeted by your connections page. To make a local connection (i.e. a connection to a MySQL server that is not our database) you can simply click on the plus sign that is next to "MySQL Connections" and a pop up will open asking you to configure your new database connection. When you are greeted by this page there are is just one thing that you want to change. That would be the "Connection Name". This can be whatever you want it to be, but it should be something relevant to what the database stores. Once you have done this you can simply click on the "Store in Keychain ..." (if you are on mac )next to "Password" and enter in the password that you put in when installing MySQL.

![plus_sign_connection](https://user-images.githubusercontent.com/89175578/177710014-30bfe78a-1ffc-40a6-9bf5-8ed4df01e084.png)

Congratulations on setting up a local connection! This is yours entirely to play around with, you can import and export tables all you want here to learn and practice! Make sure that you can do this step, as this is the connection that we are going to use to practice using SQL!

![new_connection_box](https://user-images.githubusercontent.com/89175578/177710080-faabe303-bbee-4b72-aa48-fd973846127b.png)

Now we are going to learn how to set up the connection to our database server. Once you set up this connection you will be able to see all of the data that we have stored and even play around with it once you are more comfortable with SQL and the database. 
*Do not "drop" or alter the database until you have practiced SQL on your local server. Relational database enforce integrity, which means that it is very hard to reverse actions once they have been made*.

1. Press the plus sign again, you will be greeted by the same connection screen as before.
2. Change the "Connection Name" to "GVL-eDNA", or something similar.
3. Change the "Hostname" to the AWS link that was given to you.
4. Change the "Username" to the username that was given to you.
5. Input the password that was  given to you.

The last step is to click "Test Connection". You should receive a message that says that your connection was successful. You want to do this before you click "OK" to ensure that your connection works. Once you get this confirmation you can click the "OK". If you do not get this message after entering the proper information, contact someone in the lab that can help you with this.

Once you have installed these two programs and established a connection to our database, you will be able to look at all the information we have saved in our database. **Eventually we will add permissions to certain users**

## How to use MySQLWorkbench and SQL together.
The structure of a database is analogous to a directory or file system in a computer. Consider a folder on your desktop, and within that folder there is a folder named "Data" which contains some csv files. This system of organization can be thought of as a rudimentary database. Compared to our MySQL database, the desktop would be our connection, the folder would be a database, the "Data" folder would be our schemas, and the csv files would be our tables.

However what this system does not provide is a way to relate this information to each other. It stores the information and lets you view it, but as a standalone system it is limited in its functionality. Instead, by using MySQL we are able to store, access, and manipulate all of this information in a central location. 

In this quick tutorial you will learn how to import, export, and join tables using SQL. *Please practice the following tutorial using your own local server before attempting to alter things in our official database*. If you have any issues as you are using the database that is not answered in this brief tutorial do not be afraid to look for some solutions online!

### How to add a database
Before we learn how to add a table, we need to add some databases to our connection. These databases within our connection is where our tables and information is going to live. There are two ways to create a database once a connection is established. The first is to simply execute the query `create database [database_name];` using SQL. The ";" at the end of the query is important becasue it tells SQL that that is the end of your request. The second is to use the options in the workbench GUI *image*. By selecting the option to create a database a popup will open asking you to name the database. After this is done, and "apply" is selected a new database will be created. You should see your database populate under the "Schemas" tab on the left side of the screen. If you do not, click on the "refresh" symbol and it should populate then. You can also run the SQL query `show databases;` and it should present you with all the databases that are held within this connection. You may notice some databases that you did not initiate here, that is OKAY, you should not try to "drop" any of them.

#### How to delete a database
## ONCE A DATABASE IS DELETED THERE IS NO WAY TO RECOVER IT, BE VERY CAUTIOUS WHEN DELETING ANYTHING FROM A DATABASE. ALL INFORMATION IN THE DATABASE WILL BE DELETED.
There are also two ways to drop a database. Similarly one is able to drop the database by executing `drop database [database_name];`. Once a database is created you can also right click on the database and select "Drop Schema...". If you do this a pop up will ask you if you are sure that is what you want to do, you can simply click "Drop Now".

### How to add a table
Creating a table in a database is a little bit more involved. First a few things about the table being added to the database need to be known. The bare minimum to add a table to a database is knowing the column names, the data types of each column, and the maximum character length of each column. Once this information is known, you can create a table by using a similar query to this:
```
create table [database_name].[table_name](
[column_name1] [data_type]([character_lentgth]),
[column_name2] [data_type]([character_lentgth]),
[column_name3] [data_type]([character_lentgth])
);
```
As an example, if you wanted to create a table named "test" inside of a database named "test_DB" with the columns "first_name", "first_name", and "number_of_siblings", the query to execute would be:
```
create table test_DB.test(
first_name varchar(16),
last_name varchar(32),
number_of_siblings int(2)
);
```
In this query we are assuming that the maximum number of characters for first names in your data is 16, the maximum number of characters for last names is 32, and the highest number of siblings does not exceed 2 digits. There are many kinds of data types that we will not get into now, but you can visit [this website](https://dev.mysql.com/doc/refman/8.0/en/data-types.html) to learn more about them.

However, you are still able to create tables in the database using the GUI. The reason why we make tables through SQL queries is because we can save these queries and see/edit the structure of these tables in the future since we can save these queries and push them on this github. If you refresh your "test_DB" and click on it there will be a dropdown with some options that you can click on. You can explore these at your own leisure, but for now we are only concerned with the "Tables" option. Once you click on this option you will see your table "test" as an option that you can click on. If you right click this table and select "Select Rows - Limit 1000" you will be presented with a window that displays the information in this table. You should see a table with three columns, all named what we named them previously, but with no information stored in it. The SQL query to display this same window would  be `select * from [database_name].[table_name];`, so in this instance the query would actually read `select * from test_DB.test;`.

Congratulations, you just made your first table in MySQL!

#### How to delete a table
Due to how strict sql is within enforcing integrity, it is difficult to edit the structure of tables after they have been created. For this reason it is often easier to delete a table, fix the query for the table, and then run it again, this time with correct table structure. This is why it is so important to understand how to create tables using SQL. The same precautions apply to dropping a table as it does with dropping a database. **Once you have dropped a table there is no way to reverse this action, you can only amend it by re-running the table query and repopulating that information. This is why it is so important to have data redundancy**.

To drop a table you can execute the query `drop table [table_name];`. You can also use the GUI and right-click on the table and select "Drop Table...".

### How to add records into a table.
Great! Now we have learned how to create and delete a table, but a table's structure is useless without the information that it is supposed to store. Though you can add information to a table using SQL, it is easier to simply use the "Table Data Import Wizard" to add your table's information to the database. To do this you can simply right-click on the table, select "Table Data Import Wizard". You will be presented with a pop-up that will guide you. Typically flat files (.csv) work better than excel files (.xlxs), so make sure to convert your table into a .csv file before attempting to import the data into the database. 

We will be adding the "example_data1.csv" that is in the initial directory from the eDNA-databae you repository you cloned from github. You can open up this file and see its contents. You will notice that the column names match the ones that we constructed within our database. However you will also notice that it has an extra column that indexes each of the rows. This will be important later on but you can ignore it for now.

![table_data_import_wizard](https://user-images.githubusercontent.com/89175578/177710174-67883789-2989-44d0-abd1-b6cdfcb2c683.png)
1. Right-click on the "test" table in your "test_DB" database.
2. Select "Table Data Import Wizard"
3. On the "Select File to Import" screen click on "Browse...". Find the "example_data1.csv" and select it. Click "Next >".
4. On the "Select Destination" screen select click "Next >".
    - Here you are given some options that we are not selecting. The "Create new table:" option will create a new tables structure and populate it with the information within the table that you add, but it is not as reliable or valuable as using the tables that you create yourself.
5. On the "Configure Import Settings" page you will have to click on the check box next to "MyUnknownColumn" to unselect it.
    - The reason we have to do this is because our destination table ("test") only has 3 columns, while our source table ("example_data1") has four columns. It has 4 columns due to the indexing column that we did not account for when we initially made our table. But this is no matter, we simply fixed this by deselecting that column to be imported. If we did not you will notice that the drop down menu next to "MyUnknownColumn" has only the options that we made in the table for column names, and if we selected any of those MySQL would abort the import due to duplicate column names (which violates the integrity of the table). You can also fix this by altering the table and removing that indexing column before attempting to import it, but this serves as a good example for some of the issues that you can run into when working with MySQL.

At this point you can simply continue clicking "Next >" until you can click "Finish". Now you can execute the same query as before `select * from test_DB.test;` and it will show you your table that is now populated.

Congratulations you SQL wizard, you did it again. You populated a table that you created with some information!

#### How to delete records from a table
Deleting records from a table is something that we are not going to practice, but is valuable to know. In order to delete all records in a table without deleting the table itself you can use the query `delete from [table_name];`. If you want to delete specific records from the table that meet a certain criteria you will have to use a "where" statement. This is also simple, the basic query structure is as follows: `delete from [table_name] where [condition];`. The condition that you select could be any number of things that we will not get into right now, but an example could be: `delete from test where number_of_siblings < 3;`. Unfortunately, this will not work for you due to some safety settings that are the default in MySQL. You can search how to circumvent the error that it gives you, but for now it is okay to just know how you are able to delete records from a table. Typically we do not want to delete records from a table, for the same reason that we do not want to drop tables or databases. These are actions that can not be reversed.

### How to join tables together in 
We are going to do one quick example to demonstrate the basics of joining tables in MySQL. In order to practice joining tables we are going to have to import a second table to join to our first table. Go ahead and copy the following query to make the second table, and then import "example_data2.csv" into the new table that you made.

```
create table test_DB.test_join(
first_name varchar(16),
last_name varchar(32),
favorite_food varchar(32)
);
```

First we are going to learn about one kind of join that MySQL supports. There are more kinds of joins, but this should be enough to get you going. Again, if you are interested in learning about all the different kinds of joins there are plenty of resources online that you can choose from. 

The join that we are going to learn is an inner join. An inner join combines two tables in your database by keeping the records that have matching values across both tables.

#### The Inner Join
This may sound confusing, but the best way to understand these concepts are by practicing. Copy this query into MySQL and run it.

```
-- joining test and test_join
select test.last_name,
    test_join.favorite_food
from test
inner join test_join
on test.first_name = test_join.first_name;
```
This should be your result:
<img width="396" alt="join_table_example" src="https://user-images.githubusercontent.com/89175578/177710241-51b08d08-b4d4-41af-ac88-4b0fea8fbe08.png">

Here is what is happening in this query:
- The "select" statement chooses which columns from each table we want to see
- The "from" statement decides which is the first table 
- The "inner join" then selects which is the second table
- The "on" statement tells MySQL where it should look for matches

From this we can see that that basic syntax for an inner join is as follows:

```
SELECT [table1_name].[column],
    [table2_name].[column]
FROM [table1]
INNER JOIN [table2]
on [table1].[matching_column] = [table2].[matching column]
```

### How to export joined tables
What do you do once you have created a new table? What if you created a table in MySQL and wanted to export it out to run some analysis in R? All you have to do is use the "Table Data Export Wizard"! 

But first we need to actually store the new joined table into our database. You may have noticed that after running our join query the resulting table didn't actually end up as one of our tables in our test_DB. In order to save that table we need to alter the query slightly. Go ahead and make the following alteration to your inner join query: 

```
-- creating new_table from test and test_join inner join
create table new_table as
	(select test.last_name,
	test_join.favorite_food
	from test
	inner join test_join
	on test.first_name = test_join.first_name);
```

As you can see, all we did to make this join into a stored table is to put it within the parentheses of `create table new_table as ()`. Now if you refresh your database you will see this new table. Now to export you can simply right-click "new_table" and select "Table Data Export Wizard". You will be presented with yet another pop-up. On the first screen select "Next >". On the "Select file output location" select "Browse..." here you can decide on a name for this new file and choose where you want this new table exported out to. Finally you can select "Next >" until you can select "Finish". Check to see that your new file is where you wanted to export it out to. 

Congratulations! You just combined two tables into one and exported it out to a new file that you can run analyses on! 

That concludes this super brief introduction to using SQL in our database! There are lots of things that you can do, but just be sure to practice and make sure to triple check what you are doing before you `drop` anything from the database! 
