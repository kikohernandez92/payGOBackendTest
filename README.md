# payGO Backend test app (Laravel)

## This app is made as a part of an ability test, in order to apply for a work position at PayGO. 

* Project was developed using Voyager as the CRUD/Admin panel generator and Apiato as the API generation tool
* Database engine used is PostgreSQL 9.6, hosted in another server

## Steps (For Debian, Ubuntu and derivatives):

* Install *AMP stack (PHP >= 7.1.3, PostgreSQL >= 9.5) -- I've provided a script that installs PHP7.2 and Apache2, for production deployment purposes
* Install Composer
* Install Laravel
* Install Redis & Beanstalkd (For API)
* Config Laravel environment for each project
* Clone repo - Enjoy!

## Dockerized components

So far, several components have been dockerized for a stack deployment in a Swarm:

* Redis server
* Database server **(LOG IN TO ADMINER AND IMPORT VOYAGERSQL.sql BEFORE TRYING TO LOG INTO THE ADMIN PANEL)**
* Beanstalk server
* Adminer
