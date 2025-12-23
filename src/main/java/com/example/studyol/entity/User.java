package com.example.studyol.entity;

// 实体类
public class User {
    private String id;
    private String username;
    private String password;
    private String school;
    private String qualification;
    private String email;
    private String region;
    private String position;

    public User() {
    }

    public User(String id, String username, String password, String school, String qualification, String email, String region, String position, String[] selectedCourses) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.school = school;
        this.qualification = qualification;
        this.email = email;
        this.region = region;
        this.position = position;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}