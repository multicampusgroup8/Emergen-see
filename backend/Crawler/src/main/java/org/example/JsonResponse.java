package org.example;

import java.util.ArrayList;
import java.util.List;

public class JsonResponse {
    List<DisasterMessage> disasterSmsList = new ArrayList<>();
    private Object rtnResult;

    // If you need access from outside:
    public List<DisasterMessage> getDisasterSmsList() {
        return disasterSmsList;
    }

    public void setDisasterSmsList(List<DisasterMessage> disasterSmsList) {
        this.disasterSmsList = disasterSmsList;
    }
}

class DisasterMessage implements Comparable<DisasterMessage> {
    String MSG_CN;
    String DSSTR_SE_NM;
    String CREAT_DT;
    String RCV_AREA_NM;
    int MD101_SN;
    String DSSTR_SE_ID;
    String RCV_AREA_ID;
    String EMRGNCY_STEP_ID;
    String EMRGNCY_STEP_NM;



    public String getMessageContent() {
        return MSG_CN;
    }

    public void setMessageContent(String MSG_CN) {
        this.MSG_CN = MSG_CN;
    }

    @Override
    public int compareTo(DisasterMessage o) {
        if(MD101_SN > o.MD101_SN){
            return 1;
        }else if( MD101_SN < o.MD101_SN){
            return -1;
        }
        return 0;
    }
}
