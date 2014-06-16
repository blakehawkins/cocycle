The Co-Cycle Web App
====================

Getting Started
---------------

Make sure you have an up-to-date Ruby, using a tool like [rbenv](https://github.com/sstephenson/rbenv/) can help.  If you use Windows, developing in a POSIX environment on a virtual machine can save a lot of hassle.

Install the required gems with `bundle install` in the project route.  You need a JavaScript runtime such as [Node.js](http://nodejs.org) to compile assets, see [the ExecJS README](https://github.com/sstephenson/execjs#readme).

Create the development database locally with `rake db:setup`.  This will also seed the development database with a sample of [geocoded postcodes for Glasgow](http://dashboard.glasgow.gov.uk/ckanstore/files/2014-03-03T20%3A36%3A53.752Z/glasgow-postcodes-geocoded.csv) (see `db/seeds.rb` for how this is done.)

Run `ruby bin/rails server` and point your browser at [localhost:3000](http://localhost:3000).

Contributing
------------

This application uses the [Slim](http://slim-lang.com) templating engine instead of ERB.

Write [unit and integration tests](http://docs.seattlerb.org/minitest/) for each new piece of functionality, and make sure the rest of the test suite passes (`bin/rake test`) before committing.
