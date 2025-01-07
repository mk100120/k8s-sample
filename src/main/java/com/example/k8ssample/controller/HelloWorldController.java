package com.example.k8ssample.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class HelloWorldController {


    @GetMapping("/v1/hello")
    public String helloWorld(){
        log.info("hello world");
        return "hello world";
    }
}
