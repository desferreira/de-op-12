package com.diegoferreirati.br.pokemonapp.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/hello")
public class HelloController {

    @GetMapping
    public static ResponseEntity<String> sayHello() {
        Date date = new Date();
        SimpleDateFormat DateFor = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String stringDate= DateFor.format(date);
        return ResponseEntity.ok(String.format("Hello, today is %s",stringDate));
    }


}
