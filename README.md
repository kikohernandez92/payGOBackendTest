# payGO Backend test app (Laravel)

## This app is made as a part of an ability test, in order to apply for a work position at PayGO. 

* Project was developed using Voyager as the CRUD/Admin panel generator and Apiato as the API generation tool, transitioned to Backpack due to time restrictions and an issue with Voyager not showing the CRUD correctly
* Database engine used is PostgreSQL 11, hosted in another server

## Steps for launching the Admin Panel (For Debian, Ubuntu and derivatives):

**Locally (Recommended using Docker Swarm in a single host for launching the stack)**

* Launch localstack.yml with Local.sh script
* Run LocalPreparation.sh
* Set the .env values accordingly

**On Docker**

* Just launch the app with Launch.sh and let Docker take the wheel!

**Don't forget to register a user once the app is up**

## What's working

* The admin panel/CRUD is complete, there's a test file for the Excel File imports. 

## Dockerized components

* Admin Panel
* Redis server
* Database server
* Beanstalk server
* Adminer
