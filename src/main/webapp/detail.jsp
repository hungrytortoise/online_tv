<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>成果详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="" />
    <meta name="keywords" content="" />

    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="stylesheet" href="../../css/style.css" >
    <link rel="stylesheet" type="text/css" href="../../css/newmycss.css"/>
    <!--[if lt IE 9]>
    <script src="null"></script>
    <![endif]-->
    <style type="text/css">
        body,html{width:100%;height:100%;background-color: #f7f7f7;}
        .no_bo{margin-top: 20px;}
        .no_bo .weui_cell_ls{margin-top:0;}
        .no_bo .weui_cells:after{border-bottom:none;}
        .weui_cells{font-size:14px;}
    </style>
</head>

<body>
<!--公用头部-->

<header id="zhiye-header" class="zhiye_header_class">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header zhiye_top_nav">
                <a class="navbar-brand" href="/index.jsp">网站标题（自定义）</a>
                <a href="" class="top_lis" target="_blank">菜单名称1</a>
                <a href="" class="top_lis" target="_blank">菜单名称2</a>
                <a href="" class="top_lis" target="_blank">菜单名称3</a>
            </div>
            <div id="zhiye-navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <!--<a href="register.html"><span>注册</span></a>-->
                    </li>
                    <li class="active"><a href="login.html"><span>登录</span></a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="container" style="padding-top: 90px">
    <div class="row">
        <div class="col-md-10 ma_center bs_co_ff">
            <h1 class="issue_h1">${detail.title}</h1>
            <a id="btnInterest" class="btn btn-danger" style="float:right;visibility:hidden ;" >删除</a>
            <div class="iss_floor1 iss_floor2">
                <div class="row">
                    <div class="col-md-4">
							<span class="iss_company t_bold">${detail.stage}</span>
                    </div>
                    <div class="col-md-4">
                        <span class="iss_time">${detail.time}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <font class="t_bold">技术关键词：</font>${detail.keyword}
                    </div>
                    <div class="col-md-2">
                        <font class="t_bold">融资金额：</font>${detail.financingMoney}
                    </div>
                    <div class="col-md-2">
                        <font class="t_bold">融资占比：</font>${detail.financingPercent}
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2 t_bold">
                        合作方式：
                    </div>
                    <div class="col-md-10 no_pa_left">
                        ${detail.workMethod}

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 t_bold">
                        投入产出：
                    </div>
                    <div class="col-md-10 no_pa_left">
                        ${detail.payOut}
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2 t_bold">
                        专利信息：
                    </div>
                    <div class="col-md-10 no_pa_left">
                        ${detail.patent}
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 t_bold">
                        项目简介：
                    </div>
                    <div class="col-md-10 no_pa_left">
                        ${detail.info}
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2 t_bold">
                        技术信息：
                    </div>
                    <div class="col-md-10 no_pa_left">
                        ${detail.tInfo}
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-2 t_bold">
                        市场应用：
                    </div>
                    <div class="col-md-10 no_pa_left">
                        ${detail.market}
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-2 t_bold">
                        技术优势：
                    </div>
                    <div class="col-md-10 no_pa_left">
                        ${detail.tAdvance}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript">
//权限检查 管理员和所有者有权限删除
$("#out").click(function (){
    //清空登录信息
    $.ajax({
        type: "POST",
        dataType:"json",
        url: "/user/clean",
        success:function (data) {
            alert(data.code)
            if(data.code==0){
                alert("panduan")


            }
        }

    })

})


        $(function () {
            $.ajax({
                type: "POST",
                dataType:"json",
                url: "/user/getLoginUsername",
                success:function (data) {
                    var idendity = data.idendity ;
                    var username = data.username ;
                    var owner = "${detail.owner}"
                    if ((idendity=='1' && owner==username)||idendity=='0'){
                        var ele = document.getElementById("btnInterest")
                        ele.style.visibility="visible";
                    }

                }


            })
        $("#btnInterest").click(function () {
            //获取id
            $.ajax({
                type: "POST",
                dataType:"json",
                url: "/result/delete",
                data:{id:"${detail.id}"},
                success :function (data) {
                    var code = data.code ;
                    if(code==0){
                        alert("成功删除")
                        parent.location.href ="/"
                    }
                }
            })
        })
    })

</script>
</body>
</html>
