package com.tek.buddies.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by vtortaja on 2017-03-20.
 */
@Entity
@Table(name="user")
@Data
public class User implements Serializable {

    @Id
    @Column(name = "user_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "email")
    private String email;
}
