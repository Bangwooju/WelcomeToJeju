
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
    margin-right:10px;
    }
</style>
    

<div class="card-container">
  <div class="card align-middle" style="width:20rem; border-radius:20px;">
    <div class="card-title" style="margin-top:30px;">
      <h2 class="card-title text-center" style="color:#113366;">내 정보</h2>
    </div>
<div class = "card-body">
<form id = "update-form" action='../user/update' method='post'>

<div class="mb-3 row">
<h5>이메일</h5>
  <div class="col-sm-16">
  <input id='f-email' type='email' name='email' value='${loginUser.email}' class="form-control" readonly>
  </div>
</div>

<div class="mb-3 row">
<h5>암호</h5>
  <div class="col-sm-16">
  <input id='f-password' type='password' name='password' class="form-control" >
  </div>
</div>

<div>
<h5>이모지</h5>
<select class="form-select" aria-label="f-emoji" id="f-emoji" name="emoji">
  <option selected value="">👇</option>
  <option value="127776;">&#127776;</option>
  <option value="128511;">&#128511;</option>
  <option value="128031;">&#128031;</option>
  <option value="127754;">&#127754;</option>
  <option value="128674;">&#128674;</option>
  <option value="9992;">&#9992;</option>
</select>
</div>

<br>

<div class="mb-3 row">
<h5>닉네임</h5>
  <div class = "col-sm-16">
  <input id='f-nickname' type='nickname' name='nickname' class="form-control" value = "${loginUser.nickname}">
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
  <input id='f-viewCount' type='text' name='viewCount' value='${loginUser.viewCount}' class="form-control"  readonly>
  </div>
</div>

<div class="mb-3 row">
<h5>경고</h5>
  <div class="col-sm-16">
  <input id='f-warningCount' type='text' name='warningCount' value='${loginUser.warningCount}' class="form-control"  readonly>
  </div>
</div>

<div class="mb-3 row">
<h5>가입일</h5>
  <div class="col-sm-16">
  <input id='f-registeredDate' type='date' name='registeredDate' value='${loginUser.registeredDate}' class="form-control"  readonly><br>
  </div>
</div>

<button id ="x-update-btn"class="btn btn-outline-dark btn-block" 
style = "color : #ffff; background-color:#F6BB43; border:none;">회원 수정</button>
</form>

<button type="button" class="btn btn-outline-dark btn-block" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
style = "color : #ffff; background-color:#F6BB43; border:none;">
 탈퇴하기
</button>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">회원 탈퇴</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        정말 탈퇴하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
        style = "color : #ffff; background-color:#F6BB43; border:none;">아니오</button>

        <a href = "../user/delete?no=${loginUser.no}" class="btn btn-primary" 
        style = "color : #ffff; background-color:#F6BB43; border:none;">네</a>
      </div>
    </div>
  </div>
</div>

<form class="form-logout" action = "logout">
<button class="btn btn-outline-dark btn-block"
style = "color : #ffff; background-color:#F6BB43; border:none;">로그아웃</button>
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


