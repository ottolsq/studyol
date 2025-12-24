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

    public Course findCourseById(int id) {
        return courseDao.findCourseById(id);
    }

    public List<Course> findCourseByType(String type){
        return courseDao.findCourseByType(type);
    }

    public List<Course> findCourseByUserId(String id){
        return courseDao.findCourseByUserId(id);
    };

    public boolean addUserCourse(String user_id, int course_id){
        courseDao.addUserCourse(user_id, course_id);
        return true;
    }

    public int isSelectedCourse(String user_id, int course_id){
        return  courseDao.isSelectedCourse(user_id, course_id);
    }
}
