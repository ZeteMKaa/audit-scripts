#!/bin/bash
# Audit script for SQL
# By Niels Vonk


# Setting variables

YELLOW="\e[00;33m"
GREEN="\e[00;32m"
RED="\e[00;31m"
RESET="\e[00m"
ACTION="[\e[00;33m-\e[00m]"
QUESTION="[\e[00;31m+\e[00m]"

# Spawning banner

tput clear;

echo -e "################################"
echo -e "#     MySQL Database Audit     #"
echo -e "#                              #"
echo -e "################################"

# Set the database name
echo -e "$QUESTION What is the name of the target database ?"
read DB

# Set the database user
echo -e "$QUESTION What is the name of the user that connects to the database ?"
read USER

# Create audit script
echo -e "$ACTION Running SQL script, please enter the root password"
cat << EOT >> mysql_audit.sql
	/* Audit script for MySQL */;
	/* Run with "mysql -u root -p -t < mysql_audit.sql > MySQL_Audit_Output.txt" */;
	system echo "++ Collected MySQL Audit information ++\n\n";

	/* Run date */;
	SELECT now();

	/* Version */;
	SELECT version();

	/* Show databases */;
	SHOW databases;

	/* Get all accounts */;
	SELECT * from mysql.user \G;

	/* Check for accounts without a password */;
	SELECT User, Host FROM mysql.user WHERE authentication_string = '';

	/* Check for anonymous accounts */;
	SELECT User, Host FROM mysql.user WHERE User = '';

	/* Check for allowed connection hosts */;
	SELECT User, Host FROM mysql.user;
	
	/* Check for wildcards in hostnames */;
	SELECT user FROM mysql.user WHERE host = '%';

	/* Check for administrative permissions */;
	SELECT User, Host, Select_priv, Insert_priv, Update_priv, Delete_priv, Create_priv, Drop_priv, Grant_priv, Index_priv, Alter_priv FROM mysql.user WHERE Select_priv = 'Y' OR Insert_priv = 'Y' OR Update_priv = 'Y' OR Delete_priv = 'Y' OR Create_priv = 'Y' OR Drop_priv = 'Y' OR Grant_priv = 'Y' OR Index_priv = 'Y' OR Alter_priv = 'Y'; 

	/* Check for system permissions */;
	SELECT User, Host, Process_priv, File_priv, Super_priv, Shutdown_priv FROM mysql.user WHERE Process_priv = 'Y' OR File_priv = 'Y' OR Super_priv = 'Y' OR Shutdown_priv = 'Y';
	
	/* Set selected database */;
	USE $DB;
	
	/* Show users with rights on selected DB */;
	SELECT user FROM mysql.db WHERE db='$DB';
	
	/* Show grants on DB */;
	SHOW grants FOR '$USER'@'localhost';
		
	/* Dump system variables */;
	SHOW variables;
	
EOT

mysql -u root -p -t -vvv < mysql_audit.sql > MySQL_Audit_Output.txt
rm mysql_audit.sql

echo -e "$ACTION Gathering system information"
updatedb
# Create header
echo -e "++ Collected MySQL System information ++\n\n" > MySQL_System_Output.txt

# Check for ownership
echo -e "\n\n++ Owner of MySQL process ++" >> MySQL_System_Output.txt
ps auxwww | grep -i mysql >> MySQL_System_Output.txt

# Check for file permissions on config files
echo -e "\n\n++ File permissions on config files ++" >> MySQL_System_Output.txt
echo -e "\nls -ld my.cnf" >> MySQL_System_Output.txt
ls -ld `locate my.cnf` >> MySQL_System_Output.txt
echo -e "\nls -la my.cnf" >> MySQL_System_Output.txt
ls -la `locate my.cnf` >> MySQL_System_Output.txt
echo -e "\nls -ld /usr/share/mysql" >> MySQL_System_Output.txt
ls -ld /usr/share/mysql >> MySQL_System_Output.txt
echo -e "\nls -la /usr/share/mysql" >> MySQL_System_Output.txt
ls -la /usr/share/mysql >> MySQL_System_Output.txt
echo -e "\nls -ld /var/lib/mysql" >> MySQL_System_Output.txt
ls -ld /var/lib/mysql >> MySQL_System_Output.txt
echo -e "\nls -la /var/lib/mysql" >> MySQL_System_Output.txt
ls -la /var/lib/mysql >> MySQL_System_Output.txt


# Check for file permissions on log files
echo -e "\n\n++ File permissions on log files ++" >> MySQL_System_Output.txt
echo -e "\nls -ld /var/log" >> MySQL_System_Output.txt
ls -ld /var/log >> MySQL_System_Output.txt
echo -e "\nls -la /var/log" >> MySQL_System_Output.txt
ls -la /var/log >> MySQL_System_Output.txt
echo -e "\nls -ld /var/log/mysql" >> MySQL_System_Output.txt
ls -ld /var/log/mysql >> MySQL_System_Output.txt
echo -e "\nls -la /var/log/mysql" >> MySQL_System_Output.txt
ls -la /var/log/mysql >> MySQL_System_Output.txt
echo -e "\nls -ld mysqld.log" >> MySQL_System_Output.txt
ls -ld `locate mysqld.log` >> MySQL_System_Output.txt
echo -e "\nls -la mysqld.log" >> MySQL_System_Output.txt
ls -la `locate mysqld.log` >> MySQL_System_Output.txt
ls -ld /var/log/mysql >> MySQL_System_Output.txt
echo -e "\nls -la /srv/mysql" >> MySQL_System_Output.txt
ls -la /var/log/mysql >> MySQL_System_Output.txt
echo -e "\nls -ld /srv/mysql" >> MySQL_System_Output.txt


# Collect config file
echo -e "\n\n++ Content of my.cnf ++\n\n" >> MySQL_System_Output.txt
cat `locate my.cnf` >> MySQL_System_Output.txt

echo -e "$ACTION Done"

