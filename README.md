# musiclj

The musi.clj has been made as a library of artists, albums and songs.
It's a Clojure project generated using [Luminus][1]
v1.16.7, Ring, Korma for database operations, Selmer library for
HTML template rendering (similar to Django templating), Timbre for logging,
Environ for using database configurations from a single file and Bootstrap
and JavaScript for frontend development.

[Luminus][1] is a template for web applications. Luminus
generates a project and wires in the libraries to support pretty much every
aspect of web development including sessions, cookies, route-handling and
template rendering.

[Ring][2] is a Clojure web applications
library, which acts as an abstraction between our web application (musi.clj)
and the underlying web server or servlet container.

[Korma][3] is a pure-Clojure DSL for SQL. However,
be careful with Korma since their website is currently down for quite some time,
which might indicate that the project has been canceled. Some Clojure
enthusiasts are keeping the library up-to-date as much as they can.

[Selmer][4] is an HTML template rendering
library modeled after the Django framework. Selmer allows us to generate
dynamic pages, script loops and conditional rendering, extend other Selmer
templates, and so on.

[Timbre][5] is a pure-Clojure logging
library. There's not much else to say.

[Environ][6] allows us to create different
application configurations for different environments.

[Migratus][7] is an API and plugin for Leiningen that automatically migrates
, and rolls back, our database. In a nutshell, it allows us to create a 
series of SQL scripts, which will be executed in order (based on filename)
against our database.

Bootstrap and JavaScript are pretty self-explanatory.

## Prerequisites

You will need [Leiningen][8] 2.0 or above and [PostgreSQL][9] installed.

## Running

These are the steps for running the application:

##### 1. First of all, install PostgreSQL and add the bin folder to your PATH.
##### 2. From the terminal (please don't use Windows Shell), launch psql:

```
# psql -U postgres -d postgres -h localhost
```

##### 3. Create the musiclj database role and give it the ability to connect
to the database as though it were a user:

```
postgres=# CREATE ROLE musiclj LOGIN;
```

##### 4. You should give the new musiclj role a password. Something really secure,
like p455w0rd. We can do this using the \password command.

```
postgres=# \password musiclj;
```

##### 5. Now that we have a role, with which we can use to log in to the database,
we should create the musiclj schema and assign our musiclj role to be a
"super user" of that schema:

```
postgres=# CREATE SCHEMA AUTHORIZATION musiclj;
postgres=# GRANT ALL ON SCHEMA musiclj TO musiclj;
postgres=# GRANT ALL ON ALL TABLES IN SCHEMA hipstr TO hipstr;
```

##### 6. Finally, exit the PostgreSQL shell

```
postgres=# \q
```

After disconnecting from the PostgreSQL shell, we can test out our new user
by logging in to the default database using the musiclj role.

Back at the terminal, relaunch psql, but this time using the musiclj 
role we created:

```
# psql -U musiclj -d postgres -h localhost
```

That is it for the postgres terminal part. You can type \dt to see all
the tables you have in the schema. Now, for Migratus:

##### 7. Type the following in your terminal from the root of your musiclj directory:

```
# lein migratus migrate
```

This will migrate any yet-to-be-run migration script inside our migrations
directory.

##### 8. Finally, you can type the following to start the application:

```
# lein ring server
```

After that, just create an account in order to access the main pages of the website.

## "License"

The project was developed as part of an assignment for the course Software
Engineering Tools and Methodology on Master's studies - Software Engineering
and Computer Sciences at the Faculty of Organizational Sciences, University of Belgrade, Serbia.



[1]: http://luminusweb.com/
[2]: https://github.com/ring-clojure/ring
[3]: https://github.com/korma/Korma
[4]: https://github.com/yogthos/Selmer
[5]: https://github.com/ptaoussanis/timbre
[6]: https://github.com/weavejester/environ
[7]: https://github.com/yogthos/migratus-lein
[8]: https://github.com/technomancy/leiningen
[9]: https://www.postgresql.org/download/