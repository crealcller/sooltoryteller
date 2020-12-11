<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<style>

		.h-inq-body{
            width: 900px;
            height: 600px;
            padding-left: 20px;
        }

        .h-inq-title{
            width: 700px;
        }
        .h-inq-content{
            width: 700px;
            height: 300px;
            resize: none;
        }
        .h-inq-btn{
            width: 50px;
            height: 25px;
            border: none;
            background-color: rgb(181, 135, 189);
            color: white;
        }

		.h-modal {
	         display: none;
	         position: fixed; 
	         z-index: 1;
           padding-top: 100px; 
           left: 0;
           top: 0;
           width: 100%; 
           height: 100%; 
           overflow: auto; 
           background-color: rgb(0,0,0); 
           background-color: rgba(0,0,0,0.4);
        }
	

        .h-modal-content {
          background-color: #d8e1f1;
          margin: auto;
          padding: 20px;
          border: 1px solid #888;
          width: 30%;
        }
        
        /* The Close Button */
        .h-close {
          color: #aaaaaa;
          float: right;
          font-size: 28px;
          font-weight: bold;
        }
	
        .h-close:hover,
        .h-close:focus {
          color: purple(181, 135, 189);
          text-decoration: none;
        }

        .h-btn{
          height: 30px;
          width: 50px;
          border: none;
          color: white;
          margin: 10px;
          background-color: rgb(181, 135, 189);
        }
</style>