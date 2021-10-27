package com.welcomeToJeju.moj.handler;

import org.apache.ibatis.session.SqlSession;
import com.welcomeToJeju.moj.dao.ThemeDao;
import com.welcomeToJeju.moj.domain.Category;
import com.welcomeToJeju.moj.domain.Theme;
import com.welcomeToJeju.util.Prompt;

public class MyThemeAddHandler implements Command {
  ThemeDao themeDao;
  SqlSession sqlSession;

  public MyThemeAddHandler(ThemeDao themeDao, SqlSession sqlSession) {
    this.themeDao = themeDao;
    this.sqlSession = sqlSession;
  }

  public void execute(CommandRequest request) throws Exception {
    Theme theme = new Theme();
    System.out.println();
    System.out.println("[나의 테마 등록하기]");

    theme.setTitle(Prompt.inputString("테마 이름(취소 : 엔터) > "));

    if (theme.getTitle().equals("")) {
      System.out.println("나의 테마 등록 취소!");
      return;
    }

    Category category = new ThemeHandlerHelper(themeDao).promptCategory();

    theme.setCategory(category);

    while (true) {
      String input = Prompt.inputString("해시 태그(완료: 엔터) > ");
      if (input.length() == 0)
        break;

      theme.getHashtags().add(input);
    }

    String publicOption = Prompt.inputString("공개 설정(Y/n) > ");
    if (publicOption.equalsIgnoreCase("y") || publicOption.equals("")) {
      theme.setPublic(true);
    }
    theme.setOwner(AuthLoginHandler.getLoginUser());

    themeDao.insert(theme);
    for(String h : theme.getHashtags()) {
      themeDao.insertHashtags(theme.getNo(),h);
    }
    sqlSession.commit();

  }

}
