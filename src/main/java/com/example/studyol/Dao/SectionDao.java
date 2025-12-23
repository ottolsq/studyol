package com.example.studyol.Dao;

import com.example.studyol.entity.Section;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SectionDao {
    // 获取所有小节信息
    List<Section> findAllSections();

    // 根据章节id查询小节信息


}
