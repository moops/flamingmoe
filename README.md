README
====================

flamingmoe set up:
-----------------

### dependencies
install all dependencies by running the bundle command
### database
    1. edit /config/database.yml to include valid database credentials. 
        * Do not comit production credentials to version control (use 
        environment variables)
 
    2. create and populate the database by running: 
        * bin/rake db:create
        * bin/rake db:migrate
        * bin/rake db:seed

### pusher
    1. set up a free pusher account at http://pusher.com
    2. add a pusher app to your account called 'flamingmoe'
    3. edit /config/initializers/pusher.db and populate the following variables with the 
    information listed on the flamingmoe app page at pusher.com
        * pusher_app_id
        * pusher_key
        * pusher_secret

### authentication
    * only http basic authentication is in place now. users and passwords are defined in 
    app/controllers/application_controller.rb. only the products controller is protected

### rails
    1. start the rails server with: bin/rails s
    2. visit http://localhost:3000 in a browser

### profit?