# Hibernate 7.4 Reverse Engineering Demo
A sample repository demonstrating Hibernate 7.4 Reverse Engineering feature.

## How to run?

```shell
# start postgres using Docker Compose
$ docker compose up -d

# Generate JPA entities, DAOs, schema.ddl
$ ./mvnw generate-sources
```

The generated JPA entities and DAO classes will be in `target/generated-sources`, and `schema.ddl` file in `target/generated-resources` directories.
