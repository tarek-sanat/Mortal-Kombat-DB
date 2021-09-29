# CSI3450-Project

### Kombat Trainer: MK11

Discover the characters of the game Mortal Kombat 11.

### Getting Started
This is a project for CSI-3450 at Oakland University.

### Prerequisites

What you need to install and how to install them

```
 - Django
 - MySQL server
 - Web Browser
 - Internet connection.
```

### Installing

MySQL server:
```
  Setup LOCALHOST database and enter the database credentials into the settings.py of the project.
```
MySQL WORKBENCH:
```
  1- Download the SQL dump script that contains the schemas and data of the database.
  2- Open the file with a text editor and change the Database name (line 3) to your database’s name.
  3- Connect to your database using MySQL WORKBENCH.
  4- Click on Server.
  5- Click on data import.
  6- Select the previous sql script and proceed to import data.
```
DJANGO:
```
 To install django you need to execute this command:
python -m pip install Django

```
Start the server:
```
After you make sure that your database is set up correctly and DJANGO is installed. Open your CMD and CD to the root folder of the project where manage.py is located and execute this command.
python manage.py runserver

```
