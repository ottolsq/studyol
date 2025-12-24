package com.example.studyol.entity;

public class Chapter {
    private int id;
    private int course_id;
    private String title;
    private int chapter_order;

    public Chapter() {
    }

    public Chapter(int id, int course_id, String title, int chapter_order) {
        this.id = id;
        this.course_id = course_id;
        this.title = title;
        this.chapter_order = chapter_order;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getChapter_order() {
        return chapter_order;
    }

    public void setChapter_order(int chapter_order) {
        this.chapter_order = chapter_order;
    }
}
