<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ZOOSEE HOME VIEW SETTING</title>
	<script type="text/javascript" src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/sb.css">
	<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/bj.css">
	<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/wj.css">
	
	<%-- <link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/jquery-ui.css"> --%>
	<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/jquery-ui.min.css">
	<%-- <script type="text/javascript" src="${initParam.root}resources/js/jquery-ui.js"></script> --%>
	<script type="text/javascript" src="${initParam.root}resources/js/jquery-ui.min.js"></script>
</head>
<body>
<div id="container">
	<div id="header"><tiles:insertAttribute name="header" /></div>
	<div id="main"><tiles:insertAttribute name="main"/></div>
	<div id="footer"><tiles:insertAttribute name="footer" /></div>
</div>
</body>
</html>
