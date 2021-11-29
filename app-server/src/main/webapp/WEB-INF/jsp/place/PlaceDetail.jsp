<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
  <title>장소 리스트</title>
  
</head>



<body>
  <div class="container">
    <div class="card card-body">
        <label for='f-place-name'>장소 이름</label>
        <input id='f-place_name' type='text' name='place_name' 
        style =" text-align: center;" value = "${place.place_name}" readonly>
      
        <label for='f-address-name'>주소</label>
        <input id='f-address-name' type='text' name='address_name' 
        style =" text-align: center;" value = "${place.address_name}" readonly>
      
        <label for='f-comment'>후기</label>
        <div id='f-comment' rows="5" cols="30">
	        <c:forEach items="${place.comments}" var = "comment">
	          <div> ${comment.comment}</div>
	        </c:forEach>
        </div>
      
      <button class="place_cancel_btn" type="button"
      style="background-color:transparent;">닫기</button>
    </div>
  </div>

  </body>
</html>
