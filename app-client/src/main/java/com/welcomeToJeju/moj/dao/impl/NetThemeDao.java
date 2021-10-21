package com.welcomeToJeju.moj.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import com.welcomeToJeju.moj.dao.ThemeDao;
import com.welcomeToJeju.moj.domain.Place;
import com.welcomeToJeju.moj.domain.Theme;
import com.welcomeToJeju.request.RequestAgent;

public class NetThemeDao implements ThemeDao{
  RequestAgent requestAgent;

  public NetThemeDao(RequestAgent requestAgent) {
    this.requestAgent = requestAgent;
  }

  @Override
  public void insert(Theme theme) throws Exception {
    requestAgent.request("theme.insert", theme);
    if(requestAgent.getStatus().equals(RequestAgent.FAIL)) {
      throw new Exception(requestAgent.getObject(String.class));
    }
  }

  @Override
  public List<Theme> findAll() throws Exception {
    requestAgent.request("theme.list", null);
    if (requestAgent.getStatus().equals(RequestAgent.FAIL)) {
      throw new Exception(requestAgent.getObject(String.class));
    }

    return new ArrayList<>(requestAgent.getObjects(Theme.class));
  }

  @Override
  public void update(Theme theme) throws Exception {
    requestAgent.request("theme.update", theme);		
    if (requestAgent.getStatus().equals(RequestAgent.FAIL)) {
      throw new Exception(requestAgent.getObject(String.class));
    }
  }

  @Override
  public void delete(Theme theme) throws Exception {
    requestAgent.request("theme.delete", theme);
    if (requestAgent.getStatus().equals(RequestAgent.FAIL)) {
      throw new Exception(requestAgent.getObject(String.class));
    }
  }

  @Override
  public void placeInsert(Place place) throws Exception {
    requestAgent.request("theme.place.insert", place);
    if(requestAgent.getStatus().equals(RequestAgent.FAIL)) {
      throw new Exception(requestAgent.getObject(String.class));
    }
  }

  @Override
  public void placeDelete(Place place) throws Exception {
    requestAgent.request("theme.place.delete", place);
    if (requestAgent.getStatus().equals(RequestAgent.FAIL)) {
      throw new Exception(requestAgent.getObject(String.class));
    }
  }

  //  @Override
  //  public Theme search(String title) throws Exception {
  //    requestAgent.request("theme.search", title);
  //    if (requestAgent.getStatus().equals(RequestAgent.FAIL)) {
  //      throw new Exception(requestAgent.getObject(String.class));
  //    }
  //    return requestAgent.getObject(Theme.class);
  //  }

  @Override
  public List<Theme> hashtagSearch(String hashtagName) throws Exception {
    requestAgent.request("theme.hashtag.search", hashtagName);
    if (requestAgent.getStatus().equals(RequestAgent.FAIL)) {
      throw new Exception(requestAgent.getObject(String.class));
    }

    return new ArrayList<>(requestAgent.getObjects(Theme.class));
  }

  @Override
  public void likedThemeInsert(int themeNo, int userNo) throws Exception{
    HashMap<String, String> params = new HashMap<>();
    params.put("themeNo",Integer.toString(themeNo));
    params.put("userNo",Integer.toString(userNo));
    requestAgent.request("theme.liked.insert", params);
    if(requestAgent.getStatus().equals(RequestAgent.FAIL)) {
      throw new Exception(requestAgent.getObject(String.class));
    }
  }

  @Override
  public void likedThemeDelete(int themeNo,int userNo) throws Exception{
    HashMap<String, String> params = new HashMap<>();
    params.put("themeNo",Integer.toString(themeNo));
    params.put("userNo",Integer.toString(userNo));
    requestAgent.request("theme.liked.delete", params);
    if(requestAgent.getStatus().equals(RequestAgent.FAIL)) {
      throw new Exception(requestAgent.getObject(String.class));
    }
  }

  @Override
  public List<Theme> likedThemeList(int userNo) throws Exception{
    requestAgent.request("theme.liked.list", Integer.toString(userNo));

    if (requestAgent.getStatus().equals(RequestAgent.FAIL)) {
      throw new Exception(requestAgent.getObject(String.class));
    }

    return new ArrayList<>(requestAgent.getObjects(Theme.class));
  }

  @Override
  public Theme findByTitle(String themeTitle) throws Exception {
    // TODO Auto-generated method stub
    return null;
  }

}
