package com.jetbrains.hibernate7.demo;

import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

import static jakarta.persistence.GenerationType.SEQUENCE;

@Entity
@Table(name = "products")
class Product {
    @Id
    @GeneratedValue(strategy = SEQUENCE, generator = "product_id_generator")
    @SequenceGenerator(name = "product_id_generator", sequenceName = "product_id_seq")
    Long id;

    @Column(nullable = false, unique = true, length = 100)
    @NotEmpty(message = "Product code is required")
    String code;

    @NotEmpty(message = "Product name is required")
    @Column(nullable = false, length = 200)
    String name;

    @Column(columnDefinition = "text")
    String description;

    @Column(length = 500)
    String imageUrl;

    @NotNull(message = "Product price is required")
    @DecimalMin("0.1")
    @Column(nullable = false)
    BigDecimal price;

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                ", price=" + price +
                '}';
    }
}
