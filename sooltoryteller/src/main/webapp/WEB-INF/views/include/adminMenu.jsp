<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


	<style>
        body {
          margin: 0;
          padding: 0;
        }

        @font-face {
          font-family: '전소민체';
          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/전소민체.woff') format('woff');
          font-weight: normal;
          font-style: normal;
        }

        .h-logo{
            width: 1300px;
            text-align: center;
        }

        .h-logo-img{
            height: 50px;
            width: 40px;
        }
        
        #h-company-name{
            text-decoration: none;
            font-family: '전소민체';
            font-size: 40px;
            color: black;
            font-weight: bold;
        }

        .h-imgarea{
            width: 1300px;
            height: 300px;            
            background-color: navy;
            text-align: center;
        }
        
        .h-centerImg{
            width: 1300px;
            height: 300px;
        }
        
        .h-body{
            width: 1300px;
            height: 600px;
            display: inline-block;
        }

        .h-sidebar {
          margin: 0;
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
          background-color: navy;
          color: white;
        }
        
        div.h-content {
          width: 1100px;
          height: 600px;
          overflow: hidden;
          display: inline-block;
        }
        
        
 </style>
  <body>

        <div class="h-logo">
            <img src='/resources/img/logo.png' class="h-logo-img">
            <a href="#" id="h-company-name">술토리텔러</a>
        </div>

        <div class="h-imgarea">
            <img src='/resources/img/adminpage.jpg' class="h-centerImg">
        </div>
        
        <div class="h-body">
            <div class="h-sidebar">
              <a href="/admin" id='h-admin-home'>Home</a>
              <a href="/admin/memberlist" id='h-admin-list'>회원관리</a>
              <a href="#">1:1문의</a>
              <a href="#">F&Q등록</a>
            </div><div class="h-content">
 