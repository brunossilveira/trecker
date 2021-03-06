# Trecker :star:

This is a proof of concept to test AWS Kinesis Stream as a way of gathering geolocation
data from mobile phones, classifing it using a consumer application to later be user to
generate reports.

It has 3 parts, for details on how to run each, reffer to each folder's own README file.

## Stack

* [AWS Kinesis Stream](https://aws.amazon.com/pt/kinesis/streams) to handle streaming data
* [PostGIS](http://www.postgis.net) to create polygons and make operations with locations
* [Ruby](https://www.ruby-lang.org) because :heart:
* [RSpec](http://rspec.info) for testing

## Producer

Producer simulates mobile devices sending data to Amazon Kinesis.
It uses [aws-sdk](https://github.com/aws/aws-sdk-ruby) gem to insert data into a shard.

## Application

It provides a file `run.rb` that accepts a Date `YYYY/MM/DD` and a `driver_id` and returns
a report that describes driver's daily activities, like the example:

`$ ruby run.rb '2000-10-12' 1`

![Report example](https://github.com/brunossilveira/trecker/blob/master/example.png)

## Consumer

It's the application that processes data sent to Kinesis, classifies it according to table below
and saves it to a Postgres database, to be used later for reports and other things.

# Considerations

My focus here was to use Kinesis as a way of getting geolocation data. In a real world application, the fields would be gathered using
an exposed API, from `application`.
This solution is really powerful, there are a lot of companies using Kinesis that process terabytes of data
each day without a problem. If one shard isn't enough, just add more and plug more consumers to it. This architecture also facilitates
adding more validations/controls that uses the locations from devices, all one needs to do is to write another consumer app with the
business logic and voila :smile:.

A good alternative to improve performance even more would be to use a non relational database such as MongoDB to store
locations. We could also change Ruby to a more performatic language such as Java.
