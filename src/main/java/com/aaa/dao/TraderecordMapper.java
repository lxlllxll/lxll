package com.aaa.dao;

import com.aaa.entity.Traderecord;
import com.aaa.entity.Tradetype;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author lxl
 * @since 2018-12-01
 */
@Mapper
public interface TraderecordMapper extends BaseMapper<Traderecord> {

    List<Map> dataGridT(Page<Map> page, Map<String, Object> condition);

    List<Map> selectSize(Map<String, Object> condition);

    //List<Traderecord> listTrade();
    //select traderecord.recordtime,traderecord.recordno,traderecord.recordmoney,traderecord.recordremark,tradetype.tradeName from traderecord,tradetype where traderecord.tradeId=tradetype.tradeId
    /*<result column="recordno" property="recordno" />
		<result column="recordtime" property="recordtime" />
		<result column="recordmoney" property="recordmoney" />
		<result column="recordremark" property="recordremark" />*/
    /*<result column="tradeId" property="tradeId"/>
			<result column="tradeName" property="tradeName"/>*/

    @Results({
            @Result(column="recordno",property="recordno"),
            @Result(column="recordtime",property="recordtime"),
            @Result(column="recordmoney",property="recordmoney"),
            @Result(column="recordremark",property="recordremark"),
            @Result(column="tradeId",property="tradeId",one=@One(select="com.aaa.dao.TraderecordMapper.listtt"))})
    @Select("select * from traderecord")
    public List<Traderecord> listTrade();

    @Results({
            @Result(column="tradeId",property="tradeId"),
            @Result(column="tradeName",property="tradeName")})
    @Select("select * from tradetype where tradeId=#{0}")
    public Tradetype listtt();



}