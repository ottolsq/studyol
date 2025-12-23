package com.example.studyol.service;

import com.example.studyol.Dao.CourseDao;
import com.example.studyol.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {
    @Autowired
    private CourseDao courseDao;
    public List<Course> findAllCourses() {
        return courseDao.findAllCourses();
    }
}
