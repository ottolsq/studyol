package com.example.studyol.Dao;

import com.example.studyol.entity.Course;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CourseDao {
    // 获取所有课程信息
    @Select("select * from courses")
    public List<Course> findAllCourses();

    // 根据课程id查询课程信息
    @Select("select * from courses where id = #{id}")
    public Course findCourseById(int id);

    // 根据课程类别查询课程信息
    @Select("select * from courses where type = #{type}")
    public List<Course> findCourseByType(String type);

    // 根据用户id查询他的选课信息
    @Select("select * from courses where id in (select course_id from user_courses where user_id = #{id})")
    public List<Course> findCourseByUserId(String id);

    // 用户新增选课
    @Insert("insert into user_courses(user_id, course_id) values(#{user_id}, #{course_id})")
    public void addUserCourse(String user_id, int course_id);

    // 用户是否已选该课程
    @Select("select count(*) from user_courses where user_id = #{user_id} and course_id = #{course_id}")
    public int isSelectedCourse(String user_id, int course_id);
}
