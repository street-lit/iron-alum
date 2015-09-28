# Iron Alum Web API Standards

## Guidelines
This README will describe how to interact with the Iron Alum API. 
It provides guidelines and examples for the Iron Alum API in hopes to  encourage consistency and maintainability across multiple devices and applications.  

This document borrows heavily from:

* [White House Web API Standards] (http://github.com/WhiteHouse/api-standards/blob/master/README.md)
* [Ryan Yep's Find-A-Spot README] (http://github.com/rcyep87/Find-A-Spot/blob/master/README.md)

## UML
![](http://i.imgur.com/A9HqHcq.png)

## RESTful URLs

### General guidelines for RESTful URLs
* A URL identifies a resource.
* URLs should include nouns, not verbs.
* Use plural nouns only for consistency (no singular nouns).
* Use HTTP verbs (GET, POST, PUT, DELETE) to operate on the collections and elements.
* You shouldn’t need to go deeper than resource/identifier/resource.

## Using Iron Alum API
In order to use the Iron Alum API, the user must make the approiate request with the correct RESTful url. When the word '`:resource`' is used, it refers to either '`students`', '`cohorts` or '`locations` and can be substitued with the respective resource. If a 

* `GET` request to `http://iron-alum.herokuapp.com/:resource` will display JSON of all the records currently held in the database for that respective `:resource`. For example: `http://iron-alum.herokuapp.com/locations` will return all the different location JSON objects.

* `GET` request to `http://iron-alum.herokuapp.com/:resource/:id` will show a specific record with the respective id number, shoud that record exist. If you choose an `:id` that doesn't exist in the database, it will render an error. For example: `http://iron-alum.herokuapp.com/locations/1` will return the Austin location JSON object.

* `GET` request to `http://iron-alum.herokuapp.com/:locations/:course_name/` accesses all students within a specific cohort relative to its location with `:course_name` being. If you choose an `:location` or `:course` that doesn't exist in the database, it will render an error.

* `GET` request to `http://iron-alum.herokuapp.com/restaurants/:restaurant_id/spots/:id` only shows a single spot belonging to a specific restaurant. If you choose an `:restaurant_id` and/or `:id` that doesn't exist in the database, it will render an error.

* `PUT`request to `http://iron-alum.herokuapp.com/restaurants/:restaurant_id/spots/:id` OR `PUT`request to `http://iron-alum.herokuapp.com/spots` allows you to **update** the availability of a parking spot. The params are 