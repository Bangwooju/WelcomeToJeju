<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set scope="page" var="contextRoot" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextRoot}/css/theme_list.css">

  
<div class = "container">
<h1>🔎 해시태그 ${keyword}로 찾은 테마 목록</h1>
<ul class="theme-list">
<c:forEach items="${themeList}" var="theme">
  <a class="list-container" href="../place/list?no=${theme.no}">
    <li>
    <div class="content">
      <div class="icon">${theme.emoji}</div>
      <div class="theme-title">${theme.title}</div>
      <div class="theme-count">${theme.hashtags}</div>
    </div>  <!-- .content -->
    </li>
  </a>
</c:forEach>
<c:forEach begin="0" end="${3-(fn:length(themeList)%3)-1}">
    <a class="list-container" style=visibility:hidden;>
      <li>
        <div class="content">
          <div class="icon">${theme.emoji}</div>
          <div class="theme-title">${theme.title}</div>
          <div class="theme-count">#${theme.hashtags}</div>
        </div>  <!-- .content -->
      </li>
    </a>
</c:forEach>
</ul>

</div><!--  .container -->
