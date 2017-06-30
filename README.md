# Rales Engine

Rales Engine is an API that exposes a database with customer, merchant, sales information.

## Getting Started

After cloning down the repo, please follow the instructions for installing and seeding the database.

### Prerequisites


```
Ruby 2.4.1
```

### Installing

Setup

Run Bundle

```
bundle install
```

Load the DB Schema

```
rake db:schema:load
```

Seed the database

```
rake import:all
```

## Running the tests

Simply run rspec in the root folder of the project via console.

```
rspec
```

## Deployment

Rales Engine is currently not deployed.

## Built With

* [Ruby on Rails](http://rubyonrails.org/)

## Versioning

## Authors

* **Bao Nguyen** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)
* **Mason Holland** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
