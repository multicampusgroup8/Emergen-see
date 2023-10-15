package org.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class DisasterSQL extends DBConnection{
    public int selectDB(){
        dbConnection();
        int num = -1;
        try{
            String sql = "select max(no) from disaster";
            pstmt  = con.prepareStatement(sql);
            rs =  pstmt.executeQuery();
            while(rs.next()){
                num = rs.getInt(1);
                System.out.println(num);
            }

        }catch(Exception e){
            System.out.println("DB연결 실패");
            throw new RuntimeException(e);
        }finally{
            dbClose();
        }

        return num;

    }
    public boolean insertDB(DisasterVO vo) {
        dbConnection();
        boolean success = false;

        System.out.println("success");
        try {
            //3. 쿼리문 -> preparedstatement 생성
            String sql = "insert into disaster(disaster_no, fullcontents, issueddate, disaster_level, disaster_type, disaster_region) values(?, ?, ?, ?, ?, ?)";
            pstmt  = con.prepareStatement(sql);
            //? 가 있는 쿼리문은 값을 세팅해야 한다.

            pstmt.setInt(1, vo.MD101_SN);
            pstmt.setString(2, vo.MSG_CN);
            pstmt.setString(3, vo.CREAT_DT);
            pstmt.setString(4, vo.EMRGNCY_STEP_NM);
            pstmt.setString(5, vo.DSSTR_SE_NM);
            pstmt.setString(6, vo.RCV_AREA_NM);

            // 4. 실행
            // pstmt.excuteupdate 리턴값 : 추가된 레코드 수 반환
            int result = pstmt.executeUpdate();
            if(result > 0){
                success= true;

                System.out.println("등록 성공");
            }else{
                System.out.println("등록 실패");
            }

        } catch (SQLException e) {
            System.out.println("DB연결 실패");
            throw new RuntimeException(e);
        }finally{
            //DB 닫기
            dbClose();
        }
        return success;


    }
}
