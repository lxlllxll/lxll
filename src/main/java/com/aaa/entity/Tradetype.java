package com.aaa.entity;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class Tradetype implements Serializable {

    private static final long serialVersionUID = 1L;

    private int tradeId;
    private String tradeName;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getTradeId() {
        return tradeId;
    }

    public void setTradeId(int tradeId) {
        this.tradeId = tradeId;
    }

    public String getTradeName() {
        return tradeName;
    }

    public void setTradeName(String tradeName) {
        this.tradeName = tradeName;
    }
}
