package org.example;

import java.util.ArrayList;
import java.util.List;

public class OuterObject {
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

class DisasterMessage {
    String MSG_CN; 

    public String getMessageContent() {
        return MSG_CN;
    }

    public void setMessageContent(String MSG_CN) {
        this.MSG_CN = MSG_CN;
    }
}
