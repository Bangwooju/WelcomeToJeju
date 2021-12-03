<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set scope="page" var="contextRoot" value="${pageContext.servletContext.contextPath}"/>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
  <title>장소 상세보기</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=667ac3a1fc68d5afe81179dea5f4ff16&libraries=services"></script>
    <script defer src="https://kit.fontawesome.com/a340a3bb10.js" crossorigin="anonymous"></script>
    <script defer type="text/javascript" src="${contextRoot}/javascript/place_detail.js?ver=2"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${contextRoot}/css/place_list.css?ver=2">
</head>



<body>
  <div class="modal">
    <div class="modal_body">
        
        <div class="place_info_box">
        <label for='f-place-name'>장소 이름</label>
        <input id='place_name' type='text' name='place_name' readonly>
      </div>
      
      <div class="place_info_box">
        <label for='f-address-name'>주소</label>
        <input id='address_name' type='text' name='address_name' readonly>
      </div>
      
      <div class="place_info_box">
        <label for='f-comment'>후기</label>
        <div id='place_comment' rows="5" cols="30"></div>
      </div>
        
      <button class="place_cancel_btn" type="button"
      style="background-color:transparent;">닫기</button>
    </div>
  </div>

    <div class="map_container full-height">
        <div class="map_wrap">
          <div id="map"></div>
            <div id="menu_wrap" class="bg_white">
              <ul id="placesList"></ul>
            </div>
          </div>
        </div>

  </body>
</html>
