![](https://img.shields.io/badge/Microverse-blueviolet)

# Social Media

> In this project me and my partner added friendship features and tests to a initiated social media

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4
- Rspec
- Capybara
- VScode
- Git
- Github

## Live Demo

[Deployed Application](https://glacial-chamber-62779.herokuapp.com/users/sign_in)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Get your enviroment variables ready:

- Create a file inside your root path with the name of `.env` and add the following:

```
MY_PASSWORD=your_database_password
MY_NAME=your_database_username
```


Setup database with:

```
   rails db:create
   rails db:migrate
```

### Github Actions

To make sure the linters' checks using Github Actions work properly, you should follow the next steps:

1. On your recently forked repo, enable the GitHub Actions in the Actions tab.
2. Create the `feature/branch` and push.
3. Start working on your milestone as usual.
4. Open a PR from the `feature/branch` when your work is done.


### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    bundle exec rspec --format documentation
```

## Authors

👤 **João Vítor Montanholi Nunes** 

- GitHub: [jmontanholi](https://github.com/jmontanholi) 
- Twitter: [MontanholiNunes](https://twitter.com/MontanholiNunes) 
- LinkedIn: [Joao vitor montanholi](https://www.linkedin.com/in/joaovitormontanholi/) 

👤 **Arthur Borges**

- GitHub: [@arthurborgesdev](https://github.com/arthurborgesdev)
- Twitter: [@arthurmoises](https://twitter.com/arthurmoises)
- LinkedIn: [Arthur Borges](https://linkedin.com/in/arthurmoises)

## 🤝 Contributing

Contributions and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse original project](https://github.com/arthurborgesdev/private-events/edit/development/README.md)

## 📝 License

[MIT](./LICENSE)

