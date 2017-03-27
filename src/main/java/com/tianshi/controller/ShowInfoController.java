package com.tianshi.controller;

import com.alibaba.fastjson.JSONObject;
import com.tianshi.base.baseController;
import com.tianshi.domain.ShowInfo;
import com.tianshi.service.ShowInfoService;
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
 * Created by Administrator on 2017/3/10 0010.
 */
@Controller
@RequestMapping("/result")
public class ShowInfoController extends baseController {

    @Resource
    private ShowInfoService showInfoService ;
    @RequestMapping("/getAll")
    @ResponseBody
    public String getAll() {
        List<ShowInfo> list = showInfoService.getAll();
        JSONArray jsonArray = JSONArray.fromObject(list);
        System.out.println(jsonArray.toString());

        return jsonArray.toString();
    }

    @RequestMapping("/showDetail")

    public ModelAndView  getDetail(HttpServletRequest request){
        String id = request.getParameter("id");
        ShowInfo showInfo = showInfoService.selectByPrimaryKey(id) ;
        //JSONObject jsonObject = JSONObject.fromObject(showInfo);
        Map<String,ShowInfo> map = new HashMap<String, ShowInfo>() ;
        map.put("detail",showInfo) ;
        return  new ModelAndView("detail",map) ;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String deleteById(String id){
        System.out.println("被删除的id是："+id);
        showInfoService.deleteByPrimaryKey(id);
        JSONObject jsonObject = new JSONObject() ;
        jsonObject.put("code",0) ;
        return jsonObject.toJSONString();

    }
    @RequestMapping("/getAllByUsername")
    @ResponseBody
    public String getAllByUsername(){
        //获取当前登录的身份
        String username = this.login_username ;
        Integer idendity = this.user_idendity ;
        List<ShowInfo> list = null ;
        System.out.println("当前的身份是"+idendity);
        if(idendity==0){
            //管理员可以查看全部
            list =showInfoService.getAll() ;
        }else if (idendity==1){
            //高校用户 查看自己的技术分享和展示
            list = showInfoService.getAllByUsername(username);

        }
        JSONArray jsonArray = JSONArray.fromObject(list) ;

        return jsonArray.toString() ;

    }
    @RequestMapping("/add")
    @ResponseBody
    public  String add(String financing_money,String title,String keyword,
                       String financing_percent,String work_method,String pay_out,String patent,
                       String  info,String t_info,String t_advance,String market,String stage)
    {
        ShowInfo showInfo = new ShowInfo() ;
        Random random = new Random();
        Integer id2 = random.nextInt(2147483647) ;
        String id = id2.toString() ;

        Date date = new Date() ;
        Timestamp timestamp = new Timestamp(date.getTime());
        showInfo.setId(id);
        showInfo.setTime(timestamp);
        showInfo.setOwner(this.login_username);
        showInfo.setFinancingMoney(financing_money);
        showInfo.setFinancingPercent(financing_percent);
        showInfo.setTitle(title);
        showInfo.setKeyword(keyword);
        showInfo.setWorkMethod(work_method);
        showInfo.setPayOut(pay_out);
        showInfo.setPatent(patent);
        showInfo.setInfo(info);
        showInfo.settInfo(t_info);
        showInfo.settAdvance(t_advance);
        showInfo.setMarket(market);
        showInfo.setStage(stage);

        System.out.println(showInfo.toString()+"+++++++++++++");
        showInfoService.add(showInfo) ;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0) ;

        return jsonObject.toString() ;

    }
}
