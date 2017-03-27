<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">


<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" href="img/favicon.ico">

    <link rel="stylesheet" href="css/style.css" >
    <!-- Modernizr JS -->
    <!--[if lt IE 9]>
    <script src="null"></script>
    <![endif]-->
    <style type="text/css">
        body,html{width:100%;height:100%;}
        .login_cons{top:50%;margin-top:-325px;position: absolute;left:50%;margin-left:-215px;}
        #name,#lastname{width:48%;float:left;}#lastname{float:right;}
    </style>
</head>
<body class="full_imgs">
<div class="full_bgs">
    <div class='login_cons container register_cons'>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <input type="text" class="form-control" id="name" placeholder="请输入您的姓名称">
                    <input type="text" class="form-control" id="gender" placeholder="请输入您的性别">
                    <div class="clear"></div>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="phone" placeholder="请输入手机号码或邮箱地址">
                </div>

                <div class="form-group">
                    <input type="text" class="form-control" id="password" placeholder="请设置登录密码">
                </div>
                <p>请填写机构或企业名称和地址信息</p>
                <div class="form-group">
                    <input type="text" class="form-control" id="company" placeholder="请输入机构或企业名称">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="phone2" placeholder="请输入紧急联系人电话">
                </div>
                <br />
                <input type="submit" value="注册" class="btn btn-success btn-block btn-lg bg_color" id="buttons_submit"/>
                <a href="/" class="fot_left">首页</a>
                <a href="login.jsp" class="fot_rig">已有账号，去登录</a>
            </div>
        </div>

    </div>
</div>
<!-- <h1 class="top_regis_tips">注册成为科学家在线用户，和1100万科学家互动。</h1> -->



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

<!-- loading toast -->
<div id="loadingToast" class="weui_loading_toast" style="display:none;">
    <div class="weui_mask_transparent"></div>
    <div class="weui_toast">
        <div class="weui_loading">
            <div class="weui_loading_leaf weui_loading_leaf_0"></div>
            <div class="weui_loading_leaf weui_loading_leaf_1"></div>
            <div class="weui_loading_leaf weui_loading_leaf_2"></div>
            <div class="weui_loading_leaf weui_loading_leaf_3"></div>
            <div class="weui_loading_leaf weui_loading_leaf_4"></div>
            <div class="weui_loading_leaf weui_loading_leaf_5"></div>
            <div class="weui_loading_leaf weui_loading_leaf_6"></div>
            <div class="weui_loading_leaf weui_loading_leaf_7"></div>
            <div class="weui_loading_leaf weui_loading_leaf_8"></div>
            <div class="weui_loading_leaf weui_loading_leaf_9"></div>
            <div class="weui_loading_leaf weui_loading_leaf_10"></div>
            <div class="weui_loading_leaf weui_loading_leaf_11"></div>
        </div>
        <p class="weui_toast_content">数据加载中</p>
    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/style.js" type="text/javascript" charset="utf-8"></script>
<script src="/assets/js/custom.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    function myReload() {
        $.ajax({
            type: "POST",
            dataType:"json",
            url: "/api/pic-check-code",
            data:{},
            success: function(data){
                if(data.code==0){
                    $("#CreateCheckCode").attr("src","data:image/jpeg;base64,"+data.data[0]);
                    $("#checkCodeRes").val(data.data[1]);
                }else{
                    show_layer_tips(data.data);
                }
            },
            error: function (e) {
                show_layer_tips('发送失败,请重试');
            }
        });

    }
    var rStep = "sin";
    $(function(){
        myReload();
        $("#ser_yzm").click(function(){
            var phone = $("#phone").val();
            var checkCode = $("#checkCode").val();
            var checkCodeRes = $("#checkCodeRes").val();
            if(phone!=''){
                if(checkCode != ""){
                    $.ajax({
                        type: "POST",
                        dataType:"json",
                        url: "/api/h5-sms-valid-code",
                        data:{"phone":phone,"checkCode":checkCode,"checkCodeRes":checkCodeRes},
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
                    layer_tips('请填写随机验证码');
                }

            }else{
                layer_tips('手机号或者邮箱不能为空');
            }
            return false;
        });

        $("#buttons_submit").click(function(){
            var phone = $("#phone").val();
            var password = $("#password").val();
            var name = $("#name").val();
            var gender = $("#gender").val();
            var company = $("#company").val();
            var phone2 = $("#phone2").val();
            alert("phone"+phone)
            if(phone!='' && $.trim(name) != ""  && $.trim(password) != ""){
                $.ajax({
                    type: "POST",
                    dataType:"json",
                    url: "/user/register",
                    data:{"phone":phone,"password":password,"name":name,"gender":gender,"company":company,"phone2":phone2},
                    success: function(data){
                        console.log(data);
                        if(data.code==0){
                            layer_tips(data.data);
                            window.location.href="/";

                        }else{
                            layer_tips(data.data);
                        }
                    },
                    error: function (e) {
                        layer_tips('注册失败,请重试');
                    }
                });
            }else{
                error_tips('请完善信息');
            }
            return false;
        });
    })

</script>

</body>
</html>
