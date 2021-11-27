package com.welcomeToJeju.moj.web.theme;

import java.util.Collection;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.welcomeToJeju.moj.dao.ThemeDao;
import com.welcomeToJeju.moj.dao.UserDao;
import com.welcomeToJeju.moj.domain.Category;
import com.welcomeToJeju.moj.domain.Theme;
import com.welcomeToJeju.moj.domain.User;

@Controller
public class MyThemeController {

  @Autowired ThemeDao themeDao;
  @Autowired UserDao userDao;
  @Autowired SqlSessionFactory sqlSessionFactory;

  @GetMapping("/mytheme/addform")
  public ModelAndView addform() {
    ModelAndView mv = new ModelAndView();
    mv.addObject("pageTitle", "나의 테마 만들기");
    mv.addObject("contentUrl", "theme/myTheme/MyThemeAddForm.jsp");
    mv.setViewName("template_main");
    return mv;
  }

  @PostMapping("/mytheme/add")
  public String add(HttpSession session, 
      String title, 
      String category,
      String isPublic,
      String hashtags,
      String emoji) throws Exception {
    User user = (User) session.getAttribute("loginUser");
    Theme theme = new Theme();
    theme.setTitle(title);
    theme.setIsPublic(Integer.parseInt(isPublic));
    theme.setOwner(user);
    String[] hashtagArr = hashtags.split(" ");

    Category c = themeDao.findCategoryByNo(Integer.parseInt(category));
    theme.setCategory(c);
    theme.setEmoji(emoji);
    themeDao.insert(theme);
    for (String hashtag : hashtagArr) {
      if(hashtag.length()==0) continue;
      themeDao.insertHashtag(theme.getNo(), "#"+hashtag);
    }
    sqlSessionFactory.openSession().commit();
    return "redirect:list?no=" + user.getNo();
  }

  @GetMapping("/mytheme/list")
  public ModelAndView list(int no) throws Exception {
    Collection<Theme> themeList = themeDao.findByUserNo(no);

    ModelAndView mv = new ModelAndView();
    mv.addObject("themeList", themeList);
    mv.addObject("pageTitle", "나의 테마 목록 보기");
    mv.addObject("contentUrl", "theme/myTheme/MyThemeList.jsp");
    mv.setViewName("template_main");
    return mv;
  }


  @PostMapping("/mytheme/update")
  public ModelAndView update(Theme theme, int category, String hashtags, HttpSession session) throws Exception {
    Theme oldTheme = themeDao.findByNo(theme.getNo());
    User user = (User) session.getAttribute("loginUser");
    Category c = themeDao.findCategoryByNo(category);
    theme.setCategory(c);
    theme.setEmoji(oldTheme.getEmoji());
    theme.setIsPublic(oldTheme.getIsPublic());
    theme.setOwner(oldTheme.getOwner());
    theme.setPlaceList(oldTheme.getPlaceList());
    theme.setReportedCount(oldTheme.getReportedCount());
    theme.setViewCount(oldTheme.getViewCount());  
    themeDao.deleteHashtag(oldTheme.getNo());
    themeDao.update(theme);

    String[] hashtagArr = hashtags.split("#");
    for (String hashtag : hashtagArr) {
      if(hashtag.length()==0) continue;
      themeDao.insertHashtag(theme.getNo(), hashtag);
    }
    sqlSessionFactory.openSession().commit();
    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:list?no=" + user.getNo());
    return mv;
  }

  // 테스트!!
  @GetMapping("/mytheme/delete")
  public ModelAndView delete(HttpSession session, int no) throws Exception {
    User user = (User) session.getAttribute("loginUser");
    Theme theme = themeDao.findByNo(no);
    themeDao.deleteAllLikedThemeByThemeNo(theme.getNo());
    themeDao.deleteHashtag(theme.getNo());
    themeDao.deletePlaceUserTheme(theme.getNo());
    themeDao.delete(theme.getNo());
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.addObject("pageTitle", "나의 테마 만들기");
    mv.addObject("contentUrl", "theme/myTheme/MyThemeAddForm.jsp");
    mv.setViewName("template_main");
    mv.setViewName("redirect:list?no=" + user.getNo());
    return mv;
  }


}
