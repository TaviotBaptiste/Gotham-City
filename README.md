<div align="center" id="top"> 
  <img src="./.github/app.gif" alt="Gotham-City" />

  &#xa0;

  <!-- <a href="https://tpoo700lyo_17.netlify.app">Demo</a> -->
</div>

<h1 align="center">Gotham-City</h1>

<p align="center">
  <img alt="Github top language" src="https://img.shields.io/github/languages/top/Xildrite/Gotham-City?color=56BEB8">

  <img alt="Github language count" src="https://img.shields.io/github/languages/count/Xildrite/Gotham-City?color=56BEB8">

  <img alt="Repository size" src="https://img.shields.io/github/repo-size/Xildrite/Gotham-City?color=56BEB8">

  <img alt="License" src="https://img.shields.io/github/license/Xildrite/Gotham-City?color=56BEB8">

  <!-- <img alt="Github issues" src="https://img.shields.io/github/issues/Xildrite/Gotham-City?color=56BEB8" /> -->

  <!-- <img alt="Github forks" src="https://img.shields.io/github/forks/Xildrite/Gotham-City?color=56BEB8" /> -->

  <!-- <img alt="Github stars" src="https://img.shields.io/github/stars/Xildrite/Gotham-City?color=56BEB8" /> -->
</p>

<!-- Status -->

<!-- <h4 align="center"> 
	🚧  Gotham-City 🚀 Under construction...  🚧
</h4> 

<hr> -->

<p align="center">
  <a href="#dart-about">About</a> &#xa0; | &#xa0; 
  <a href="#sparkles-features">Features</a> &#xa0; | &#xa0;
  <a href="#rocket-technologies">Technologies</a> &#xa0; | &#xa0;
  <a href="#white_check_mark-requirements">Requirements</a> &#xa0; | &#xa0;
  <a href="#checkered_flag-starting">Starting</a> &#xa0; | &#xa0;
  <a href="#memo-license">License</a> &#xa0; | &#xa0;
  <a href="https://github.com/Xildrite" target="_blank">Author</a>
</p>

<br>

## :dart: About ##

Gotham City is a university project. Development time is 3 weeks.

## :sparkles: Features ##

:heavy_check_mark: It's possible to authenticate with a JWT token
:heavy_check_mark: CRUD for a user (Create, Read, Update, Delete)
:heavy_check_mark: Manage a team
:heavy_check_mark: See charts
:heavy_check_mark: Use Docker for CI/CD

## :rocket: Technologies ##

The following tools were used in this project:

- [Node.js](https://nodejs.org/en/)
- [Vue.js](https://vuejs.org/)
- [Elixir-lang](https://elixir-lang.org/)
- [Phoenix Framework](https://www.phoenixframework.org/)
- [Docker](https://www.docker.com/)
- [Postgres](https://www.postgresql.org/)
- [JWT](https://jwt.io/)


## ::monocle_face:: Look ##

- Charts
<img width="1439" alt="Charts" src="https://user-images.githubusercontent.com/30879857/202930001-536d663e-5286-4bc9-8884-4b4deb091263.png">


- Auth
<img width="1439" alt="Auth" src="https://user-images.githubusercontent.com/30879857/202930035-33f30687-662b-447d-8035-5751d9537c46.png">

- Profile
<img width="1439" alt="Profile" src="https://user-images.githubusercontent.com/30879857/202930055-5135aad9-6e83-44b7-8a15-325b50e0aef4.png">

- Admin
<img width="1439" alt="Admin" src="https://user-images.githubusercontent.com/30879857/202930088-a3f0ef44-34a1-4f81-8778-ef7266c6f9b2.png">


## :white_check_mark: Requirements ##

Before starting :checkered_flag:, you need to have [Git](https://git-scm.com), [Postgres](https://www.postgresql.org/), [Elixir-lang](https://elixir-lang.org/) and [Node](https://nodejs.org/en/) installed.

## :checkered_flag: Starting ##

```bash
# Clone this project
$ git clone https://github.com/Xildrite/Gotham-City

# Access
$ cd Gotham-City

# Run the front
$ cd front
$ npm install
$ npm upgrade && update
$ npm run dev 

# Run the back
$ cd timemanager
# In config/dev.exs modify postgres identifiers
$ mix ecto.create
$ mix phx.server


# The server will initialize in the <http://localhost:5173/>
```

## :memo: License ##

This project is under license from MIT.


Made with :heart: by <a href="https://github.com/Xildrite" target="_blank">Xildrite</a>

&#xa0;

<a href="#top">Back to top</a>
