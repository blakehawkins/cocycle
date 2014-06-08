The Co-Cycle Web App
====================

Serving the application
-----------------------

Make sure you have an up-to-date Ruby, using a tool like [rbenv](https://github.com/sstephenson/rbenv/) can help.  If you are on Windows, it is advisable to develop on a virtual machine that supports POSIX.

Install the required gems with `bundle install` in the project route.  You need a JavaScript runtime such as [Node.js](http://nodejs.org) to compile assets, see [the ExecJS README](https://github.com/sstephenson/execjs#readme).

Run `ruby bin/rails server` and point your browser at [localhost:3000](http://localhost:3000).

Contributing
------------

This application uses the [Slim](http://slim-lang.com) templating engine instead of ERB.
