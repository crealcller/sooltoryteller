<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<style>
.s-bbst-container {
	border: 1px solid black;
	height: 900px;
	width: 800px;
	margin: 0 auto;
	margin-top: 50px;
}

.s-title-container {
	border: 1px solid black;
	height: 30px;
	width: 100%;
	margin: 5px 0;
}

.s-writer-info-container {
	border: 1px solid black;
	height: 50px;
	width: 100%;
}

.s-writer-info-div {
	border: 1px solid black;
	height: 100%;
	width: 500px;
	display: inline-block;
	font-size: 10px;
}

.s-writer-img-div {
	border: 1px solid black;
	height: 100%;
	width: 50px;
	display: inline-block;
	float: left;
}

.s-writer-img {
	margin-left: 6px;
}

.s-listBtn {
	width: 60px;
	border: none;
	margin-top: 15px;
	margin-right: 10px;
	cursor: pointer;
	float: right;
	color: white;
}

.s-listBtn a {
	color: white;
}

.s-cn-container {
	border: 1px solid #f2eff9;
	height: 760px;
	width: 95%;
	margin: 25px auto;
}

.s-bbst-cnImg-div {
	background-color: rgb(245, 245, 245);
}

.s-bbst-cnImg {
	height: 350px;
	width: 350px;
	margin: 0 auto;
}

.s-bbst-cnImg-src {
	height: 350px;
	width: 350px;
}

.s-bbst-cn-div {
	border: 1px solid black;
	height: 380px;
	width: 100%;
	margin-top: 30px;
	padding: 20px;
	background-color: rgb(245, 245, 245);
}

.s-bbstReply-modal-container {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px; /* 모달 내부창 위치 */
	left: 0;
	top: 0;
	height: 100%;
	width: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.s-bbstReply-modal-content {
	background-color: #fefefe;
	margin: auto;
	border: 1px solid #888;
	height: 350px;
	width: 350px;
}

</style>