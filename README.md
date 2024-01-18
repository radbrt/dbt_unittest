## Using Unit tests with dbt

Just a small proof-of-concept for using unit tests in dbt.

This project requires dbt version 1.8, currently in alpha and will probably only work together with postgres (which is part of the core dbt package). To install it, follow the "install from source" instruction in the dbt documentation.

The project consists of one seed, one model, and one unit test. Truly minimal. The unit test 

Steps to test:

1. Start a local postgres database with docker:

```
docker run -p 5432:5432 -e POSTGRES_PASSWORD=postgres postgres:13
```

2. Add the following profile to your dbt `profiles.yml`:

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

3. Create the seed by running `dbt seed`.

4. Run the unit test, which is part of the normal tests: `dbt test`

