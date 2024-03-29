
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>

<style>
 .card-container{
    display : flex;
    justify-content: center;
    padding: var(--font-great) 0 ;
}
  .btn-block {
    float:left;
    margin-right:8px;
    }
</style>
    

<div class="card-container">
  <div class="card align-middle" style="width:20rem; border-radius:20px;">
    <div class="card-title" style="margin-top:30px;">
      <h2 class="card-title text-center" style="color:#113366;">회원 상세 보기</h2>
    </div>
<div class = "card-body">
<form id = "update-form" action='userupdate?no=${user.no}' method='post'>

<div class="mb-3 row">
<h5>이메일</h5>
  <div class="col-sm-16">
  <input id='f-email' type='email' name='email' value='${user.email}' class="form-control" readonly>
  </div>
</div>

<div class="mb-3 row">
<h5>암호</h5>
  <div class="col-sm-16">
  <input id='f-password' type='password' name='password' class="form-control" >
  </div>
</div>

<div class="mb-3 row">
<h5>닉네임</h5>
  <div class = "col-sm-16">
  <input id='f-nickname' type='nickname' name='nickname' class="form-control" value = "${user.nickname}">
  <div class="invalid-feedback">
        이미 존재하는 닉네임입니다.
    </div>
  </div>
  <div class="col-auto">
    <button id="x-nickname-check-btn" type="button" class="btn btn-outline-dark form-control"
    style="color : #ffff; background-color:#F6BB43; border:none; margin-left: 197px; width: 85px;">중복검사</button>
  </div>
</div>

<div class="mb-3 row">
<h5>조회수</h5>
  <div class="col-sm-16">
  <input id='f-viewCount' type='text' name='viewCount' value='${user.viewCount}' class="form-control"  readonly>
  </div>
</div>

<div class="mb-3 row">
<h5>경고</h5>
  <div class="col-sm-16">
  <input id='f-warningCount' type='text' name='warningCount' value='${user.warningCount}' class="form-control"  readonly>
  </div>
</div>

<div class="mb-3 row">
<h5>가입일</h5>
  <div class="col-sm-16">
  <input id='f-registeredDate' type='date' name='registeredDate' value='${user.registeredDate}' class="form-control"  readonly><br>
  </div>
</div>

<button id ="x-update-btn"class="btn btn-outline-dark btn-block" 
style = "color : #ffff; background-color:#F6BB43; border:none;">회원 수정</button>
</form>

<a href="userdelete?no=${user.no}" class="btn btn-outline-dark btn-block" 
style = "color : #ffff; background-color:#F6BB43; border:none;">회원 삭제</a>

<form class="form-logout" action = "userlist">
<button class="btn btn-outline-dark btn-block"
style = "color : #ffff; background-color:#F6BB43; border:none;">유저 목록</button>
</form>

</div>
</div>
</div>


<script>
document.querySelector("#update-form").onsubmit = () => {
	if (document.querySelector("#f-password").value == "" ) {
	    window.alert("필수 입력 항목이 비어 있음!")
	    return false;
	  }
	};
			
			
var updateBtn = document.querySelector("#x-update-btn");
var nicknameTag = document.querySelector("#f-nickname");
updateBtn.setAttribute("disabled", "disabled");

document.querySelector("#x-nickname-check-btn").onclick = () => {
    var xhr = new XMLHttpRequest();
    xhr.addEventListener("load", function() {
      if (this.responseText == "false") {
        updateBtn.removeAttribute("disabled");
          nicknameTag.classList.remove("is-invalid");
      } else {
        updateBtn.setAttribute("disabled", "disabled");
        nicknameTag.classList.add("is-invalid");
      }
    })
    xhr.open("get", "../user/checkNickname?nickname=" + nicknameTag.value);
    xhr.send();
};

</script>

