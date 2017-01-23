package com.tek.buddies.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class HelloResource {

    @GetMapping("/api/hello/{name}")
    public String hello(@PathVariable String name){
        return "Hello, "+name+" !";
    }
}
