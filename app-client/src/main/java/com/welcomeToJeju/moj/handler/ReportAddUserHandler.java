package com.welcomeToJeju.moj.handler;

import java.sql.Date;
import org.apache.ibatis.session.SqlSession;
import com.welcomeToJeju.moj.dao.ReportDao;
import com.welcomeToJeju.moj.dao.UserDao;
import com.welcomeToJeju.moj.domain.Report;
import com.welcomeToJeju.moj.domain.ReportUser;
import com.welcomeToJeju.moj.domain.User;
import com.welcomeToJeju.util.Prompt;

public class ReportAddUserHandler implements Command {

  ReportDao reportDao;
  UserDao userDao;
  SqlSession sqlSession;

  public ReportAddUserHandler(ReportDao reportDao,UserDao userDao, SqlSession sqlSession) {
    this.reportDao = reportDao;
    this.userDao = userDao;
    this.sqlSession = sqlSession;
  }

  @Override
  public void execute(CommandRequest request) throws Exception {

    System.out.println("[유저 신고하기]");
    ReportUser reportUser = new ReportUser();

    String userNickName = Prompt.inputString("신고할 유저 닉네임 >");
    User reportedUser = userDao.findByName(userNickName);

    if (reportedUser == null) {
      System.out.println("등록된 유저 없음!");
      return;
    }

    if(userNickName.equals(AuthLoginHandler.getLoginUser().getNickName())) {
      System.out.println("본인은 신고 불가!");
      return;
    }

    reportUser.setReportedUserName(userNickName);

    System.out.println();

    String content = Prompt.inputString("신고 사유 > ");
    reportUser.setContent(content);
    reportUser.setRegisteredDate(new Date(System.currentTimeMillis()));
    reportUser.setWriter(AuthLoginHandler.getLoginUser());
    reportUser.setState(Report.WAITING);

    reportDao.userInsert(reportUser);
    reportedUser.setReportedCount(reportedUser.getReportedCount()+1);
    userDao.updateReportedCount(reportedUser.getReportedCount(), reportedUser.getNo());
    sqlSession.commit();
    System.out.println("유저 신고 완료!");

  }



}