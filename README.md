Fantasy Football Injury Report
-------------------------------

This application was built to allow users to enter their fantasy football players
and then see, on a week to week basis, if any of their players are injured.

To run locally, you will need to get an API key from Fantasy Football Nerd. https://www.fantasyfootballnerd.com

Installation
-------------
This application uses PostgreSQL. Make sure this is installed on your machine.

To get started with a local copy of the project:

```
git clone git@github.com:taylormartin/fantasy-football-app.git
bundle install
rake db:setup
```

Once you have a key from Fantasy Football Nerd, you will need to store the key
in the local copy of your application.

Navigate to the *application.yml* file and store your API key as shown below.

```
FF_KEY: {your API key}
```

Once your API key is saved you should be able to run the application using:

```
rails s
```

Note: The API key is being stored in the application using the Figaro gem
