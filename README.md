# Mindly Blog App

The Mindly app will be a classic example of a blog website. This will be a fully functional website that will show the list of posts and empower readers to interact with them by adding comments and liking posts.

## Built With

- Ruby on Rails

## Additional Tools

- rubocop
- stylelint
- Ruby Gems

## Versions
- Ruby  ~3.1.0
- PostgreSQL  ~12.9
- Node.js  ~14.17.6
- Yarn  ~1.22.17

## `Getting Started`

To get a local copy of this project:

Clone this repository or download the Zip folder:
```
$ git clone git@github.com:KDlamini/mindly.git
```
Then:
```
$ cd mindly

$ gem install bundler

$ bundle install
```

To start App:
```
$ rails server
```

To view on browser:
```
http://localhost:3000
```

## Database creation

Create a Postgres user:
```
$ su - postgres
```

After that access Postgres:
```
psql
```

Then create a user (or a “role”, as Postgres calls it):
```
CREATE ROLE mindly WITH CREATEDB LOGIN PASSWORD 'mindly';
```

Migrate the database:
```
$ bin/rails db:create
```

Initialize the database:
```
$ bin/rails db:setup
```

## `Tests`

### To run rails tests:
```
$ bin/rails test
```

### Running specs:
Default: Run all spec files (i.e., those matching spec/**/*_spec.rb):
```
$ bundle exec rspec
```
Run all spec files in a single directory (recursively):
```
$ bundle exec rspec spec/models
```
Run a single spec file:
```
$ bundle exec rspec spec/controllers/accounts_controller_spec.rb
```

Run a single example from a spec file (by line number):
```
$ bundle exec rspec spec/controllers/accounts_controller_spec.rb:8
```

See all options for running specs:
```
$ bundle exec rspec --help
```

### To track linter errors locally follow these steps:

Track Ruby linter errors run:
```
$ rubocop
```
To auto-correct correctable Rubocop offenses run:
```
$ rubocop --auto-correct-all | rubocop -A
```

## Authors

👤 **Simo Nkosi**

- GitHub: [@KDlamini](https://github.com/KDlamini)
- Twitter: [@RealSimoNkosi](https://twitter.com/RealSimoNkosi)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/simo-nkosi-418523180/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/KDlamini/mindly/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- This project is part module 4 in the Microverse study program.
- Thanks to the Microverse team for the great curriculum.
- Thanks to Code Reviewers for the insightful feedback.
- A great thanks to My coding partners, morning session team, and standup team Partners for their contributions.

## 📝 License

This project is [MIT](./MIT.md) licensed.
