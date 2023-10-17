<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#subject {
		box-sizing: border-box;
		width: 100%;
		padding: 6px 10px;
	}
	
	#content {
		width: 100%;
		height: 200px;
	}
</style>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/css/ckeditor.css">
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/super-build/ckeditor.js"></script>
<script src="${pageContext.servletContext.contextPath }/js/ckeditor.js"></script>
<script>
	window.onload = function() {
		CKEDITOR.ClassicEditor.create(document.getElementById("content"), option);
	}
	
		
 	var boardCheck = function() {
		if(document.getElementById("subject").value=="") {
			alert("제목을 입력하세요...");
			return false;
		}
		/* 		
 		console.log(document.getElementById("content").value);
		// 값이 있으면 true, 없으면 false
		if(!document.getElementById("content").value) {
			alert("글 내용을 입력하세요...")
			return false;
		}
		return true;
		*/
	}
	</script>
</head>
<body>
	<h1>글쓰기 폼</h1>
	<form method="post" action="${pageContext.servletContext.contextPath }/board/writeOk" onsubmit="return boardCheck()">
		<ul>
			<li>제목</li>
			<li><input type="text" name="subject" id="subject" /></li>
			<li>글내용</li>
			<li>
				재난종류 : 
				<select name="disasterType">
					<option value="Earthquake">지진</option>
					<option value="Rain">호우</option>
					<option value="Heat">폭염</option>
					<option value="Typhoon">태풍</option>
					<option value="Wind">강풍</option>
					<option value="Diasease">전염병</option>
					<option value="Etc">기타</option>
				</select>
				지역 : 
				<select name="location">
						<option value="Seoul">서울</option>
						<option value="Gyunggi">경기</option>
						<option value="Inchoen">인천</option>
						<option value="Gangwon">강원</option>	
				 </select>
			</li>
			<li><textarea name="content" id="content"></textarea></li>
			<li>
				<input type="submit" value="등록">
				<input type="reset" value="다시쓰기">
			</li>
		</ul>
	</form>
</body>
</html>
