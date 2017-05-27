# Application

## installation

You need to create `.env` file and setup proper env variables and also create a database with postgis extension enabled.

`$ bundle install`
`$ ruby config/migrations.rb`
`$ ruby db/seeds.rb` To create some example data

## usage

`ruby run.rb 'YYYY-MM-DD' <driver_id>`

This will fetch database and generate daily activities report for that
day and driver.
