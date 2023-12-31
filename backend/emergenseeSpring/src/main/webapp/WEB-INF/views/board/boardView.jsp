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
        
        #contents {
        	width: 100%;
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
		
		// 목록
		function replyList(){
			$.ajax({
				url : "${pageContext.servletContext.contextPath}/boardReply/list",
				data : {post_no:${bVO.post_no}},
				type : "GET",
				success : function(list){
					console.log(list);
					
					var tag ="";
					
					$(result).each(function(i, rVO){
						tag += "<li><div><b>" + rVO.userid + "</b>(" + rVO.writedate +")";
						

						if( '${logId}' == rVO.userid ){
							tag += "<input type='button' value='Edit'/>";
							tag += "<input type='button' value='Del' title='" +rVO.replyno+ "'/>";
							
							// 댓글내용
							tag += "<p>" + rVO.contents + "</p></div>";
							
							// 수정폼 
							tag += "<div style='display: none'><form method='post'>";
							tag += "<input type='hidden' name='replyno' value='" + rVO.replyno + "' />"
							tag += "<textarea name='contents' style='width: 400px; height: 80px;'>" + rVO.contents + "</textarea>";
							tag += "<input type='submit' value='댓글 수정하기' />";
							tag +="</form></div>";
						}else{
							tag += "<p>" + rVO.contents + "</p></div>";
						}
						tag += "</li>";
					});
					$("#replyList").html(tag);
				},
				error: function(e){
					console.log(e.responseText);
				}
			});
		}
		// 등록
		$("#replyForm").submit(function(){

			event.preventDefault();		
			
	
			if($("#contents").val()==""){
				alert("내용을 입력하세요");
				return false;
			}
			
		
			var params = $(this).serialize();
			
	
			$.ajax({
				url : "${pageContext.servletContext.contextPath}/boardReply/write",
				data : params,
				type : "POST",
				success : function(result){
					console.log(result);
					$("#contents").val("");
				},
				error : function(e){
					console.log(e.responseText);
				}
				
			});
			
		});
		// 수정폼 보여주기
		$(document).on('click','#replyList input[value=Edit]',function(){
			$(this).parent().css('display','none'); 
			$(this).parent().next().css('display','block'); 
		});
		// 수정(DB)
		$(document).on('submit','#replyList form', function(){
			event.preventDefault(); 	
			var params = $(this).serialize(); 	
			var url = "${pageContext.servletContext.contextPath}/boardReply/editOk";
			
			$.ajax({
				url : url,
				data : params,
				type : "POST",
				success : function(result){
					console.log('댓글수정',result);
					if(result=='0'){ 	
						alert('댓글수정 실패')
					}else{
						replyList(); 	
					}
				},
				error : function(e){
					console.log(e.responseText);
				}
			});
		});
		
		
		
		// 댓글삭제
		$(document).on('click','#replyList input[value=Del]',function(){
			if(confirm("삭제하시겠습니까?")){
				// 삭제할 레코드번호
				var replyno = $(this).attr("title");
				
				$.ajax({
					url : "${pageContext.servletContext.contextPath}/boardReply/delete",
					data : {
						replyno : replyno
					},
					type : "GET",
					success : function(result){
						replyList(); 	
					},
					error : function(e){
						console.log(e.responseText);
					}
				});
			}else{
				
			}
		});
		
		// 목록출력 함수 호출
		replyList();
	});
</script>
<script src="https://kit.fontawesome.com/2026ef433b.js" crossorigin="anonymous"></script>
</head>

<body>
    <div class="notification-bar" id="notificationBar"></div>
    <div id="boardContainer">
        <div class="mainContainer">
            <div id="viewWrap">
                <div class="viewLocal">
                    <h2>긴급상황 게시판</h2>
                </div>
                <!-- 제목 Line (지역, 재난종류, 제목) -->
                <div class="viewTitle">
                    <h4>[${bVO.location }] [${bVO.disasterType}] ${bVO.subject }</h4>
                </div>
                
                <!-- 제목 하단부 (작성자, 작성시간, 조회수, 추천수) -->
                <div class="viewInfo">
                    <div class="left_space">
                        <span>작성자 : ${bVO.userid }</span>
                        
                        <c:if test="${bVO.userid == logId }">
	                        <span>
	                            <a href="${pageContext.servletContext.contextPath }/board/edit?post_no=${bVO.post_no }"><button style="margin-left: 10px;">수정</button></a>
	                            <a href="${pageContext.servletContext.contextPath }/board/delete?post_no=${bVO.post_no }"><button>삭제</button></a>
	                        </span>
                        </c:if>
                    </div>
                    <div class="right_space">
                        <span>${bVO.writedate }</span>
                        <span>조회수 : ${bVO.hit }</span>
                        <span>추천수 : ${bVO.popular }</span>
                    </div>
                </div>
                
                <div class="viewContents">
                   <span>${bVO.contents }</span>
                    <div class="viewBtns">
                    	<a href="${pageContext.servletContext.contextPath }/board/list?nowPage=${pVO.nowPage}<c:if test="${pVO.searchText != null }&searchKey=${pVO.searchKey }&searchText=${pVO.searchText }"></c:if><c:if test="${pVO.disasterType != null }">&disasterType=${pVO.disasterType }</c:if>"><i class="fa-solid fa-bars"></i></a>
                        <a href="javascript:alert('추천되었습니다.')" style="margin: 2px;"><i class="fa-regular fa-thumbs-up"></i></a>
                        <a href="javascript:confirm('정말 신고하시겠습니까?.')"><i class="fa-solid fa-triangle-exclamation"></i></a>
                    </div>
                </div>
            </div>
            
            <!-- 댓글달기 -->
			<div id="replyArea">
				<c:if test="${logStatus == 'Y' }">
					<form method="POST" id="replyForm">
						<input type="hidden" name="post_no" value="${bVO.post_no }">
							<textarea name="contents" id="contents"></textarea>
							<button>등록</button>
					</form>
				</c:if>
			</div>
			
			<!-- 댓글목록 -->
	
		
			
            

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
                    	<!-- 이전글 -->
                        <tr>
                            <td><a href="boardView.html"><span>[충청] </span>여긴 시원한데
                                    <span class="rplCount">[3]</span></a></td>
                            <td>폭염</td>
                            <td>23-09-11</td>
                            <td>1</td>
                            <td>0</td>
                        </tr>
                        <!-- 다음글 -->
                        <tr>
                            <td><a href="${pageContext.servletContext.contextPath }/board/nextPost"><span>[${bVO.location }] </span>${bVO.subject }
                                <span class="rplCount">[0]</span></a></td>
                            <td>${bVO.disasterType }</td>
                            <td>${bVO.writedate }</td>
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

