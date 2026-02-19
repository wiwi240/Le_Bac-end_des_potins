# The Gossip Project

A simple Ruby on Rails application for creating and sharing short messages ("gossips"), with users, tags, comments, likes, and cities. This repository contains the application code used in a Fullstack training exercise.

**Status:** Prototype / learning project

**Tech stack:**
- **Rails:** ~> 8.0.4
- **Database:** SQLite3 (default for development)
- **Web server:** Puma
- **JavaScript:** Importmap, Turbo, Stimulus

**Main features**
- User signup, login and authentication
- Create, edit and delete gossips
- Tagging system for gossips
- Comments on gossips
- Likes for gossips
- City association for users

**Prerequisites**
- Ruby (compatible with the Rails version in `Gemfile`)
- Bundler
- SQLite3 (for local development)
- Node.js / npm is not required when using importmap, but useful for asset tooling if you add it

**Quick setup (development)**

1. Clone the repository:

	```bash
	git clone <repository-url>
	cd the_gossip_project
	```

2. Install gems:

	```bash
	bundle install
	```

3. Set up the database:

	```bash
	rails db:create db:migrate db:seed
	```

4. Start the Rails server:

	```bash
	rails server
	```

5. Visit the app at `http://localhost:3000`.

**Running tests**

```bash
rails test
``` 

**Common commands**
- Run migrations: `rails db:migrate`
- Open Rails console: `bin/rails console`

**Docker**
This project includes a `Dockerfile` and can be containerized. Adjust and use your preferred Docker workflow or the provided scripts if present.

**Contributing**
This repository is a learning project. Feel free to open issues or submit pull requests with improvements or fixes.

**License**
This project does not include a license file. Add a license if you plan to publish or share the code publicly.

---

For more details about the application structure, see the `app/`, `config/`, and `db/` directories.
