package com.aaa.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.util.HashMap;
import java.util.List;
import java.util.Date;
import java.util.Map;

import com.aaa.commons.BaseController;
import com.aaa.entity.TraderQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.aaa.commons.PageInfo;
import com.aaa.entity.Traderecord;
import com.aaa.service.TraderecordService;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author lxl
 * @since 2018-12-01
 */
@Controller
@RequestMapping("/traderecord")
public class TraderecordController extends BaseController {

    @Autowired private TraderecordService traderecordService;
    
    @GetMapping("/manager")
    public String manager() {
        return "list";
    }
    
    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(TraderQuery query,Traderecord traderecord, Integer page, Integer rows, String sort,String order) {

        System.out.println(query);

        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        //EntityWrapper<Admins> ew = new EntityWrapper<Admins>(admins);
        EntityWrapper<Traderecord> ew = new EntityWrapper<Traderecord>();

        String tradeId = query.getTradeId();
        if (tradeId!=null){
            ew.like("tradeId",query.getTradeId());
        }
        Date bbegintime = query.getBbegintime();
        Date bendtime = query.getBendtime();
        if(bbegintime!=null||bendtime!=null){
            ew.between("recordtime",query.getBbegintime(),query.getBendtime());
        }
        /*ew.like("tradeId",query.getTradeId());
        ew.between("recordtime",query.getBbegintime(),query.getBendtime());*/
        Page<Map<String, Object>> pages = getPage(page, rows, sort, order);
        //pages = traderecordService.selectPage(pages, ew);
        pages = traderecordService.selectMapsPage(pages, ew);
        int count = traderecordService.selectCount(ew);
        pageInfo.setRows(pages.getRecords());
        //pageInfo.setTotal(pages.getTotal());
        pageInfo.setTotal(count);
        return pageInfo;
    }

    @PostMapping("/dataGridT")
    @ResponseBody
    public PageInfo dataGridT(TraderQuery query,Traderecord traderecord, Integer page, Integer rows, String sort,String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        Map condition = new HashMap<String,Object>();
        if(traderecord!=null && traderecord.getTradeId()!=null){
            condition.put("tradeId",traderecord.getTradeId());
        }
        PageInfo maps = traderecordService.dataGridT(pageInfo);
        return maps;
    }

    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/traderecord/traderecordAdd";
    }

    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@Valid Traderecord traderecord) {
        /*traderecord.setCreateTime(new Date());
        traderecord.setUpdateTime(new Date());
        traderecord.setDeleteFlag(0);*/
        boolean b = traderecordService.insert(traderecord);
        if (b) {
            return renderSuccess("添加成功！");
        } else {
            return renderError("添加失败！");
        }
    }
    
    /**
     * 删除
     * @param id
     * @return
     */
    @PostMapping("/delete")
    @ResponseBody
    public Object delete(Long id) {
        Traderecord traderecord = new Traderecord();
        /*traderecord.setId(id);
        traderecord.setUpdateTime(new Date());
        traderecord.setDeleteFlag(1);*/
        boolean b = traderecordService.updateById(traderecord);
        if (b) {
            return renderSuccess("删除成功！");
        } else {
            return renderError("删除失败！");
        }
    }
    
    /**
     * 编辑
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/editPage")
    public String editPage(Model model, Long id) {
        Traderecord traderecord = traderecordService.selectById(id);
        model.addAttribute("traderecord", traderecord);
        return "admin/traderecord/traderecordEdit";
    }
    
    /**
     * 编辑
     * @param 
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid Traderecord traderecord) {
        /*traderecord.setUpdateTime(new Date());*/
        boolean b = traderecordService.updateById(traderecord);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }

    @RequestMapping("/test")
    public String test(){
        return "listTrade";
    }

    @RequestMapping("/listTrade")
    public String listTrade(HttpSession session, TraderQuery query){
        System.out.println(query);
        List<Traderecord> all = traderecordService.listTrade();
        session.setAttribute("all",all);
        return "listTrade";
    }
}
