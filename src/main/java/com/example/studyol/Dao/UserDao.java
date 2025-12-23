package com.example.studyol.Dao;

import com.example.studyol.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface UserDao {

    @Select("select * from users")
    // 查询所有用户
    public List<User> findAllUsers();

    // 根据用户id查询用户信息
    @Select("select * from users where id = #{id}")
    public User findUserById(String id);

    // 用户注册
    //    INSERT INTO users (id, username, password, school, qualification, email, region, position) VALUES
    //       ('USER001', '张三', '123456', '北京大学', '本科', 'zhangsan@example.com', '北京市', '软件工程师')
    // todo: 注册时，应当需要校验用户名是否重复，并将密码加密
    @Insert("insert into users(id, username, password, school, qualification, email, region, position) values(#{id}, #{username}, #{password}, #{school}, #{qualification}, #{email}, #{region}, #{position})")
    public void register(User user);

    // 用户登录
    // 根据用户名查询用户信息
    // todo: 登录时应当将密码加密
    @Select("select * from users where username = #{username}")
    public User findUserByUsername(String username);


    // 修改用户信息
    // todo: 应当提供修改密码的接口
    // update users set username = 'test111', school = 'test111', qualification = 'test111', email = 'test111', region = 'test111', position = 'test111' where id = 'USER100';
    @Update({"update users set username = #{username}, school = #{school}, qualification = #{qualification}, email = #{email}, region = #{region}, position = #{position} where id = #{id}"})
    public void updateUser(User user);
}