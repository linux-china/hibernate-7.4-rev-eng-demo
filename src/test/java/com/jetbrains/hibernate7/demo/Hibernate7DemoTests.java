package com.jetbrains.hibernate7.demo;

import org.hibernate.SessionFactory;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.List;

import static java.lang.System.out;
import static org.junit.jupiter.api.Assertions.assertFalse;

class Hibernate7DemoTests {

    static SessionFactory sessionFactory;

    @BeforeAll
    static void init() {
        sessionFactory = HibernateUtils.getSessionFactory();
    }

    @Test
    void loadAllProducts() {
        sessionFactory.inSession(session -> {
            List<Product> products =
                    session.createSelectionQuery("from Product", Product.class)
                            .getResultList();
            assertFalse(products.isEmpty());
            products.forEach(out::println);
        });
    }
}
