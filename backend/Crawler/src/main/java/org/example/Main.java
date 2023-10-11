package org.example;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Main {

    static int recentNum;
    public static void main(String[] args) {
        DisasterSQL dSQL = new DisasterSQL();

        //시작시 db에서 가장 최신 메시지 번호 가져오기
        recentNum =  dSQL.selectDB();

        while(true) {
            System.out.println("Parsing..");
            try {
                String jsonResponse = fetchDisasterData();
                //System.out.println(jsonResponse);
                OuterObject outerObject = parseJsonResponse(jsonResponse);
                //displayMessages(outerObject.disasterSmsList);
                // 메시지를 데이터베이스에 저장
                for (var disasterSms : outerObject.disasterSmsList) {
                    if (disasterSms.MD101_SN > recentNum) {//todo: 메시지 없는 메시지 일 경우
                        var result = dSQL.insertDB(new DisasterVO(disasterSms));
                        if (result) {
                            recentNum = disasterSms.MD101_SN;
                            System.out.println("Added "+ recentNum +" to database");
                        }
                    }
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            try {
                Thread.sleep(6000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private static String fetchDisasterData() throws IOException {
        URL url = new URL("https://www.safekorea.go.kr/idsiSFK/sfk/cs/sua/web/DisasterSmsList.do");

        var conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        String referer = "https://www.safekorea.go.kr/idsiSFK/neo/sfk/cs/sfc/dis/disasterMsgList.jsp?menuSeq=679";
        String useragent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Safari/605.1.15";
        conn.setRequestProperty("User-Agent", useragent);
        conn.setRequestProperty("Referer", referer);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        LocalDate today = LocalDate.now();
        var lastweek = today.minusDays(7);
        JsonObject body = new JsonObject();
        JsonObject inner = new JsonObject();
        inner.addProperty("pageIndex", "1");
        inner.addProperty("pageUnit", "10");
        inner.addProperty("pageSize", "10");
        inner.addProperty("firstIndex", "1");
        inner.addProperty("lastIndex", "1");
        inner.addProperty("recordCountPerPage", "10");
        inner.addProperty("searchBgnDe", lastweek.toString());
        inner.addProperty("searchEndDe", today.toString());
        inner.addProperty("searchGb", "1");
        inner.addProperty("searchWrd", "");
        inner.addProperty("rcv_Area_Id", "");
        inner.addProperty("dstr_se_Id", "");
        inner.addProperty("c_ocrc_type", "");
        inner.addProperty("sbLawArea1", "");
        inner.addProperty("sbLawArea2", "");
        inner.addProperty("sbLawArea3", "");

        body.add("searchInfo", inner);

        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        bw.write(body.toString());
        bw.flush();
        bw.close();

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }
        br.close();

        return sb.toString();
    }

    private static OuterObject parseJsonResponse(String jsonResponse) {
        Gson gson = new Gson();
        return gson.fromJson(jsonResponse, OuterObject.class);
    }

    private static void displayMessages(List<DisasterMessage> disasterMessages) {
        System.out.println(disasterMessages.size());
        for (var element : disasterMessages) {
            System.out.println(element.MSG_CN);
            System.out.println(element.EMRGNCY_STEP_NM);
            System.out.println(element.MD101_SN);//번호 - primary key
            System.out.println(element.CREAT_DT);
            System.out.println(element.DSSTR_SE_NM);
            System.out.println(element.RCV_AREA_NM);
        }
    }

    private static void saveToDatabase(List<DisasterMessage> disasterMessages) {
        // 데이터베이스 연결
        // 사용자 이름 및 비밀번호를 설정
        String dbUrl = "jdbc:mysql://localhost:3306/mydatabase";
        String username = "root";
        String password = "tiger1234";

        try (Connection connection = DriverManager.getConnection(dbUrl, username, password)) {
            for (DisasterMessage message : disasterMessages) {
                String query = "INSERT INTO disaster(no, message, date, step, type, region) VALUES(?, ?, ?, ?, ?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {

                    preparedStatement.setInt(1, message.MD101_SN);
                    preparedStatement.setString(2, message.MSG_CN);
                    preparedStatement.setString(3, message.CREAT_DT);
                    preparedStatement.setString(4, message.EMRGNCY_STEP_NM);
                    preparedStatement.setString(5, message.DSSTR_SE_NM);//종류
                    preparedStatement.setString(6, message.RCV_AREA_NM);
                    preparedStatement.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 예외 처리 추가
        }
    }

}

