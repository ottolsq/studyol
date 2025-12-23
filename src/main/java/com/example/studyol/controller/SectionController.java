package com.example.studyol.controller;

import com.example.studyol.entity.Section;
import com.example.studyol.service.SectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class SectionController {

    @Autowired
    private SectionService sectionService;

    @RequestMapping("/allSections")
    public List<Section> getAllSections() {
        return sectionService.findAllSections();
    }
}
