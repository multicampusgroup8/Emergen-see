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

    public static void main(String[] args) {
        try {
            String jsonResponse = fetchDisasterData();
            OuterObject outerObject = parseJsonResponse(jsonResponse);
            displayMessages(outerObject.disasterSmsList);
            // 메시지를 데이터베이스에 저장
            saveToDatabase(outerObject.disasterSmsList);
        } catch (Exception e) {
            throw new RuntimeException(e);
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
        }
    }
    private static void saveToDatabase(List<DisasterMessage> disasterMessages) {
        // 데이터베이스 연결
        // 사용자 이름 및 비밀번호를 설정
        String dbUrl = "jdbc:mysql://localhost:3306/mydatabase";
        String username = "username";
        String password = "password";

        try (Connection connection = DriverManager.getConnection(dbUrl, username, password)) {
            for (DisasterMessage message : disasterMessages) {
                String query = "INSERT INTO disaster_messages (message_content) VALUES (?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setString(1, message.MSG_CN);
                    preparedStatement.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 예외 처리 추가
        }
    }

}

