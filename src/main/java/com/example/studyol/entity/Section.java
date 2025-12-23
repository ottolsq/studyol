package com.example.studyol.entity;

public class Section {
    private String id;
    private String chapterId;
    private String sectionNumber;
    private String title;
    private int sectionOrder;
    private String type;
    private String content;

    public Section() {
    }

    public Section(String id, String chapterId, String sectionNumber, String title, int sectionOrder, String type, String content) {
        this.id = id;
        this.chapterId = chapterId;
        this.sectionNumber = sectionNumber;
        this.title = title;
        this.sectionOrder = sectionOrder;
        this.type = type;
        this.content = content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getChapterId() {
        return chapterId;
    }

    public void setChapterId(String chapterId) {
        this.chapterId = chapterId;
    }

    public String getSectionNumber() {
        return sectionNumber;
    }

    public void setSectionNumber(String sectionNumber) {
        this.sectionNumber = sectionNumber;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getSectionOrder() {
        return sectionOrder;
    }

    public void setSectionOrder(int sectionOrder) {
        this.sectionOrder = sectionOrder;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
