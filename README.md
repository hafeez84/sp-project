# Sportcompass project

-Development or Production
$ git clone https://github.com/hafeez84/sp-project.git <br/>
$ bundle install <br/>
$ bundle exec figaro install <br/>
$ mysql -u [username] -p <br/>
Enter your password and <br/>
-mysql> create database sp_project_development; or sp_project_test; or sp_project_production; <br/>
create the database according to your enviroment. <br/>
-Update config/application.yml and config/database.yml file. <br/>
$ rails routes <br/>
And finally  <br/>
$ rails s <br/>

- Test <br/>
$ rspec
