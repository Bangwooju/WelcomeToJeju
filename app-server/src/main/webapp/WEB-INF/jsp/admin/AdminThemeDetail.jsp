<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <style>
    .themedetail {
    margin : 30px;
    float : left;
    }
    
    .placemenu {
    margin : 30px;
    float : right;
    }
  </style>

<body>
<br> <br> <br> <br> <br>
 
<div class="themedetail">
	<p>
	  <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
	    ${theme.title} 상세 보기 🔍
	  </button>
	</p>
	<div class="collapse" id="collapseExample">
	  <div class="card card-body">
		  <form action='update'>
		  <label for='f-no'>번호</label>
		  <input id='f-no' type='text' name='no' value='${theme.no}' readonly><br>
		  
		  <label for='f-title'>제목</label>
		  <input id='f-title' type='text' name='title' value='${theme.title}' readonly>
		  <a href='../likedtheme/add?no=${theme.no}&no=${loginUser.no}'> 🤍</a><br>
		  
		  <label for='f-nickname'>닉네임</label>
		  <input id='f-nickname' type='text' name='nickname' value='${theme.owner.nickname}' readonly> 🤍<br>
		  
		  <label for='f-category'>카테고리</label>
		  <input id='f-category' type='text' name='category' value='${theme.category.name}' readonly><br>
		  
		  <label for='f-hashtags'>해시태그</label>
		  <input id='f-hashtags' type='text' name='hashtags' value='${theme.hashtags}' readonly><br>
		 <button><a href='themedelete?no=${theme.no}'>[삭제]</a></button>
      <button><a href='alltheme'>[목록]</a></button>
		 
		  </form>
	  </div>
	</div>
</div>  <!-- .themedetail -->

<div class="placemenu">
<a href='../place/add'>장소 등록하기 ✏️</a>
<br>
<jsp:include page="../place/PlaceList.jsp"/>
</div>  <!-- .placemenu -->
</body>

<!-- </html> -->
