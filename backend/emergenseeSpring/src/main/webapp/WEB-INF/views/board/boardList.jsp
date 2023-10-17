<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="../js/topButtonScript.js" defer></script>
    <script src="../js/notification.js" defer></script>
    <script src="../js/checkLogin.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>게시판 리스트</title>
    <style>
    
    	li {
    		list-style: none;
    		float: left;
    		margin: 0 auto;
    	}
        .mainContainer {
            padding: 30px;
            margin-bottom: 70px;
        }

        #boardContainer {
            width: 1000px;
            margin: 0 auto;
            background: var(--mainLight);
        }

        #listTitle {
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-top: 3px solid var(--mainDark);
            border-bottom: 3px solid var(--mainDark);
        }

        th{
            border-bottom: 1px solid var(--mainDark);

            text-align: center;
            padding: 0;
            margin: 0;
        }
        /*rgb(125, 169, 241)*/
        td {
            border-bottom: 1px solid var(--pointBlue);
            text-align: center;
            padding: 12px 0 6px 0;
        }
        tr:hover{
            background: var(--pointYellow);
        }

        .listBtns {
            text-align: end;
            margin-top: 10px;
        }

        .paging {
            text-align: center;
        }

        .paging a {
            margin: 5px;
            color: var(--mainDark);
        }
        .paging a:hover{
            color: var(--pointYellow);
        }

        .searchBar {
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .searchBar select{
            margin-right: 7px;
        }
        .searchBar input{
            margin-right: 7px;

        }
    </style>
    <link rel="stylesheet" href="../css/style.css">
<script>
	function searchCheck(){
		if(document.getElementById("searchText").value==""){
			alert("검색어를 입력하세요");
			return false;
		}
	}
</script>
</head>

<body>
  
    <div class="notification-bar" id="notificationBar"></div>
    <div id="boardContainer">
        <div class="mainContainer">
            <h2>게시판 제목</h2>
             <span>지역선택</span>
            <select name="localKey" style="width: 100px; height: 21px; margin:0 5px;">
                <option value="">지역선택</option>
                <option value="Seoul">서울</option>
                <option value="Gyunggi">경기</option>
                <option value="Incheon">인천</option>
                <option value="Gangwon">강원</option>
                <option value="jeonra">전라</option>
            </select>

            | 재난 별 모아보기 
           <a href="${pageContext.servletContext.contextPath }/board/list?disasterType=earthquake">지진</a>
           <a href="${pageContext.servletContext.contextPath }/board/list?disasterType=rain">호우</a>
           <a href="${pageContext.servletContext.contextPath }/board/list?disasterType=heat">폭염</a>
           <a href="${pageContext.servletContext.contextPath }/board/list?disasterType=typhoon">태풍</a>
           <a href="${pageContext.servletContext.contextPath }/board/list?disasterType=wind">강풍</a>
           <a href="${pageContext.servletContext.contextPath }/board/list?disasterType=disease">전염병</a>
           <a href="${pageContext.servletContext.contextPath }/board/list">전체보기${pVO.totalRecord }</a>
			
            <br>
            <table class="boardList">
                <colgroup>
                    <col style="width:5%">
                    <col>
                    <col style="width:10%">
                    <col style="width:9%">
                    <col style="width:20%">
                    <col style="width:7%">
                    <col style="width:7%">
                </colgroup>
                <thead>
                    <tr height="40px">
                        <th scope="col">번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">지역</th>
                        <th scope="col">작성일</th>
                        <th scope="col">조회수</th>
                        <th scope="col">추천</th>
                    </tr>
                </thead>
                <br>
                <tbody>
                    <c:forEach var="bVO" items="${list }">
                    	<tr>
                    		<td>${bVO.post_no }</td>
                    		<td><a href='${pageContext.servletContext.contextPath }/board/view?post_no=${bVO.post_no}&nowPage=${pVO.nowPage}<c:if test='${pVO.searchText!=null}'>&searchKey=${pVO.searchKey }&searchText=${pVO.searchText }</c:if><c:if test="${pVO.disasterType != null}">&disasterType=${pVO.disasterType }</c:if>'>${bVO.subject }</a></td>
                    		<td>${bVO.userid }</td>
                    		<td>${bVO.location }</td>
                    		<td>${bVO.writedate }</td>
                    		<td>${bVO.hit }</td>
                    		<td>${bVO.popular }</td>
                   		</tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <form class="listBtns" action="${pageContext.servletContext.contextPath}/board/write" method="Get">
            	<!--   </* c:if test="${logStatus!='' && logStatus=='Y' }" */> --> 
                	<button>글쓰기</button>
                <!-- </* /c:if */> -->
            </form>
            <div class="paging">
            	<ul>
        		<c:if test="${pVO.nowPage==1 }">
          				<li>◀</li>
       			</c:if>
       			<c:if test="${pVO.nowPage>1 }">
       				<li><a href='${pageContext.servletContext.contextPath }/board/list?nowPage=${pVO.nowPage-1 }<c:if test="${pVO.searchText!=null}">&searchKey=${pVO.searchKey}&searchText=${pVO.searchText }</c:if><c:if test="${pVO.disasterType != null}">&disasterType=${pVO.disasterType }</c:if>'>◀</a></li>
   				</c:if>
   					
   					<c:forEach var="p" begin="${pVO.startPage }" end="${pVO.startPage + pVO.onePageCount -1 }">
						<c:if test="${p<=pVO.totalPage }">
   							<c:if test="${p==pVO.nowPage }"> <!-- 현재페이지 스타일 -->
   								<li style="color:red">
   							</c:if>
   							<c:if test="${p!=pVO.nowPage }"> <!-- 나머지 페이지 -->
   								<li>
   							</c:if>
   							<a href='/see/board/list?nowPage=${p}<c:if test="${pVO.searchText!=null}">&searchKey=${pVO.searchKey}&searchText=${pVO.searchText }</c:if><c:if test="${pVO.disasterType != null}">&disasterType=${pVO.disasterType }</c:if>'>${p }</a></li>
   						</c:if>
   					</c:forEach>
   					
						<c:if test="${pVO.nowPage < pVO.totalPage }">
       						<li><a href='/see/board/list?nowPage=${pVO.nowPage+1}<c:if test="${pVO.searchText!=null}">&searchKey=${pVO.searchKey}&searchText=${pVO.searchText }</c:if><c:if test="${pVO.disasterType != null}">&disasterType=${pVO.disasterType }</c:if>'>▶</a></li>
  						</c:if>
  						<c:if test="${pVO.nowPage >= pVO.totalPage }">
  							<li>▶</li>
  						</c:if>
            	</ul>      
            </div>
            <br>
            <div class="searchBar">
            	<form method="GET" action="${pageContext.servletContext.contextPath }/board/list" onsubmit="return searchCheck()">
	                <select name="searchKey">
	                    <option value="subject">제목</option>
	                    <option value="contents">내용</option>
	                    <option value="userid">작성자</option>
	                </select>
	                <input type="text" name="searchText" id="searchText">
	                <button class="dark">검색</button>
                </form>
            </div>
        </div>
    </div>
    <!-- Footer Section -->
    <footer>
        <div class="footer-content">
            © 2023 모든 권리 보유. 멀티캠퍼스 세미프로젝트 8조에 있습니다.
        </div>
        <button id="backToTop" onclick="scrollToTop()">Top</button>
    </footer>
</body>

</html>
