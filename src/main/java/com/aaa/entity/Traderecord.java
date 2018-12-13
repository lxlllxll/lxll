package com.aaa.entity;

import com.baomidou.mybatisplus.annotations.TableLogic;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author lxl
 * @since 2018-12-01
 * abcdefghigklmnopqrstuvwxyz
 */
@Data
public class Traderecord implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableLogic
    private Integer idDel = 0;

	private String recordno;
	private Date recordtime;
	private BigDecimal recordmoney;
	private String recordremark;
	/*private Tradetype tradeIds;*/
	private Integer tradeId;

	public String getRecordno() {
		return recordno;
	}

	public void setRecordno(String recordno) {
		this.recordno = recordno;
	}

	public Date getRecordtime() {
		return recordtime;
	}

	public void setRecordtime(Date recordtime) {
		this.recordtime = recordtime;
	}

	public BigDecimal getRecordmoney() {
		return recordmoney;
	}

	public void setRecordmoney(BigDecimal recordmoney) {
		this.recordmoney = recordmoney;
	}

	public String getRecordremark() {
		return recordremark;
	}

	public void setRecordremark(String recordremark) {
		this.recordremark = recordremark;
	}

	/*public Tradetype getTradeIds() {
		return tradeIds;
	}

	public void setTradeId(Tradetype tradeIds) {
		this.tradeIds = tradeIds;
	}*/

	public Integer getTradeId() {
		return tradeId;
	}

	public void setTradeId(Integer tradeId) {
		this.tradeId = tradeId;
	}

}
