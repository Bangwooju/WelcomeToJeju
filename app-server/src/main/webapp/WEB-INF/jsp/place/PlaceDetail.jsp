<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
  <title>장소 리스트</title>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=667ac3a1fc68d5afe81179dea5f4ff16&libraries=services"></script>
  <script defer src="https://kit.fontawesome.com/a340a3bb10.js" crossorigin="anonymous"></script>
  <script defer type="text/javascript" src="${contextRoot}/javascript/place_detail.js?ver=2"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${contextRoot}/css/place_list.css?ver=2">
</head>



<body>
  <div class="container">
    <div class="container_body">
      <div class="place_info_box">
        <label for='f-place-name'>장소 이름</label>
        <input id='place_name' type='text' name='place_name' 
        style =" text-align: center;" readonly>
      </div>
      
      <div class="place_info_box">
        <label for='f-address-name'>주소</label>
        <input id='address_name' type='text' name='address_name' 
        style =" text-align: center;" readonly>
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
      </div>
    </div>
  </div>
  </body>

<!-- 
<meta charset="UTF-8">
	<title>장소 상세 보기</title>
</head>

<body>
<h1>장소 상세 보기(MVC + EL)</h1>

장소 상세 보기 🔍
<form action='PlaceUpdate.jsp'>
  <label for='f-id'>번호</label>
  <input id='f-id' type='text' name='id' value='${place.id}' readonly><br>
  
  <label for='f-storeName'>이름</label>
  <input id='f-storeName' type='text' name='storeName' value='${place.storeName}' readonly><br>
  
  <label for='f-storeAddress'>주소</label>
  <input id='f-storeAddress' type='text' name='storeAddress' value='${place.storeAddress}' readonly><br>
  
  <label for='f-xCoord'>위도</label>
  <input id='f-xCoord' type='text' name='xCoord' value='${place.xCoord}' readonly><br>
  
  <label for='f-yCoord'>경도</label>
  <input id='f-yCoord' type='text' name='yCoord' value='${place.yCoord}' readonly><br>
  
  <label for='f-photos'>사진</label>
  <input id='f-photos' type='text' name='photos' value='${place.photos}'><br>
  
  <label for='f-comments'>댓글</label>
  <input id='f-comments' type='text' name='comments' value='${place.comments}'><br>
  
  <button>변경</button>
  <a href='delete?id=${place.id}'>[삭제]</a>
  <a href='list?no=${theme.no}'>[목록]</a><br>
</form>

</body>


 -->
</html>
