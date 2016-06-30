<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

</script>
<div class="BJMainKING">
<form name="updateForm" action="interceptor_petsitter_update.do" style="text-align: center;"
method="post" enctype="multipart/form-data" id="updateForm">

<br><br>
<h3 align="center">ZOOSEE 돌보미 정보</h3><br><br>
<br>
<br>
<br>


<div style="border:1px solid #DFDFDF; border-radius: 6px;  background-color:#F4F4F4;  text-align: center; width: 30%; margin-left: 35%">

<br>


 <div style=" margin:0 auto; width:500px; height:500px;" align="center">
         <img id="UploadedImg2" style="border: 3px solid #DFDFDF;"
            src="${petsitterVO.petsitterImg}"
            class="center-block img-circle img-responsive" width="90%" height="90%">
            *돌보미 사진
  </div>


<div style=" margin:0 auto; width:500px; height:500px;" align="center">
         <img id="UploadedImg" style="border: 3px solid #DFDFDF;"
            src="${petsitterVO.houseImg}"
            class="center-block img-circle img-responsive" width="90%" height="90%">
            *집 사진
  </div><br>





<div class="form-group" style="width:200px; text-align: center; margin-left: auto; margin-right: auto;" >
  <label class="control-label">*돌보미님 아이디</label>
  <div class="input-group">
    <span class="input-group-addon">ID</span>
    <input type="text" class="form-control" style="height: 60%; background-color:#F4F4F4; " id="name" name="name"
    readonly="readonly" value="${petsitterVO.memberVO.id }">
  </div>
</div>

<br>

<div class="form-group" style="width:200px; text-align: center; margin-left: auto; margin-right: auto;" >
  <label class="control-label">*돌보미님 이름</label>
  <div class="input-group">
    <span class="input-group-addon">NAME</span>
    <input type="text" class="form-control" style="height: 60%; background-color:#F4F4F4; " id="name" name="name"
    readonly="readonly" value="${petsitterVO.memberVO.name }">
  </div>
</div>

<br>

<div class="form-group" style="width:200px;  text-align: center; margin-left: auto; margin-right: auto;" >
  <label class="control-label">*원하시는 가격(1박)</label>
  <div class="input-group">
    <span class="input-group-addon">$</span>
    <input type="text" class="form-control" style="height: 60%;  background-color:#F4F4F4;" name="price" id="price" value="${petsitterVO.price }" readonly="readonly">
  </div>
</div>

<br>


<div class="form-group" style="width:200px; text-align: center; margin-left: auto; margin-right: auto;" >
  <label class="control-label">*팻 종류</label>
  <div class="input-group">
    <span class="input-group-addon">Type</span>
    <input type="text" class="form-control" style="height: 60%; background-color:#F4F4F4; " id="name" name="name"
    readonly="readonly" value="${petsitterVO.petType }">
  </div>
</div>
<br>


<div class="form-group" style="width:200px; text-align: center; margin-left: auto; margin-right: auto;" >
  <label class="control-label">*팻 크기</label>
  <div class="input-group">
    <span class="input-group-addon">Size</span>
    <input type="text" class="form-control" style="height: 60%; background-color:#F4F4F4; " id="name" name="name"
    readonly="readonly" value="${petsitterVO.petSize }">
  </div>
</div>
<br>

<div class="form-group" style="width:200px; text-align: center; margin-left: auto; margin-right: auto;" >
  <label class="control-label">*돌봄 가능한 팻</label>
  <div class="input-group">
    <span class="input-group-addon">How many</span>
    <input type="text" class="form-control" style="height: 60%; background-color:#F4F4F4; " id="name" name="name"
    readonly="readonly" value="${petsitterVO.petNumber }마리">
  </div>
</div>
<br>

<div class="form-group" style="width:200px; text-align: center; margin-left: auto; margin-right: auto;" >
  <label class="control-label">*제공 서비스</label>
  <div class="input-group">
    <span class="input-group-addon">Service</span>
    <input type="text" class="form-control" style="height: 60%; background-color:#F4F4F4; " id="name" name="name"
    readonly="readonly" value="${petsitterVO.service }마리">
  </div>
</div>
<br><br>



<input type="button" class="active btn btn-block btn-default" value="홈으로" onclick="location.href='home.do' ">
<br><br>
</form>    

</div>
    