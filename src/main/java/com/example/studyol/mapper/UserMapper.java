package com.example.studyol.mapper;


import com.example.studyol.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {

    // 查询所有用户
    List<User> findAll();
}