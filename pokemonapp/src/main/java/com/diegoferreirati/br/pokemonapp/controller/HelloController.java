package com.diegoferreirati.br.pokemonapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/hello")
public class HelloController {

    private static final Logger LOG = LoggerFactory.getLogger(HelloController.class);
    
    @GetMapping
    public static ResponseEntity<String> sayHello() {
        Date date = new Date();
        SimpleDateFormat DateFor = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String stringDate= DateFor.format(date);
        LOG.info(String.format("Hello, today is %s", stringDate));
        return ResponseEntity.ok(String.format("Hello, today is %s",stringDate));
    }

    @GetMapping("/error")
    public static ResponseEntity<String> simulateError() {
        LOG.error("Bad Request create user");
        return ResponseEntity.badRequest().body("Error on request");
    }


}
