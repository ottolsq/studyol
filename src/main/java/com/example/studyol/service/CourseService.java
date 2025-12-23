package com.example.studyol.service;

import com.example.studyol.entity.Course;
import com.example.studyol.mapper.CourseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {
    @Autowired
    private CourseMapper CourseMapper;
    public List<Course> findAllCourses() {
        return CourseMapper.findAllCourses();
    }
}
