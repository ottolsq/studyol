package com.example.studyol.entity;

public class Chapter {
    private String id;
    private String courseId;
    private String title;
    private int chapterOrder;

    public Chapter() {
    }

    public Chapter(String id, String courseId, String title, int chapterOrder) {
        this.id = id;
        this.courseId = courseId;
        this.title = title;
        this.chapterOrder = chapterOrder;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getChapterOrder() {
        return chapterOrder;
    }

    public void setChapterOrder(int chapterOrder) {
        this.chapterOrder = chapterOrder;
    }
}
