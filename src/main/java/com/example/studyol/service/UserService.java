package com.example.studyol.service;

import com.example.studyol.entity.User;
import com.example.studyol.Dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public List<User> findAllUsers() {
        return userDao.findAllUsers();
    }

    public User findUserById(String id) {
        return userDao.findUserById(id);
    }

    public boolean register(User user) {
        userDao.register(user);
        return true;
    }

    public String login(String username, String inputPassword) {
        User user = userDao.findUserByUsername(username);
        if(user.getPassword().equals(inputPassword)){
            return user.getId();
        }
        return "fail";
    }

    public boolean updateUser(User user) {
        userDao.updateUser(user);
        return true;
    }

}