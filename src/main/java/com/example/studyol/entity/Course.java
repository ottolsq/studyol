package com.example.studyol.entity;

public class Course {
    private int id;
    private String name;
    private String teacher;
    private String school;
    private String type;
    private String introduction;
    private String image_url;

    public Course() {
    }

    public Course(int id, String name, String teacher, String school, String type, String introduction, String image) {
        this.id = id;
        this.name = name;
        this.teacher = teacher;
        this.school = school;
        this.type = type;
        this.introduction = introduction;
        this.image_url = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }
}
