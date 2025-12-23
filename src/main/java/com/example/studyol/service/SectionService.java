package com.example.studyol.service;

import com.example.studyol.entity.Section;
import com.example.studyol.Dao.SectionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SectionService {


    @Autowired
    private SectionDao sectionDao;
    public List<Section> findAllSections() {
        return sectionDao.findAllSections();
    }
}
