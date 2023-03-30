package com.diegoferreirati.br.pokemonapp.controller;

import org.apache.commons.logging.Log;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Logger;

@Controller
@RequestMapping("/hello")
public class HelloController {

    private static final Logger LOG = Logger.getLogger(HelloController.class.getName());

    @GetMapping
    public static ResponseEntity<String> sayHello() {
        Date date = new Date();
        SimpleDateFormat DateFor = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String stringDate= DateFor.format(date);
        LOG.info(String.format("Hello, today is %s",stringDate));
        return ResponseEntity.ok(String.format("Hello, today is %s",stringDate));
    }

    @GetMapping("/error")
    public static ResponseEntity<String> simulateError() {
        LOG.severe("Bad Request create user");
        return ResponseEntity.badRequest().body("Error on request");
    }


}
