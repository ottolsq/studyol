package com.example.studyol.Dao;

import com.example.studyol.entity.Chapter;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ChapterDao {
    // 获取所有章节数据
    @Select("select * from chapters")
    List<Chapter> findAllChapters();

    // 根据章节id查询章节信息
    @Select("select * from chapters where course_id = #{course_id}")
    List<Chapter> findChaptersByCourseId(int course_id);

    // 根据课程id查询章节数据
    @Select("select * from chapters where id = #{chapter_id}")
    Chapter findChapterById(int chapter_id);

}
