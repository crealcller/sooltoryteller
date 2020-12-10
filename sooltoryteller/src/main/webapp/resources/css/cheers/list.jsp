<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<style>

.s-bbst-main-img-container {
	height: 300px;
	width: 100%;
	margin-top: 20px;
	margin-bottom: 20px;
}

.s-bbst-main-img-div {
	height: 100%;
	width: 100%;
}

.s-bbst-main-tool {
	border: 1px solid black;
	margin: 10px auto 10px auto;
	height: 50px;
	width: 900px;
}

.s-bbst-register-btn {
	width: 60px;
	margin-top: 14px;
	margin-left: 50px;
	border: none;
	cursor: pointer;
	transition: 0.3s;
	background-color: #6b5b95;
}

.s-bbst-register-btn a {
	color: white;
}

.s-bbst-search-container {
	margin-top: 11px;
	margin-right: 50px;
	display: inline-block;
	float: right;
}

.s-bbst-search-btn {
	width: 60px;
	border: none;
	cursor: pointer;
	transition: 0.3s;
	background-color: rgb(181, 135, 189);
	color: white;
}

.s-bbst-search-cancel {
	width: 60px;
	border: none;
	cursor: pointer;
	transition: 0.3s;
	background-color: #990000ff;
	color: white;
}

.s-bbst-container {
	width: 900px;
	margin: 0 auto;
}

.s-bbst-item-container {
	height: 320px;
	width: 250px;
	margin: 20px 25px 20px 25px;
	display: inline-block;
	position: relative;
	float: left;
}

.s-bbst-img {
	height: 250px;
	width: 250px;
	display: block;
}

.s-bbst-item-overlay {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	height: 250px;
	width: 250px;
	opacity: 0;
	transition: .3s ease;
	background-color: rgb(181, 135, 189);
}

.s-bbst-item-container:hover .s-bbst-item-overlay {
	opacity: 0.9;
}

.s-bbst-item-overlay-info {
	font-size: 12px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
	display: inline-block;
}

.s-bbst-info-div {
	height: 50px;
	width: 250px;
	margin-top: 3px;
	font-size: 11px;
}

.s-pagination {
	width: 800px;
	bottom: 0;
	display: block;
	overflow: hidden;
	list-style: none;
	margin: 25px auto 10px auto;
	text-align: center;
}

.s-pagination li {
	width: 20px;
	display: inline-block;
	cursor: pointer;
}

</style>