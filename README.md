## Using Unit tests with dbt

Just a small proof-of-concept for using unit tests in dbt.

This project requires dbt version 1.8, currently in alpha and will probably only work together with postgres (which is part of the core dbt package). To install it, follow the "install from source" instruction in the dbt documentation: https://docs.getdbt.com/docs/core/source-install

The project consists of one seed, one model, and one unit test. Truly minimal. The unit test 

Steps to run the unit test:

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

4. Run the unit test, which is part of the normal tests: `dbt test`. Our unit test is located in `models/jaffle/customers.yml`, in the block aptly named `unit_tests`, and gets picked up automatically.

5. You should see an output similar to this:

```
22:33:41  Running with dbt=1.8.0-a1
22:33:41  Registered adapter: postgres=1.8.0-a1
22:33:42  Found 1 model, 1 seed, 0 sources, 0 exposures, 0 metrics, 409 macros, 0 groups, 0 semantic models, 1 unit test
22:33:42  
22:33:42  Concurrency: 1 threads (target='dev')
22:33:42  
22:33:42  1 of 1 START unit_test unit_customers .......................................... [RUN]
22:33:42  1 of 1 PASS unit_customers ..................................................... [PASS in 0.16s]
22:33:42  
22:33:42  Finished running 1 unit_test in 0 hours 0 minutes and 0.31 seconds (0.31s).
22:33:42  
22:33:42  Completed successfully
22:33:42  
22:33:42  Done. PASS=1 WARN=0 ERROR=0 SKIP=0 TOTAL=1
```