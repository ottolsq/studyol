package com.example.studyol.service;

import com.example.studyol.entity.User;
import com.example.studyol.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;
    public List<User> findAllUsers() {
        return userMapper.findAllUsers();
    }
}