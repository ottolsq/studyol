package com.example.studyol.controller;


import com.example.studyol.entity.User;
import com.example.studyol.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/all")
    public List<User> getAll() {
        return userService.findAll();
    }
}