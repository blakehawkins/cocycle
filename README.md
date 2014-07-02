The Co-Cycle Web App
====================

[![Build Status](https://travis-ci.org/CoCycle/cocycle.svg?branch=master)](https://travis-ci.org/CoCycle/cocycle)

Getting Started
---------------

Make sure you have an up-to-date Ruby, using a tool like [rbenv](https://github.com/sstephenson/rbenv/) can help.  If you use Windows, developing in a POSIX environment on a virtual machine can save a lot of hassle.  You will also need the PostgreSQL database server installed and running.

Install the required gems with `bundle install` in the project route.  You need a JavaScript runtime such as [Node.js](http://nodejs.org) to compile assets, see [the ExecJS README](https://github.com/sstephenson/execjs#readme).

Create the development database locally with `bin/rake db:setup`.  This will also seed the development database with a sample of [geocoded postcodes for Glasgow](http://dashboard.glasgow.gov.uk/ckanstore/files/2014-03-03T20%3A36%3A53.752Z/glasgow-postcodes-geocoded.csv) (see how this is done in the file `db/seeds.rb`.)

Run `bin/rails server` and point your browser at [localhost:3000](http://localhost:3000).

Contributing
------------

Code is available under the permissive MIT license, see the file `LICENSE`.

This application uses the [Slim](http://slim-lang.com) templating engine instead of ERB.

Write [unit and integration tests](http://docs.seattlerb.org/minitest/) for each new piece of functionality, and check they pass with `bin/rake test` before committing.
