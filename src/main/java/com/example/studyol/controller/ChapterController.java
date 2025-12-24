package com.example.studyol.controller;

import com.example.studyol.entity.Chapter;
import com.example.studyol.service.ChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ChapterController {
    @Autowired
    private ChapterService chapterService;

    @RequestMapping("/allChapters")
    public List<Chapter> getAllChapters() {
        return chapterService.findAllChapters();
    }

    @GetMapping("/getChaptersByCourseId/{id}")
    public List<Chapter> getChaptersByCourseId(@PathVariable int id) {
        return chapterService.findChaptersByCourseId(id);
    }

    @GetMapping("/getChapterById/{id}")
    public Chapter getChapterById(@PathVariable int id) {
        return chapterService.findChapterById(id);
    }
}
