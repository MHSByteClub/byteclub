# Byte Club Hub

A flexible, open-source web app to help publicise, manage, and monitor the projects for the MHS Byte Club. 
This project allows members to sign in to meetings for more reliable attendence. Members can post links and descriptions of their current projects. The public-facing parts of this
project help to show off members projects. 

Finally, this project is intended to be a work-in-progress and a coordinated effort of Byte Club members. Any member can make PRs and add features as their skills and time permits. 
Contribute and make something great with Byte Club!

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

> **Please Note**: This project uses google_oauth2 authentication which will not work in your local environment.

### Prerequisites

This project requires the use of:
* Ruby (~2.6.0)
* Rails (~5.2)
* Postgresql



### Installing

A step by step series of examples that tell you how to get a development env running
1. Begin by forking and cloning this repository to your local machine. 
```#!/bin/bash
# clone the repo to your local machine using the gits
git clone [your forked repo]

# cd into your newly-created directory
cd byteclub

```

2. Start your postgresql server with the following command(s)

```#!/bin/bash
sudo service postgresql start
```
*Postgresql runs a database server that helps to manage and store the data for your development environment. It is required so that data can persist
and be "remembered" when developing, building, and testing new features.*


3. Setup a new postgres database with the following commands:
```#!/bin/bash
# Connect to the postgresql service
psql

# create a postgresql database with the name specified in congif/database.yml
ubuntu=# CREATE DATABASE "bc_dev";

# List the databases to be sure it was created correctly

ubuntu=# \list
# Should show something like this below
                            List of databases
   Name    |  Owner   | Encoding  | Collate | Ctype |   Access privileges   
-----------+----------+-----------+---------+-------+-----------------------
 bc_dev    | ubuntu   | SQL_ASCII | C       | C     | 
```

4. Install all of the Ruby Gems needed by running bundle install
```#!/bin/bash
bundle install
```

5. Migrate your database so it's all setup and ready to accept the data Rails will send to it.
```#!/bin/bash
# this is the safest way to call this and make sure that it works...
bundle exec rake db:migrate
```
6. Run your dev server and get developing
```#!/bin/bash
rails server -p [port of your choice]

# or if you're running from Cloud9 IDE, uses Cloud9 defaults to serve
rails server -b $IP -p $PORT
```
7. Navigate to localhost or your Cloud9 dev location and make sure you see the Byte Club homepage there!


#### Troubleshooting and Version Hell

If you run into issues with your Ruby or Bundler versions, follow the prompts in the command line. 
* Be sure you've installed and are using the correct Ruby versions
``` 
rvm install ruby-2.6.1
```

* Also, check that you've got the most updated version of Bundler
```#!/bin/bash
bundle update --bundler

# or...
gem install bundler:2.0.1
```


## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Ruby on Rails](https://guides.rubyonrails.org/) - The web framework used
* [Bootstrap gem](https://github.com/twbs/bootstrap-rubygem) - Styling
* [google_oauth2](https://github.com/zquestz/omniauth-google-oauth2) - Google Omniauth strategy
* [Cloud9 IDE](http://c9.io) - Cloud-based IDE

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.



## Authors

* **Matt Farmer** - *Initial work* - [Farmer & Dell](https://matt-farmer.com)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* MHS Byte Club members, who are awesome and willing to work hard and try something new

