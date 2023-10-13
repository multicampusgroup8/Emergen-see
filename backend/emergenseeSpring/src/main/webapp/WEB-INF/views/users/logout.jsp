<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body>
    <main>
        <div class="container">
            <div class="logout-container">
                <h2>Logout</h2>
                <form action="/emergensee/logout" method="post">
                    <label>정말 로그아웃 하시겠습니까?</label>
                    <input type="submit" name="yon" value="예(Yes)">
                    <input type="submit" name="yon" value="아니요(No)">
                </form>
            </div>
        </div>
    </main>
</body>
