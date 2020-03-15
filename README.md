# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
* Installation Steps:-

To get a detailed description of the installation procedure visit [this page](https://www.theodinproject.com/courses/web-development-101/lessons/your-first-rails-application)

1. Prerequistics
    1.1 Make sure your system is update
        ```
        $sudo apt-get update
        $sudo apt-get upgrade
        ```
    1.2 installs required package
        ```
        sudo apt install curl git nodejs gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev
        ```
2. Installing ruby
    2.1 installing rbenv
        ```
        git clone https://github.com/rbenv/rbenv.git ~/.rbenv
        ```
    2.2 Run these commands for proper working of rbenv package installer run these 
        commands one by one in sequence. They will not provide any output if done properly.
        ```
        echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
        echo 'eval "$(rbenv init -)"' >> ~/.bashrc
        exit
        ```
    2.3 Next, install ruby-build to help compile the Ruby binaries.
        ```
        mkdir -p "$(rbenv root)"/plugins
        git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
        ```
        Run `rbenv -v` to check it's version and if it's properly installed.
    2.4 Finally install ruby using rbenv
        ```
        rbenv install 2.6.5 --verbose
        ```
3. Installing rails and bundler
    3.1 Install Rails and Bundler
        ```
        gem install rails -v 5.2.3
        ```
    3.2 make a directory to house the project 
        ```
        mkdir new_dir_name
        ```
        change into that directory
        ```
        cd new_dir_name
        ```
        finally create the application from here
        ```
        rails new my_first_rails_app
        ```
    3.3 It would be a good idea to migrate the changes onto the database
        one example is given below:-
        ```
        rails generate scaffold car make:string model:string year:integer
        rails db:migrate
        ``` 
    3.4 start your app
        ```
        rails server
        ```
4. Deploying to Heroku
    4.1 first install the heroku CLI using the following command, the command will ask 
        for your sudo password.
        ```
        curl https://cli-assets.heroku.com/install.sh | sh
        ```
    4.2 change the Gemfile on the project folder,delete the line with the following command
        ```
        gem 'sqlite3'
        ```
        in place of the line you just deleted add following lines 
        ```ruby
        group :development, :test do
            gem 'sqlite3'
        end

        group :production do
            gem 'pg'
        end
        ```
    4.3 Install the bundle
        ```
        bundle install --without production
        ```
    4.4 To migrate the database on heroku run the following command
        ```
        heroku run rails db:migrate
        ```
        Open your project on heroku using 
        ```
        heroku open
        ```