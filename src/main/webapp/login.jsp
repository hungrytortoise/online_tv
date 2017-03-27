<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/style.css" >
    <!--[if lt IE 9]>
    <script src="null"></script>
    <![endif]-->
    <style type="text/css">
        body,html{width:100%;height:100%;}
        .login_cons{top:50%;margin-top:-201px;position: absolute;left:50%;margin-left:-215px;}
    </style>
</head>
<body class="full_imgs">
<div class="full_bgs">
    <div class='login_cons container'>
        <div class="row">
            <div class="col-md-12">
                <span style="color:#0F63A8;font-size:18px;">登录系统</span>
                <p></p>
                <form id="login">
                <div class="form-group">
                    <input type="phone" class="form-control" id="phone" placeholder="请输入注册邮箱或手机号">
                </div>
                <div class="form-group res_mm">
                    <input type="password" class="form-control" id="password" placeholder="请输入密码">
                </div>
                <div class="form-group res_code">
                    <input type="text" class="form-control" id="code" placeholder="请输入验证码">
                    <input type="button" required class="btn btn-success sms-button bg_color" value="获取验证码" id="ser_yzm" />
                </div>
                <br />
                <input type="submit" value="登录" class="btn btn-success btn-block btn-lg bg_color" id="buttons_submit"/>
                </form>
                <a href="register.jsp" class="fot_rig">无账号，去注册 </a>
                <a href="index2.jsp" class="fot_left">首页</a>
            </div>
        </div>
        <ul class="login_type">
            <li class="active">密码登录</li>
        </ul>
    </div>
</div>




<!-- 弹出窗口layer -->
<button type="button" class="btn btn-primary hidden" id="tips_btn" data-toggle="modal" data-target=".bs-example-modal-sm">提示信息</button>
<div class="modal fade bs-example-modal-sm tips_btn_modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="myLargeModalLabel">信息提示</h4>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/style.js" type="text/javascript" charset="utf-8"></script>
<script src="js/custom.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    var type=0;
    var lStep = "sin";
    $(function(){
        $("#ser_yzm").click(function(){
            var phone = $("#phone").val();
            if(phone!=''){
                $.ajax({
                    type: "POST",
                    dataType:"json",
                    url: "/api/send-login-code",
                    data:{"phone":phone},
                    success: function(data){
                        console.log(data);
                        if(data.code==0){
                            layer_tips(data.data);
                            var optionsSms = {
                                time:60
                            };
                            //发送倒计时
                            $(".sms-button").sendSms(optionsSms);
                        }else{
                            layer_tips(data.data);
                        }
                    },
                    error: function (e) {
                        layer_tips('发送失败,请重试');
                    }
                });
            }else{
                layer_tips('手机号或邮箱不能为空');
            }
            return false;
        });

        $("#buttons_submit").click(function(){
            var phone = $("#phone").val();
            var password = $("#password").val();
            var code = $("#code").val();
            if(phone!=''){
                $.ajax({
                    type: "POST",
                    dataType:"json",
                    url: "/user/login",
                    data:{"phone":phone,"password":password},
                    success: function(data){
                        console.log(data);
                        if(data.code==0){  //成功  区分身份
                            layer_tips(data.data) ;
                            if(lStep=="3"){
                                window.location.href="/index.jsp";
                            }
                            else{
                                window.location.href="/index.jsp";
                            }
                        }else{
                            layer_tips(data.data);
                        }
                    },
                    error: function (e) {
                        layer_tips('登录失败,请重试');
                    }
                });
            }else{
                layer_tips('手机号或邮箱不能为空');
            }
            return false;

        });

        $(".login_type li").click(function(){
            $(this).addClass("active").siblings("li").removeClass("active");
            if($(this).index()==0){
                $(".res_mm").show();$(".res_code").hide();
                $("#code").val("");
                $("#phone").attr('placeholder','请输入注册邮箱或手机号');
            }else{
                $(".res_mm").hide();$(".res_code").show();
                $("#password").val("");
                $("#phone").attr('placeholder','请输入注册手机号');
            }
        });
    })
</script>
<script src="./js/main.js"></script>
</body>
</html>