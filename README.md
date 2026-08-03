# Hibernate 7.4 Reverse Engineering Demo
=============================================
A sample repository demonstrating Hibernate 7.4 Reverse Engineering feature.

Hibernate Reverse Engineering

The reverse engineering module, previously part of the standalone Hibernate Tools project, is now integrated directly into Hibernate ORM. 
It is available as plugins for Gradle, Maven, and Ant.

The reverse engineering plugins can generate:
* Java entity classes
* DAO classes
* hbm.xml mapping files
* mapping.xml mapping files
* hibernate.cfg.xml configuration files
* DDL scripts
* HTML documentation

## How to run?

```shell
# start postgres using Docker Compose
$ docker compose up -d

# Generate JPA entities, DAOs, schema.ddl
$ ./mvnw generate-sources
```

The generated JPA entities and DAO classes will be in `target/generated-sources`, and `schema.ddl` file in `target/generated-resources` directories.


## References

* [Hibernate Reverse Engineering](https://docs.hibernate.org/orm/7.4/userguide/html_single/#tooling-reveng)
* Reverse Engineering with Hibernate 7.4 and IntelliJ IDEA: https://blog.jetbrains.com/idea/2026/07/reverse-engineering-with-hibernate-7-4-and-intellij-idea/