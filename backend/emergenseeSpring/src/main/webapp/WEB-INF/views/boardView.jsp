<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 보기</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/topButtonScript.js" defer></script>
    <script src="../js/notification.js" defer></script>
    <script src="../js/checkLogin.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        
        h2{
            margin-bottom: 7px;
        }
        .mainContainer {
            padding: 30px;
            margin-bottom: 70px;
        }

        #boardContainer {
            width: 800px;
            margin: 0 auto;
        }

        .viewContents {
            width: 100%;
            height: auto;
            padding: 15px 10px;
            line-height: 2em;
        }
        .viewContents>img{
            margin: 5px;
        }

        .viewInfo {
            display: flex;
            box-sizing: border-box;
            width: 100%;
            justify-content: space-between;
            align-items: center;
            margin: 0 auto;
            padding: 10px;
            border-bottom: 1px solid var(--pointYellow);
        }

        .left_space {
            text-align: start;
        }

        .right_space {
            text-align: end;
        }

        .viewBtns {
            text-align: end;
            width: 100%;
            padding: 5px;
            border-bottom: 3px solid var(--mainDark);
        }

        td:last-of-type {
            text-align: center;
        }

        #replyWrap{
            padding: 7px;
            border-bottom: 3px solid var(--mainDark);
        }
        .replyEdit{
            margin-top: 10px;
        }
        
        .boardListSmall {
            width: 100%;
            border-collapse: collapse;
        }

        .boardListSmall th,
        .boardListSmall td {
            border-bottom: 1px solid var(--pointBlue);
            padding: 4px;
            margin: 2px;
        }
        
        #replyArea {
        	padding: 10px 0px;
        }
        
        #coment {
        	width: 100%;
        	
        }
        
        #replyList li {
        	list-style: none;
        	border-bottom: 1px solid #ddd;
        }
        
       
    </style>
<script>
	function boardDel(){
		if(confirm("글을 정말 삭제하시겠습니까?")){
			location.href = "/see/board/delete?no=${bVO.post_no}";
		}
	}
	
	// ajax
	$(function(){
		
		function replyList(){
			$.ajax({
				url : "${pageContext.servletContext.contextPath}/boardReply/list"
				data : {post_no:${bVO.post_no}},
				type : "GET",
				success : function(result){
					console.log(result);
				},
				error : function(e){
					console.log(e.responseText);
				}
				
			});
		}
		
		
		$("#replyForm").submit(function(){
			
			event.preventDefault(); // form action 중지
			
			if($("#coment").val()==""){
				alert("내용을 입력하세요");
				return false;
			}
			
			var params = $(this).serialize();
			
			$ajax({
				url : "see/boardReply/write",
				data : params,
				type : "POST",
				success : function(result){
					$("#coment").val("");
				},
				error : function(e){
					console.log(e.responseText);
				}
			});
		});
		
		replyList();
		
	});
	
	function 
</script>
</head>

<body>
    <div class="notification-bar" id="notificationBar"></div>
    <div id="boardContainer">
        <div class="mainContainer">
            <div id="viewWrap">
                <div class="viewLocal">
                    <h2>긴급상황 게시판</h2>
                </div>
                <div class="viewTitle">
                    <h4>[${bVO.location }] [${bVO.disasterType}] ${bVO.subject }</h4>
                </div>
                <div class="viewInfo">
                    <div class="left_space">
                        <span>작성자 : ${bVO.userid }</span>
                        
                        <c:if test="${bVO.userid == logId }">
	                        <span>
	                            <a href="/see/board/edit?no=${bVO.post_no }"><button style="margin-left: 10px;">수정</button></a>
	                            <a href="javascript:boardDel()"><button>삭제</button></a>
	                        </span>
                        </c:if>
                    </div>
                    <div class="right_space">
                        <span>${bVO.writedate }</span>
                        <span>${bVO.hit }</span>
                        <span>댓글 6</span>
                        <span>${bVO.popular }</span>
                    </div>
                </div>
                
                <div class="viewContents">
                   <span>${bVO.contents }</span>
                    <div class="viewBtns">
                    	<a href="${pageContext.servletContext.contextPath }/board/list?nowPage=${pVO.nowPage}<c:if test="${pVO.searchText != null }&searchKey=${pVO.searchKey }&searchText=${pVO.searchText }"></c:if>">목록보기</a>
                        <a href="javascript:alert('추천되었습니다.')" style="margin: 2px;"><img src="../../img/recommend.png" alt="추천" width="26px"></a>
                        <a href="javascript:var url = window.document.location.href;alert(url); "><img src="../../img/share.png" alt="공유" width="26px"></a>
                        <a href="javascript:confirm('정말 신고하시겠습니까?.')"><img src="../../img/siren2.png" alt="신고" width="27px"></a>
                    </div>
                </div>
            </div>
			<div id="replyArea">
				<c:if test="${logStatus == 'Y' }">
					<form method="POST" id="replyForm">
					<input type="hidden" name="post_no" value="${bVO.post_no }">
						<textarea name="coment" id="coment"></textarea>
						<buttion>등록</buttion>
					</form>
				</c:if>
			</div>
			
			<!-- 댓글 table -> ul로 수정 -->
			<div>댓글 목록</div>
			<ul id="replyList">
				<li>
					<div>
						<b>goguma</b>23-10-10 12:12:12
						<input type="button" value="수정">
						<input type="button" value="삭제">
						<p>댓글내용</p>
					</div>
				</li>
			</ul>
            

            <div class="boardListWrap">
                <h5>재난정보게시판 이전 글 다음글</h5>

                <table class="boardListSmall">
                    <colgroup>
                        <col style="width:50%">
                        <col style="width:10%">
                        <col style="width:10%">
                        <col style="width:5%">
                        <col style="width:5%">
                    </colgroup>

                    <tbody>
                        <tr>
                            <td><a href="boardView.html"><span>[충청] </span>여긴 시원한데
                                    <span class="rplCount">[3]</span></a></td>
                            <td>폭염</td>
                            <td>23-09-11</td>
                            <td>1</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td><a href="boardView.html"><span>[제주] </span>비 오는 거 보여드림
                                <span class="rplCount">[0]</span></a></td>
                            <td>기타</td>
                            <td>23-09-11</td>
                            <td>17</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td><a href="boardView.html"><span>[서울] </span>에어컨, 나의 사랑. 에어컨, 나의 빛. 에어컨, 나의 어둠. 에어컨, 나의 삶.
                                <span class="rplCount">[0]</span></a></td>
                            <td>기타</td>
                            <td>23-09-11</td>
                            <td>24</td>
                            <td>3</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
<footer>
<div class="footer-content">
© 2023 모든 권리 보유. 멀티캠퍼스 세미프로젝트 8조에 있습니다.
    <br/>
    아이콘 저작권
 <a href="https://www.flaticon.com/kr/free-icons/-" title="비상 사태 아이콘">비상 사태 아이콘  제작자: Freepik - Flaticon</a>
</div>
<button id="backToTop" onclick="scrollToTop()">Top</button>
</footer>
<!--
    
-->
</html>
