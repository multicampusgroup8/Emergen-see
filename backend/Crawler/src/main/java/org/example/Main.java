package org.example;
import com.google.gson.Gson;
import org.json.simple.JSONObject;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;

public class Main {
    public static void main(String[] args) {

        try {
            URL url = new URL("https://www.safekorea.go.kr/idsiSFK/sfk/cs/sua/web/DisasterSmsList.do");

            var conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST"); // 전송 방식은 POST
            String referer = "https://www.safekorea.go.kr/idsiSFK/neo/sfk/cs/sfc/dis/disasterMsgList.jsp?menuSeq=679";
            String useragent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Safari/605.1.15";
            conn.setRequestProperty("User-Agent", useragent);
            conn.setRequestProperty("Referer", referer);
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            LocalDate today = LocalDate.now();
            var lastweek = today.minusDays(7);
            JSONObject body = new JSONObject();
            JSONObject inner = new JSONObject();
            inner.put("pageIndex", "1");
            inner.put("pageUnit", "10");
            inner.put("pageSize", "10");
            inner.put("firstIndex", "1");
            inner.put("lastIndex", "1");
            inner.put("recordCountPerPage", "10");
            inner.put("searchBgnDe", lastweek.toString());
            inner.put("searchEndDe", today.toString());
            inner.put("searchGb", "1");
            inner.put("searchWrd", "");
            inner.put("rcv_Area_Id", "");
            inner.put("dstr_se_Id", "");
            inner.put("c_ocrc_type", "");
            inner.put("sbLawArea1", "");
            inner.put("sbLawArea2", "");
            inner.put("sbLawArea3", "");


            body.put("searchInfo", inner);


            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            bw.write(body.toString());
            bw.flush();
            bw.close();


            int responseCode = conn.getResponseCode();
            if (responseCode == 400 || responseCode == 401 || responseCode == 500) {
                System.out.println(responseCode + " Error!");
            } else {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder sb = new StringBuilder();
                String line = "";
                while ((line = br.readLine()) != null) {
                    sb.append(line);
                }

                //System.out.println(sb.toString());

                Gson gson = new Gson();

                OuterObject outerObject = gson.fromJson(sb.toString(), OuterObject.class);

                System.out.println(outerObject.disasterSmsList.size());

                for ( var element: outerObject.disasterSmsList) {

                    System.out.println(element.MSG_CN);

                }

                //여기까지 데이터 가져오기

                //데이터 처리해서 저장





            }


        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }

}