package com.tianshi.controller;


import com.alibaba.fastjson.JSONObject;
import com.tianshi.base.baseController;
import com.tianshi.domain.Demond;
import com.tianshi.service.DemondService;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.*;


/**
 * Created by hefg on 2017/3/13.
 * 需求信息 增删改查
 */
@Controller
@RequestMapping("/demond")
public class DemondController extends baseController {
    @Resource
    private DemondService demondService ;

    //展示全部
    @RequestMapping("/getAll")
    @ResponseBody
    public  String getDemonds(){
        List<Demond> list = null ;
        list = demondService.getall() ;
        //将list转换成一个json 对象
        JSONArray jsonArray= JSONArray.fromObject(list) ;
//        JSONObject jsonObject = new JSONObject() ;
//        jsonObject.put("data",jsonArray.toString()) ;
        return  jsonArray.toString() ;

    }
    @RequestMapping("/getAllByUsername")
    @ResponseBody
    public  String getDemondsById(){
        List<Demond> list = null ;
        Integer identity = this.user_idendity ;
        if(identity!=0){
            list = demondService.getallByid(this.login_username) ;
        }
        if(identity==0){
            list= demondService.getall() ;
        }

        //将list转换成一个json 对象
        JSONArray jsonArray= JSONArray.fromObject(list) ;
//        JSONObject jsonObject = new JSONObject() ;
//        jsonObject.put("data",jsonArray.toString()) ;
        return  jsonArray.toString() ;

    }
    //"detail":detail,"title":title,"keyword":keyword,"company":company,"phone":phone
    @RequestMapping("/add")
    @ResponseBody
    public String add(String detail,String title,String keyword,String company,String phone){
        Demond demond = new Demond() ;
        Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());
        demond.setTime(timestamp);

        String uuid = UUID.randomUUID().toString();
        demond.setId(uuid);
        demond.setcKind("未填写");
        demond.setCompany(company);
        demond.setKeyword(keyword);
        demond.setTerm("30天");
        demond.setMaxMoney("待定");
        demond.setMinMoney("待定");
        demond.setData(detail);
        demond.setTarget(title);
        demond.setPhone(phone) ;
        demond.setOwner(this.login_username);
        demondService.addDemond(demond) ;
        //返回状态给前端
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0) ;
        return jsonObject.toJSONString() ;
    }
    //删除  TODO
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(String id){

        demondService.deleteByPrimaryKey(id) ;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status",1) ;
        return jsonObject.toString() ;
    }
    @RequestMapping("/showdetail")
    public  ModelAndView getDetail(HttpServletRequest request){
        String id = request.getParameter("id");
       Demond demond = demondService.selectByPrimaryKey(id) ;
        Map<String,Demond> map = new HashMap<String, Demond>() ;
        map.put("detail",demond) ;
        return  new ModelAndView("ddetail",map) ;


    }

}
