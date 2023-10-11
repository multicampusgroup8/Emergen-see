package org.example;

public class DisasterVO {

    String MSG_CN; //메시지 내용
    String DSSTR_SE_NM; // 종류 화재, 지진..
    String CREAT_DT; //날짜
    String RCV_AREA_NM; //지역
    int MD101_SN; //번호
    String EMRGNCY_STEP_NM; // 안전, 재난 ..단계
    DisasterVO(DisasterMessage m){
        this.MSG_CN = m.MSG_CN;
        this.DSSTR_SE_NM = m.DSSTR_SE_NM;
        this.CREAT_DT = m.CREAT_DT;
        this.RCV_AREA_NM = m.RCV_AREA_NM;
        this.MD101_SN = m.MD101_SN;
        this.EMRGNCY_STEP_NM = m.EMRGNCY_STEP_NM;

    }
}
