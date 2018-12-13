package com.aaa.service;

import com.aaa.commons.PageInfo;
import com.aaa.entity.Traderecord;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lxl
 * @since 2018-12-01
 */
public interface TraderecordService extends IService<Traderecord> {

    PageInfo dataGridT(PageInfo pageInfo);

    List<Traderecord> listTrade();
}
