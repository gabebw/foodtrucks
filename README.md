# Boston Food Trucks

This is a Sinatra app running on Heroku.

### Setup

    ./bin/setup

### Adding your own city

First, add a `your_city.yml` file in the `data` directory in the app root. Look
at `boston.yml` for the format.

Then add a `SanFranciscoTruckDataSource` (or whatever your city is) class. It
must have the following methods:

* `name`
* `meal`
* `day_available`
* `location`
* `data`, which should be everything in `your_city.yml`, as a hash
* `time_zone`, in a string that `Time.in_time_zone` understands

Look at `BostonTruckDataSource` for how it works.

Then add an `if` for your city in `AvailableFoodTrucks#all` to tell it to use
your new data source. Then you should be all set.
