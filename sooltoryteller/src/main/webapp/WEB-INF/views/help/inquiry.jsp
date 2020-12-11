<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/topmenu.jsp" %>
<%@include file="/WEB-INF/views/include/servicesidebar.jsp" %>
<%@include file="/resources/css/helpInquiry.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 style="margin: 0 0 10px 20px;">1:1문의</h3>
        <div class="h-inq-body">
          <form action="#" method="POST">
          <div>
             <p style="text-align: left; margin: 0;">번호(일단 수기로 입력쓰)</p>
              <p style="margin: 0;"><input class="h-inq-title" name="faqId"></p>
          </div>
          <div>
              <p style="text-align: left; margin: 0;">제목</p>
              <p style="margin: 0;"><input class="h-inq-title" name="title"></p>
          </div>
          <div>
              <p style="text-align: left; margin: 0;">내용</p>
              <p style="margin: 0;"><textarea class="h-inq-content" name="cn"></textarea></p>
          </div>
          <div style="margin-top:20px;">
              <button type="button" class="h-faq-btn" id="h-reg-btn">등록</button>
              <button type="button" class="h-faq-btn" onclick="location.href='#'">취소</button>
          </div>
          </form>
  
      </div>

    


    </div><!--인크루드 하는 페이지에 넣기-->
    </div><!--인크루드 하는 페이지에 넣기-->

<!-- Modal  추가 -->
<div id="h-myModal" class="h-modal">
  <div class="h-modal-content">
    <span class="h-close">&times;</span>
   <p style="text-align: center;" class="h-modal-body">1:1문의 접수되었습니다.</p>
   <p style="text-align: center;"><button type="button" class="h-btn" id="h-YESbtn">확인</button></p>
   </div>
</div>
</body>
</html>