<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <head>
	<title>휴면 회원 관리</title>
	<script src="/emergensee/js/getUserInfo.js" defer></script>
	<script src="/emergensee/js/admUserDormant.js" defer></script>
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
							<li><a href="/emergensee/admin/leave">회원탈퇴 관리</a></li>
							<li><a href="/emergensee/admin/dormant" class="emphasize">휴면회원 관리</a></li>
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
				<div class="form-container">
					<h1>휴면 회원 관리</h1>
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
					<h1>휴면 예정 회원 목록</h1>
					<div class="result_text">
						<span id="membersCnt">[총 회원수 n 명] 검색결과 n 명</span>
						<input class="ban_btn dark" type="submit" value="휴면 전환" name="휴면 전환">
						<table id="table">
							<thead>
								<tr>
									<th>선택</th>
									<th>아이디</th>
									<th>이름</th>
									<th>전화번호</th>
									<th>휴면 예정 날짜</th>
									<th>마지막 접속 날짜</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" id="banCheck1"></td>
									<td>aaabbb</td>
									<td>홍길동</td>
									<td>010-2222-2222</td>
									<td>24-09-15</td>
									<td>23-08-15</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="banCheck1"></td>
									<td>cccvvv</td>
									<td>이순신</td>
									<td>010-3333-3333</td>
									<td>24-05-14</td>
									<td>23-05-14</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="banCheck1"></td>
									<td>eeefff</td>
									<td>장보고</td>
									<td>010-4444-4444</td>
									<td>24-06-12</td>
									<td>23-06-12</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="banCheck1"></td>
									<td>ggghhh</td>
									<td>이세종</td>
									<td>010-5555-5555</td>
									<td>24-09-10</td>
									<td>23-09-10</td>
								</tr>
								<tr>
									<td><input type="checkbox" id="banCheck1"></td>
									<td>iiiwww</td>
									<td>멍멍멍</td>
									<td>010-6666-6666</td>
									<td>24-12-25</td>
									<td>23-12-25</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</main>
		</div>
	</div>