package com.welcomeToJeju.moj.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.welcomeToJeju.moj.dao.ReportDao;
import com.welcomeToJeju.moj.dao.ThemeDao;

@Controller
public class ReportController {

  @Autowired ReportDao reportDao;
  @Autowired ThemeDao themeDao;




}
