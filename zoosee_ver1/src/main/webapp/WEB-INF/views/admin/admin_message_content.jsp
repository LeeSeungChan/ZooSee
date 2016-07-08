<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/sb.css">

<div class="BJHeaderLayout0">
   <div class="BJHeaderLayout">
      <div class="BJHeader2">
         <a class="BJA" href="${initParam.root}admin_MessageList.do">보낸 메세지 목록</a> 
         <a class="BJA" href="${initParam.root}admin_message.do">메세지 보내기</a>
      </div>
   </div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
   <div class="BJPanel" style="width: 80%; margin-left: 10%;">
      <div class="panel panel-info">
         <div class="panel-heading">
            <h3 class="panel-title">관리자 메세지</h3>
         </div>
         <div class="panel-body">관리자 메세지는 ZOOSEE를 이용하는 모든 회원에게 보내는 메세지입니다.</div>
      </div>
      <div class="well well-sm"> 전체회원에게 보낸 메세지 </div>
   </div>
   <div class="BJMain2Div">
      <div class="BJWriteTableLine">
         <div class="BJHrAllLine">
            <table class="BJFreeBoardShowContentTable ">
               <tr>
                  <td align="right">제목 :</td>
                  <td align="left" colspan=3>${message.title}</td>
               </tr>
               <tr>
                  <td align="right">보낸시간 :</td>
                  <td align="left" colspan=3>${message.time_posted}</td>
               </tr>
            </table>
            <hr class="BJHr">
            ${message.content}
         </div>
      </div>
   </div>
</div>

<div style="width:100%; height: 50px; margin-top: 2%;">
   <input class="active SBbtn btn-default" style="width:5%; margin-left:48%; "onclick="history.go(-1)" type="button" value="확인" >   
</div>
