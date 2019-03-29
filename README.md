# payGO Backend test app (Laravel)

## This app is made as a part of an ability test, in order to apply for a work position at PayGO. 

* Project was developed using Voyager as the CRUD/Admin panel generator and Apiato as the API generation tool, transitioned to Backpack due to time restrictions and an issue with Voyager not showing the CRUD correctly
* Database engine used is PostgreSQL 11, hosted in another server

## Steps for launching the Admin Panel (For Debian, Ubuntu and derivatives):

* Install *AMP stack (PHP >= 7.1.3, PostgreSQL 11) -- I've provided a script that installs PHP7.2 and Apache2, for production deployment purposes
* Install Composer
* Install Laravel
* Install Redis & Beanstalkd (For API)
* Config Laravel environment for each project
* Clone repo - Enjoy!

**You may run the project locally or within containers**

## What's working

* The admin panel/CRUD is complete, follow the steps above for installation, with or without dockerized Redis & Postgres (If you dockerize the DB only, be sure to run the migrations and register a user before trying to log in)

## Dockerized components

* Admin Panel
* Redis server
* Database server
* Beanstalk server
* Adminer
