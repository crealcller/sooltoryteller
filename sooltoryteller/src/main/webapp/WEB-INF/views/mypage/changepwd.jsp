<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 비밀번호 변경</title>
<style>
        .h-pass{
            height: 280px;
            width: 450px;
            border: 1px solid;
        }
        .h-pass-content{
            margin: 20px;
        }
        .h-passbtn{
            height: 30px;
	        width: 50px;
	        border: none;
	        color: white;
	        margin: 10px;
	        background-color: rgb(181, 135, 189);
        }
    </style>
</head>
<body>
    <div class="h-pass">
    <div class="h-pass-content">
        <h1>비밀번호 변경~~~</h1>
        <form action="#" method="post">
        	<p style="margin-left: 20px;"><input type="password" placeholder="현재 비밀번호"></p>
        	<p style="margin-left: 20px;"><input type="password" placeholder="새 비밀번호"></p>
        	<p style="margin-left: 20px;"><input type="password" placeholder="새 비밀번호 확인"></p>
        	<div style="text-align: center;"><button type="submit" class="h-passbtn">변경</button> <button type="button" class="h-passbtn">취소</button></div>
		</form>
    </div>
    </div>
</body>
</html>