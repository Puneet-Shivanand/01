MySQL
=====

    # Help
    ? RET
    \h RET

show
----

```
SHOW DATABASES;
SHOW TABLES;
SHOW TABLES LIKE 'b%';  # Show tables begin with b

# show status of all tables
SHOW TABLE STATUS [FROM <database>] [LIKE <pattern> | WHERE <expression>]

SHOW FULL PROCESSLIST;  # show process

SHOW TABLE STATUS WHERE Name = <table>; # show engine type
```


select
------

    # Filtering MySQL Table
    SELECT * FROM my_table WHERE <field> LIKE '%query%' LIMIT 10;


    # show all tables, table row count
    SELECT TABLE_NAME, TABLE_ROWS FROM `information_schema`.`tables`
                                  WHERE `table_schema` = '<db name>';


update
-----

    UPDATE <table> SET <field>=<value>, <field2>=<value2> [WHERE clause]


join
----

    SELECT * FROM tableA INNER JOIN tableB ON tableA.name = tableB.name


delete
-----


backup
======

    mysqldump -u root -p database > database.sql
    mysqldump -u root -p database table > table.sql
    mysqldump -h 192.168.0.100 -u root -p pearl paypal_ipn > paypal_ipn.sql


pager
=====

    # show page by page
    pager less

    # enable vertical mode
    pager less -SFX
    <query> \G

    # disable pager
    nopager RET
    \n RET


truncate
---------

```
truncate <table name>; # make table empty


        ```
        
password reset
---------
```
sudo /etc/init.d/mysql stop
sudo mysqld_safe --skip-grant-tables
mysql -uroot
use mysql;
update user set password=PASSWORD("mynewpassword") where User='root';
flush privileges

```
