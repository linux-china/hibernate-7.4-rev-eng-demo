package com.jetbrains.hibernate7.demo;

import org.hibernate.SessionFactory;
import org.hibernate.jpa.HibernatePersistenceConfiguration;

import java.util.List;

public class HibernateUtils {

    static SessionFactory getSessionFactory() {
        List<Class<?>> entityClasses = List.of(
            Product.class
        );
         return new HibernatePersistenceConfiguration("Default")
                        .managedClasses(entityClasses)
                        .jdbcPoolSize(16)
                        .showSql(true, true, true)
                        .createEntityManagerFactory();
    }
}