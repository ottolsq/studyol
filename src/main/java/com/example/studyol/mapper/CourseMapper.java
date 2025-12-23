package com.example.studyol.mapper;

import com.example.studyol.entity.Course;

import java.util.List;

public interface CourseMapper {
    List<Course> findAllCourses();
}
