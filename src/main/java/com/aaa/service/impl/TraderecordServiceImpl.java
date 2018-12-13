package com.aaa.service.impl;

import com.aaa.commons.PageInfo;
import com.aaa.entity.Traderecord;
import com.aaa.dao.TraderecordMapper;
import com.aaa.service.TraderecordService;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lxl
 * @since 2018-12-01
 */
@Service
public class TraderecordServiceImpl extends ServiceImpl<TraderecordMapper, Traderecord> implements TraderecordService {

    @Autowired private TraderecordMapper dao;

    @Override
    public PageInfo dataGridT(PageInfo pageInfo) {
        Page<Map> page=new Page<Map>(pageInfo.getNowpage(),pageInfo.getSize());
//设置排序字段
        page.setOrderByField(pageInfo.getSort());
//设置排序方式,如果前端传入asc,传入true
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map> list = dao.dataGridT(page, pageInfo.getCondition());
        List<Map> traderecords = dao.selectSize(pageInfo.getCondition());
        pageInfo.setTotal(traderecords.size());
        pageInfo.setRows(list);
        return pageInfo;
    }

    @Override
    public List<Traderecord> listTrade() {
        return dao.listTrade();
    }
}
