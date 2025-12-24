package com.example.studyol.entity;

public class Section {
    private int id;
    private int chapter_id;
    private String section_number;
    private String title;
    private int section_order;
    private int type;
    private String content;

    public Section() {
    }

    public Section(int id, int chapter_id, String section_number, String title, int section_order, int type, String content) {
        this.id = id;
        this.chapter_id = chapter_id;
        this.section_number = section_number;
        this.title = title;
        this.section_order = section_order;
        this.type = type;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getChapter_id() {
        return chapter_id;
    }

    public void setChapter_id(int chapter_id) {
        this.chapter_id = chapter_id;
    }

    public String getSection_number() {
        return section_number;
    }

    public void setSection_number(String section_number) {
        this.section_number = section_number;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getSection_order() {
        return section_order;
    }

    public void setSection_order(int section_order) {
        this.section_order = section_order;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
