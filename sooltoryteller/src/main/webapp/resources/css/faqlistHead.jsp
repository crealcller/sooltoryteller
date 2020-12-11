<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>

	table {
      border-collapse: collapse;
      width: 1000px;
      margin-left: 20px;
    }
        
    td, th {
      border-bottom: 1px solid #dddddd;
      text-align: left;
      padding: 8px;
    }
        
    tr:nth-child(even) {
      background-color: #d8e1f1;
    }
    
    ul{
      list-style:none;
    }   
    
    a{
      text-decoration: none;
      color: black;
    }
    
    .pull-right{
      text-align: right;
      margin-right: 100px;
    }
    
	.h-pagination {
  	  display: inline-block;
	}
	
	.h-pagination li {
  	  color: black;
  	  float: left;
  	  padding: 8px 16px;
  	}
  	
  	.h-pagination li.active{
  	  background-color: navy;
  	  border-radius: 50%;
  	}
  	
	.h-pagination li.active >a {
  	  font-weight:bold;
  	  color: white;
	}

	.h-pagination li:hover:not(.active) {background-color: #ddd; border-radius: 50%;}


	.h-faq-regbtn{
	   margin-left: 20px;
	   width: 60px;
       height: 25px;
       border: none;
       background-color: navy;
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
	  color: navy;
	  text-decoration: none;
	}

	.h-btn{
	  height: 30px;
	  width: 50px;
	  border: none;
	  color: white;
	  margin: 10px;
	  background-color: navy;
	}
</style>