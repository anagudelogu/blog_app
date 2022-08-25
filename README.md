![](https://img.shields.io/badge/Microverse-blueviolet)

# Blog app

**[Work in progress]**

The Blog app is a classic example of a blog website. It's a fully functional website that shows the list of posts and empower readers to interact with them by adding comments and liking posts.

## Built With

- Ruby
- Rails

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- You should have ruby installed in your machine, you can follow the steps given by the [official documentation](https://www.ruby-lang.org/en/documentation/installation/).

- You should have a postgres user with superuser permissions. you can refer to the official [postgres documentation](https://www.postgresql.org/docs/current/role-attributes.html#:~:text=To%20create%20a%20new%20database,that%20is%20already%20a%20superuser.&text=A%20role%20must%20be%20explicitly,use%20CREATE%20ROLE%20name%20CREATEDB%20.) to create or update a role.

### Setup

First, you must clone this repository locally running this command:

```
git clone git@github.com:anagudelogu/blog_app.git
```

and navigate to the cloned directory:

```
cd blog_app
```

### Install

Once inside the project directory, you should install all project dependencies:

- Install bundler:

```
gem install bundler
```

- Install project dependencies

```
bundle install
```

### Usage

You can get the app running locally by opening a local server:

```
bin/rails server
```

### Run tests

If you're on a linux-based system, you could run the executable file to run all specs:

```
bin/rspec
```

Windows users have to specify ruby in this case:

```
ruby bin/rspec
```

## Authors

👤 **Andres Agudelo**

- GitHub: [@anagudelogu](https://github.com/anagudelogu)
- Twitter: [@AgudeloAndres\_\_](https://twitter.com/AgudeloAndres__)
- LinkedIn: [Andres Agudelo Guzman](https://linkedin.com/in/aagst)

👤 _Juan Francisco Rosario Suli_

- GitHub: [@jrosario19](https://github.com/jrosario19)
- Twitter: [@jrosario19](https://twitter.com/jrosario19)
- LinkedIn: [Juan Fco. Rosario](https://linkedin.com/in/juan-francisco-rosario-suli-44595051)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/anagudelogu/blog_app/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./LICENSE) licensed.
