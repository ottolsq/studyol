package com.example.studyol.controller;


import com.example.studyol.entity.User;
import com.example.studyol.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/allUsers")
    public List<User> getAllUsers() {
        return userService.findAllUsers();
    }

    @GetMapping("/getUserById/{id}")
    public User getUserById(@PathVariable String id) {
        return userService.findUserById(id);
    }

    @PostMapping("/register")
    public boolean register(@RequestBody User user){
        return userService.register(user);
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password){
        return userService.login(username, password);
    }

    @PutMapping("/updateUser")
    public boolean updateUser(@RequestBody User user){
        return userService.updateUser(user);
    }
}