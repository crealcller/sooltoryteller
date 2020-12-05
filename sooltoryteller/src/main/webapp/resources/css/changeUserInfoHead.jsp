<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<style>
.h-back{
    width: 100%;
    height: 600px;
    display: inline-block;
    background-color:  rgb(245, 245, 245);
    padding-left: 30px;
    overflow: hidden;
}
.h-imgarea{
    width: 430px;
    height: 550px;
    display: inline-block;
}
#h-backImg{
    width: 430px;
    height: 550px;
    opacity: 0.5;
}
.h-modify-content{
    width: 380px;
    height: 430px;
    margin: 0 0 50px 70px; 
    text-align: center;
    border-radius: 5%;
    border: 2px solid  rgb(181, 135, 189);
    background-color:  rgb(250, 250, 250);
    padding: 30px;
    display: inline-block;
    overflow: hidden;
}

.h-modibtn{
    height: 30px;
	width: 80px;
	border: none;
	color: white;
    margin: 20px;
	background-color: rgb(181, 135, 189);
}
.h-photo{
    height: 120px;
    width: 100px;
    border: 1px solid;
    display: inline-block;
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
	}

	.h-btn{
	  height: 30px;
	  width: 50px;
	  border: none;
	  color: white;
	  margin: 10px;
	  background-color: rgb(181, 135, 189);
	}
	
	.h-fav-drink{
    margin-top: 25px;
    border-top: 1.5px solid rgb(181, 135, 189);
}
	.h-drink{
    margin-left: 15px;
}
	
	</style>