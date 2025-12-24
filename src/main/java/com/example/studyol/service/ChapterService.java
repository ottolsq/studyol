package com.example.studyol.service;

import com.example.studyol.entity.Chapter;
import com.example.studyol.Dao.ChapterDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChapterService {

    @Autowired
    private ChapterDao chapterDao;

    public List<Chapter> findAllChapters() {
        return chapterDao.findAllChapters();
    }

    public List<Chapter> findChaptersByCourseId(int course_id) {
        return chapterDao.findChaptersByCourseId(course_id);
    }

    public Chapter findChapterById(int chapter_id) {
        return chapterDao.findChapterById(chapter_id);
    }
}
