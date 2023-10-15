<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<title>탈퇴 회원 관리</title>
	<script src="/emergensee/js/getUserInfo.js" defer></script>
	<script src="/emergensee/js/admUserLeave.js" defer></script>
	<style>
		.form-container h1 {
			text-align: center;
			margin-bottom: 20px;
		}

		.form-container label,
		.form-container select,
		.form-container input,
		.form-container button {
			display: inline-block;
			margin-right: 10px;
			vertical-align: middle;
			justify-content: center;
			margin-bottom: 10px;
		}
	</style>
</head>

	<div class="container">
		<div class="main-container">
			<!-- 사이드 메뉴 -->
			<nav class="side-nav">
				<span class="PageTitle">관리자 페이지</span>
				<ul>
					<li>
						<a href="#" class="emphasize">회원 관리</a>
						<ul>
							<li><a href="/emergensee/admin/user">회원정보 조회</a></li>
							<li><a href="/emergensee/admin/leave" class="emphasize">회원탈퇴 관리</a></li>
							<li><a href="/emergensee/admin/dormant">휴면회원 관리</a></li>
						</ul>
					</li>
					<li>
						<a href="#">게시판 관리</a>
						<ul>
							<li><a href="/emergensee/admin/board">게시물 관리</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<main>
				<!-- search box -->
				<div class="form-container">
					<h1>회원탈퇴관리</h1>
					<div>
						<label>회원정보</label>
						<select id="selectSearchType">
							<option value="viewAll">전체보기</option>
							<option value="name">이름</option>
							<option value="id">아이디</option>
							<option value="cellNum">전화번호</option>
						</select>
						<input type="text" id="inputUser" value="" name="user_info">
						<button id="searchButton">검색</button>
					</div>
					<div>
						<label>탈퇴유형</label>
						<select id="selectLeaveType">
							<option value="viewAll">전체보기</option>
							<option value="ban">강제탈퇴</option>
							<option value="leave">일반탈퇴</option>
							<option value="etc">기타</option>
						</select>
					</div>
					<div>
						<label>기간설정</label>
						<button value="today">오늘</button>
						<button value="sevenDays">일주일</button>
						<button value="oneMonth">한달</button>
					</div>
					<div>
						<label for="startDate">start</label>
						<input type="date" id="startDate" />
						<label for="endDate">end</label>
						<input type="date" id="endDate" />
						<button id="searchBtn" type="submit" value="검색" name="검색">검색</button>
					</div>
					<input id="dateType" type="hidden">
				</div>
				<br>
				<br>
				<div class="form-container">
					<h1>탈퇴회원</h1>
					<div class="result_text">
							<span id="membersCnt" style="margin-right: 20px;">[총 회원수 n 명] 검색결과 n 명 </span>
							<input class="ban_btn dark" type="submit" value="탈퇴/삭제" name="탈퇴/삭제">

						<table id="table">
							<thead>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>탈퇴사유</th>
									<th>탈퇴날짜</th>
									<th>가입날짜</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>aaabbb</td>
									<td>홍길동</td>
									<td>강제탈퇴</td>
									<td>23-09-15</td>
									<td>22-08-15</td>
								</tr>
								<tr>
									<td>dddyyy</td>
									<td>이녀석</td>
									<td>서비스 불만족</td>
									<td>23-08-20</td>
									<td>22-05-14</td>
								</tr>
								<tr>
									<td>zzzxxx</td>
									<td>유재석</td>
									<td>사용빈도 낮음</td>
									<td>23-07-10</td>
									<td>22-04-25</td>
								</tr>
								<tr>
									<td>kkklll</td>
									<td>김종민</td>
									<td>다른 서비스 이용</td>
									<td>23-06-30</td>
									<td>21-10-20</td>
								</tr>
								<tr>
									<td>mmmvvv</td>
									<td>박명수</td>
									<td>계정 문제</td>
									<td>23-05-05</td>
									<td>20-11-15</td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</main>
		</div>
	</div>