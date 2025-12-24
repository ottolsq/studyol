package com.example.studyol.controller;

import com.example.studyol.entity.Course;
import com.example.studyol.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CourseController {
    @Autowired
    private CourseService courseService;

    @RequestMapping("/allCourses")
    public List<Course> getAllCourses() {
        return courseService.findAllCourses();
    }

    @GetMapping("/getCourseById/{id}")
    public Course getCourseById(@PathVariable int id) {
        return courseService.findCourseById(id);
    }

    @GetMapping("/getCourseByType/{type}")
    public List<Course> findCourseByType(@PathVariable String type) {
        return courseService.findCourseByType(type);
    }

    @PostMapping("/addUserCourse")
    public boolean addUserCourse(@RequestParam String user_id, @RequestParam int course_id){
        return courseService.addUserCourse(user_id, course_id);
    }

    @GetMapping("/getCourseByUserId/{id}")
    public List<Course> findCourseByUserId(@PathVariable String id){
        return courseService.findCourseByUserId(id);
    }

    @PostMapping("/isSelectedCourse")
    public int isSelectedCourse(@RequestParam String user_id, @RequestParam int course_id){
        return courseService.isSelectedCourse(user_id, course_id);
    }

}
