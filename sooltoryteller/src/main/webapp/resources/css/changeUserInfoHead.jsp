<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<style>
	
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
	  background-color: #f2eff9;
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
	  color: purple;
	  text-decoration: none;
	  cursor: pointer;
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