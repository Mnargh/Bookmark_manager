## Bloggedy-Blog

CRUD = Create, Read, Update, Delete <make pretty>
SQL = Structured Query Language <make pretty>

Using the CRUD concept with SQL we can manipulate databases.

###__C__ RUD
Create:
postgres=# CREATE DATABASE example_database;
Here we use the postgreSQL terminal to create a database (named example_database)

example_database=# CREATE TABLE example_table (
                                               id serial PRIMARY KEY,
                                               name varchar(50)
                                              );
Here we use SQL to add a table with id and name columns to a database

example_database=# INSERT INTO example_table(name) ('Jeff')
Here we use SQL to add an entry with the value of Jeff for its name attribute to our example_table

###C __R__ UD
Read:
example_database=# SELECT*FROM example_table
Here we use SQL to read every entry in our example_table from our example_database:
  id      name
  1       Jeff
<insert actual table here>

###CR __U__ D
Update:
example_database=# UPDATE example_table SET name = 'Jim' WHERE id = '1'
Here we use SQL to update an entry in our example_database
SQL finds the entry with id = 1 and changes the name attribute for this entry to Jim
example_database=# SELECT*FROM example_table
  id      name
  1       Jim
<insert actual table here>

###CRU __D__
Delete:
example_database=# DELETE FROM example_table WHERE name = 'Jim'
Here we use SQL to delete all entries from our example_table with the name attribute of Jim
Our table is now empty:
example_database=# SELECT*FROM example_table
  id      name
<insert actual table here>

example_database=# DROP TABLE example_table
Here we use SQL to delete our entire example_table in our example_database
