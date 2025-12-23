package com.example.studyol.controller;

import com.example.studyol.entity.Chapter;
import com.example.studyol.service.ChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ChapterController {
    @Autowired
    private ChapterService chapterService;

    @RequestMapping("/allChapters")
    public List<Chapter> getAllChapters() {
        return chapterService.findAllChapters();
    }
}
