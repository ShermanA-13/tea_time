## **Rails Setup**
1. Create a Base Directory
* On your local machine open a terminal session and enter the following commands to create a base directory, unless one already exists, for the app.
    * Use the command `mkdir <your directory>`
    * Use the command `cd <your directory>`

```shell
$ mkdir <your directory>
$ cd <directory>
```

2. Clone these repositories:
* On your local machine open a terminal session and enter the following commands for SSH or HTTPS to clone the back end repositiory.

- using ssh key <br>
```shell
$ git clone git@github.com:ShermanA-13/tea_time.git
```

- using https <br>
```shell
$ git clone https://github.com/ShermanA-13/tea_time.git
```

* Once cloned, you'll have a new local copies of the directories you ran the clone command in. You can check what is in the directory by running the following command<br>

```sh
$ ls
#ex.
  tea_time
```

4. Install required Gems utilizing Bundler: <br>
In terminal, use Bundler to install any missing Gems. If Bundler is not installed, first run the following command.

```shell
$ gem install bundler
```

* If Bundler is already installed or after it has been installed, run the following command.

```shell
$ bundle install
```

* There should be be verbose text diplayed of the installation process that looks similar to below. (this is not an actual copy of what will be output).
<details>
<summary><b>Click to see example!</b></summary>
<p>

```shell
$ bundle install
Fetching gem metadata from https://rubygems.org/...........
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Using rake 13.0.6
Using concurrent-ruby 1.1.10
...
...
...
Using simplecov_json_formatter 0.1.4
Using simplecov 0.21.2
Using spring 2.1.1
Using spring-watcher-listen 2.0.1
Using standard 1.12.1
Bundle complete! 23 Gemfile dependencies, 94 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```

</p>
</details></br>

* If there are any errors, verify that bundler, Rails, and your ruby environment are correctly setup.

5. Database Migration & Seeding<br>
Before using the web application you will need to setup your databases locally by running the following command

```shell
$ rails db:{create,migrate}
```

<details>
<summary><b>Click to see example!</b></summary>
<p>

```shell
Created database 'tea_time_development'
Created database 'tea_time_test'
== 20220728141808 CreateTeas: migrating =======================================
-- create_table(:teas)
   -> 0.0065s
== 20220728141808 CreateTeas: migrated (0.0065s) ==============================

== 20220728142007 CreateCustomers: migrating ==================================
-- create_table(:customers)
   -> 0.0017s
== 20220728142007 CreateCustomers: migrated (0.0017s) =========================

== 20220728142211 CreateSubscriptions: migrating ==============================
-- create_table(:subscriptions)
   -> 0.0084s
== 20220728142211 CreateSubscriptions: migrated (0.0084s) =====================
```

</p>
</details></br>

6. Startup and Access<br>
* Finally, in order to access the database endpoints run the following command in your terminal:

```shell
$ rails s
```

<details>
<summary><b>Click to see example!</b></summary>
<p>

```shell
=> Booting Puma
=> Rails 5.2.8 application starting in development
=> Run `rails server -h` for more startup options
Puma starting in single mode...
* Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://localhost:5000
Use Ctrl-C to stop
```

</p>
</details></br>


* Switch to a new tab `CMD + T` in your terminal then navigate to the front end directory with the command:

```sh
$ cd ../craft-circle-ui
```

* You can shut down the server process by entering Cmd-C in the terminal window.

## Test Suite
Run the test suite with:
```
bundle exec rspec
```

To access test coverage files, run:
```
open coverage/index.html
```