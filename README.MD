##RSS Reader
RSS Reader is a powerful functional tool which is used to parse RSS resources. The project is the server side providing Restful WebService API.

--

###Requirments
 * PostgresSQL
 * Ruby 2.2.3
 * Rail4

###Setup env（for Mac）
* Install `ruby`
 * `$ rvm install 2.2.3`
 * `$ rvm use 2.2.3`

* Install `postgres`
 * 	`$ brew install postgresql`
 *  `$ pg_ctl -D /usr/local/var/postgres start` -- start postgres
 *  `$ pg_ctl -D /usr/local/var/postgres stop` -- stop postgres

###Run Test
 * `$ cd ../project_root_dir/`
 * `$ bundle install`	
 * `$ rake test`


