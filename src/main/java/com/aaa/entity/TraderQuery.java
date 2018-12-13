package com.aaa.entity;

import lombok.Data;

import java.util.Date;

@Data
public class TraderQuery {
    private String tradeId;
    private Date bbegintime;
    private Date bendtime;
}
