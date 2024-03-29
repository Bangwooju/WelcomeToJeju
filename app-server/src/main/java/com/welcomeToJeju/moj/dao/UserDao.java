package com.welcomeToJeju.moj.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.welcomeToJeju.moj.domain.User;

public interface UserDao {

  void insert(User user) throws Exception;
  void update(User user) throws Exception;
  void delete(int no) throws Exception;
  List<User> findAll() throws Exception;
  List<User> userTop10() throws Exception;

  User findByNickname(String nickname) throws Exception;
  User findByNo(int no) throws Exception;

  User findByEmail(String email) throws Exception;
  User findByEmailAndPassword(@Param("email") String email, @Param("password") String password) throws Exception;

  List<User> findByKeyword(String keyword) throws Exception;

  void updateViewCount(int no) throws Exception;
  void updateReportedCount(HashMap<String,Object> params) throws Exception;
  void updateWarnedCount(HashMap<String,Object> params) throws Exception;
  void updateActive(int no) throws Exception;

  List<User> userRankingByViewCount() throws Exception;
  List<User> findAllReportedUser() throws Exception;

  void insertLikedUser(@Param("likedUserNo") int likedUserNo, @Param("loginUserNo") int loginUserNo) throws Exception;
  void deleteLikedUser(@Param("likedUserNo") int likedUserNo, @Param("loginUserNo") int loginUserNo) throws Exception;
  void deleteAllLikedUser(int no) throws Exception;
  List<User> findAllLikedUser(int loginUserNo) throws Exception;


}
