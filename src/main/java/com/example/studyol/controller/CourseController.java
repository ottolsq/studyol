package com.example.studyol.controller;

import com.example.studyol.entity.Course;
import com.example.studyol.entity.User;
import com.example.studyol.service.CourseService;
import com.example.studyol.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CourseController {
    @Autowired
    private CourseService courseService;

    @RequestMapping("/allCourses")
    public List<Course> getAllCourses() {
        return courseService.findAllCourses();
    }
}
