package org.example;

import java.sql.*;

public class DBConnection {
    protected Connection con = null;
    protected PreparedStatement pstmt = null;
    protected ResultSet rs = null;

    String url = "jdbc:mysql://127.0.0.1/mydb";
    String username = "root";
    String password = "tiger1234";

    /* static initialization block 은 처음에 무조건 실행*/
    static{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("드라이버 로딩 실패");
        }
    }

    //연결
    protected void dbConnection(){
        try {
            con = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            System.out.println("연결 실패"+e.getMessage());
        }
    }

    protected void dbClose(){
        try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(con != null) con.close();
        } catch (SQLException e) {
            System.out.println("널에러"+ e.getMessage());
            throw new RuntimeException(e);
        }
    }

    //닫기
}
