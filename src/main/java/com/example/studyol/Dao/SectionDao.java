package com.example.studyol.Dao;

import com.example.studyol.entity.Section;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SectionDao {
    // 获取所有小节数据
    @Select("select * from sections")
    List<Section> findAllSections();

    // 根据章节id查询小节数据
    @Select("select * from sections where chapter_id = #{chapter_id}")
    List<Section> findSectionsByChapterId(int chapter_id);

    // 根据小节id查询小节数据
    @Select("select * from sections where id = #{section_id}")
    Section findSectionById(int section_id);
}
