## Using Unit tests with dbt

Just a small proof-of-concept for using unit tests in dbt.

This project requires dbt version 1.8, currently in alpha and will probably only work together with postgres (which is part of the core dbt package). To install it, follow the "install from source" instruction in the dbt documentation.

Add the following profile to your dbt `profiles.yml`:

```
unittest:
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      port: 5432
      user: postgres
      password: postgres
      dbname: postgres
      schema: public
```

Start a local postgres database with docker:

```
docker run -p 5432:5432 -e POSTGRES_PASSWORD=postgres postgres:13
```

