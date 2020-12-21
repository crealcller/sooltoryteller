<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
		.h-imgarea{
            width: 1520px;
            height: 300px;            
            background-color: white;
            text-align: center;
        }
        .h-centerImg{
            width: 1520px;
            height: 300px;
        }
        .h-body{
            width: 1520px;
            height: 600px;
            margin-top:30px;
            display: inline-block;
        }

        
        .h-sidebar {
          margin-left: 20px;
          padding: 0;
          width: 200px;
          height: 600px;
          text-align: center;
          overflow: hidden;
          display: inline-block;
        }
        
        .h-sidebar a {
          display: block;
          color: black;
          padding: 16px;
          font-weight: bold;
          text-decoration: none;
        }
        
        .h-sidebar a:hover {
          background-color: rgb(181, 135, 189);
          color: white;
        }
        
        div.h-content {
          width: 900px;
          height: 600px;
          margin-left: 50px;
          overflow: hidden;
          display: inline-block;
          
        }
        
</style>
<body>
	<div class="h-imgarea">
    <img src='/resources/img/QnaTitle.jpg' class="h-centerImg">
	</div>

	<div class="h-body">
    <div class="h-sidebar">
      <a href="/help/faq" id="h-help-faq">자주묻는질문</a>
      <a href="/help/inquiryregister" id="h-help-inquiry">1:1문의</a>
    </div><div class="h-content">

</body>
