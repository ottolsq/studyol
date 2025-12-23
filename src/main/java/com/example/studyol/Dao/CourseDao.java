package com.example.studyol.Dao;

import com.example.studyol.entity.Course;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CourseDao {
    // 获取所有课程信息
    List<Course> findAllCourses();

    // 根据课程id查询课程信息

    // 根据课程类别查询课程信息

    // 根据用户id查询他的选课信息
}
