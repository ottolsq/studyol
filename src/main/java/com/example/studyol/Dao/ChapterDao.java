package com.example.studyol.Dao;

import com.example.studyol.entity.Chapter;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ChapterDao {
    // 获取所有章节信息
    List<Chapter> findAllChapters();

    // 根据章节id查询章节信息

    // 根据课程id查询章节信息


}
