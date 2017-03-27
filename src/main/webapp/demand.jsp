<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>title</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/newmycss.css">
    <link rel="stylesheet" href="./css/layer.css" id="layui_layer_skinlayercss">

</head>
<body class="">
<!--公用头部-->

<header id="zhiye-header" role="banner" class="zhiye_header_class">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header zhiye_top_nav">
                <a class="navbar-brand" href="index.jsp">网站标题（自定义）</a>
                <a href="../demand.jsp" class="top_lis" target="_blank" id="mydemod" style="display: none ;">需求管理</a>
                <a id ="tmanage" href="../resultManage.jsp" class="top_lis" target="_blank" style="display:none ;">技术成果管理</a>
                <a id="usermanage" href="../userManage.jsp" class="top_lis" target="_blank" style="display:none ;">人员管理</a>
            </div>

            <div id="zhiye-navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li style='border-right:none;margin-top: 10px'>
                        <div class="btn-group">
                            <a href="javascript:;" class="top_lis dropdown-toggle" data-toggle="dropdown" style="font-size: 16px;border-right: none;margin-left: 0px;margin-top:-5px;"><span id="login_user"></span><i class="glyphicon glyphicon-list" style="margin-top:-1px;vertical-align: middle;"></i></a>
                            <ul class="dropdown-menu header_menu" role="menu">
                                <li><a href="/">自定义</a></li>
                                <li>
                                    <a href="/">
                                        <span>自定义</span></a></li>
                                <li><a href="javascript:;" class="change_he" onclick="return changeSin('sin');"><span><i class="glyphicon glyphicon-circle-arrow-right"></i>客户场景</span></a></li>
                                <li><a href="/index2.jsp"><span id="out">退出</span></a></li>
                            </ul>
                        </div>
                    </li>

                </ul>
                <span class="fw_phone">服务热线：400-400-400</span>
            </div>
        </div>


        </div>
    </nav>
</header>
<script type="text/javascript">
    function changeSin(sen) {
        $.ajax({
            type: 'POST',
            url: "/api/change-sin",
            dataType: "json",
            cache: false,
            data: {'s': sen},
            beforeSend: function () {
                $("#loading").show();
            },
            success: function (data) {
                $("#loading").hide();
                if (data.code == 0) {
                    window.location.href = "/";
                } else {
                    alert(data.data);
                }
            }
        });
        return false;
    }

</script>


<div class="zhiye-slider item2s"
     style="background-image:url(img/bgc1.jpg);background-size:cover ;">
    <div class="item" style="height: 100%;">
        <div class="zhiye-overlay"></div>
        <!-- <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="zhiye-slide-lead">项目需求</h1>
                </div>
            </div>
        </div> -->
        <div class="cons_full_lis cons_full_lis2">
            <div class="table">
                <div class="table-cell trans_easeOut_2">
                    <img src="./img/x2.png" class="ims_1">
                    <img src="./img/x22.png" class="ims_2 trans_easeOut_2">
                    <span>企业</span>
                    <p class="">各行业尤其是技术性企业，面临技术问题解决和转型升级需求，希望科学家在线ScientistIn提供技术专家的对接服务。</p>
                </div>
                <div class="table-cell trans_easeOut_2">
                    <img src="./img/x5.png" class="ims_1">
                    <img src="./img/x55.png" class="ims_2 trans_easeOut_2">
                    <span>政府部门</span>
                    <p class="">政府部门希望通过科学家在线ScientistIn提供的大数据、专业报告及科技示活动示范，提高决策科学性和管理效能。</p>
                </div>
                <div class="table-cell trans_easeOut_2">
                    <img src="./img/x3.png" class="ims_1">
                    <img src="./img/x33.png" class="ims_2 trans_easeOut_2">
                    <span>行业协会</span>
                    <p class="">行业协会希望通过科学家在线ScientistIn的产业大数据和人才库，实现对行业的深入了解和动态跟踪、人才的有效流动和其他行业科技活动实践。</p>
                </div>
                <div class="table-cell trans_easeOut_2">
                    <img src="./img/x1.png" class="ims_1">
                    <img src="./img/x11.png" class="ims_2 trans_easeOut_2">
                    <span>金融机构</span>
                    <p class="">金融机构希望通过科学家在线ScientistIn推荐的可转换技术和完整的评估体系，降低投资风险、获取更高回报。</p>
                </div>
                <div class="table-cell trans_easeOut_2">
                    <img src="./img/x4.png" class="ims_1">
                    <img src="./img/x44.png" class="ims_2 trans_easeOut_2">
                    <span>创业园区</span>
                    <p class="">各创业园区希望通过科学家在线ScientistIn提供的特定技术、设备、专家，为特定企业或园区发展进行一站式问题处理。</p>
                </div>
                <div class="table-cell trans_easeOut_2">
                    <img src="./img/x6.png" class="ims_1">
                    <img src="./img/x66.png" class="ims_2 trans_easeOut_2">
                    <span>环保</span>
                    <p class="">科学家在线ScientistIn深耕环保领域的管理、标准、技术、设备、企业与专家等产业要素，为环保领域的企业、政府部门、技术专家等提供一站式技术处理与平台合作。</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="add_floor ng_col">
    <div class="table">
        <a href="demondAdd.jsp" class="table-cell table-cell-add">
            <span class="add_issue"><em class="glyphicon glyphicon-plus"></em>提交需求</span>
        </a>
    </div>
</div>

<!-- <div class="top_heights"></div> -->
<div class="slide_cons">
    <div class="container-fluid bg_ims_color bg_ims_color-whilt">
        <div class="owl-carousel-slides owl-carousel owl-theme owl-responsive--1 owl-loaded">
            <div class="owl-stage-outer">
                <div class="owl-stage">
                    <div class="owl-item active" style="width: 100%; margin-right: 0px;">
                        <div class="item">
                            <div class="container-fluid slide_cons_rows slide_cons_rows2">
                                <div class="row" id="showinfo">

                                    <div class="col-md-2">
                                        <a href="http://www.scientistin.com/pc/issueInfoTemp.do?iid=892310e90692fb50d32a246f9fe4f162"
                                           target="_blank">

                                            <p class="tit he_f2 ellipsis" style="word-wrap: break-word;">苏州某某公司</p>
                                            <span class="he_f2 ellipsis" style="word-wrap: break-word;">需要小规模的、可应用于工业企业内部减量使用的小型水处理设备技术</span>
                                            <p class="he_f1 ellipsis is-truncated" style="word-wrap: break-word;">
                                                需要小规模的，可以应用于工业企业内部减量使用的小型水处理设备技术，每天10吨左右工业废水... </p>
                                            <p>2016-11-24 20:43</p>
                                            <p class="he_f3">最新进展：客服发表评论</p>
                                        </a>
                                    </div>

                                    <div class="col-md-2">
                                        <a href="http://www.scientistin.com/pc/issueInfoTemp.do?iid=cec3954d231ba2433575a57d99f21e28"
                                           target="_blank">

                                            <p class="tit he_f2 ellipsis" style="word-wrap: break-word;">
                                                北京某某环境科技股份有限公司</p>
                                            <span class="he_f2 ellipsis" style="word-wrap: break-word;">电站锅炉燃烧喷口风速、风量、动量等优化配比</span>
                                            <p class="he_f1 ellipsis is-truncated" style="word-wrap: break-word;">
                                                北京某某环境科技股份有限公司（上市公司），专业电站锅炉燃烧公司。目前正在开发CEE靶向燃... </p>
                                            <p>2016-12-13 17:13</p>
                                            <p class="he_f3">最新进展：专家响应需求</p>
                                        </a>
                                    </div>

                                    <div class="col-md-2">
                                        <a href="http://www.scientistin.com/pc/issueInfoTemp.do?iid=e5801775bbb7b9e554b0a7aa65c51ceb"
                                           target="_blank">

                                            <p class="tit he_f2 ellipsis" style="word-wrap: break-word;">
                                                广东某某产业孵化有限公司</p>
                                            <span class="he_f2 ellipsis"
                                                  style="word-wrap: break-word;">寻求餐厨垃圾的无害化处理技术</span>
                                            <p class="he_f1 ellipsis is-truncated" style="word-wrap: break-word;">
                                                餐厨垃圾市场巨大，目前是市面有养殖黑水虻吃掉厨馀的方法，希望找到比较实用、无害的餐厨垃... </p>
                                            <p>2016-12-16 10:44</p>
                                            <p class="he_f3">最新进展：专家响应需求</p>
                                        </a>
                                    </div>

                                    <div class="col-md-2">
                                        <a href="http://www.scientistin.com/pc/issueInfoTemp.do?iid=212be1ffb9916eb37b4e97101924d98c"
                                           target="_blank">

                                            <p class="tit he_f2 ellipsis" style="word-wrap: break-word;">
                                                邯郸某某环保设备有限公司</p>
                                            <span class="he_f2 ellipsis" style="word-wrap: break-word;">求铜管防垢技术</span>
                                            <p class="he_f1 ellipsis is-truncated" style="word-wrap: break-word;">
                                                公司生产制冷设备，用水通过铜管制冷，使用一段时候后，铜管会结垢，影响制冷的性能，同时可... </p>
                                            <p>2016-12-16 14:48</p>
                                            <p class="he_f3">最新进展：多方通话</p>
                                        </a>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--<div class="owl-controls">-->
                <!--<div class="owl-nav">-->
                    <!--<div class="owl-prev" style=""><i class="glyphicon glyphicon-arrow-left"></i></div>-->
                    <!--<div class="owl-next" style=""><i class="glyphicon glyphicon-arrow-right"></i></div>-->
                <!--</div>-->
                <!--<div class="owl-dots" style="">-->
                    <!--<div class="owl-dot"><span>节能环保</span></div>-->
                    <!--<div class="owl-dot"><span>生物医药</span></div>-->
                    <!--<div class="owl-dot"><span>机械制造</span></div>-->
                    <!--<div class="owl-dot"><span>电子信息</span></div>-->
                    <!--<div class="owl-dot"><span>化学化工</span></div>-->
                    <!--<div class="owl-dot"><span>新能源</span></div>-->
                    <!--<div class="owl-dot"><span>材料科学</span></div>-->
                    <!--<div class="owl-dot"><span>其他</span></div>-->
                <!--</div>-->
            <!--</div>-->
        </div>
    </div>
</div>

<div class="others_lis">
    <div class="container">
        <div class="row text-center">
            <h1 class="tit_h1 nll_colors">我们的客户</h1>
        </div>
        <div class="row">
            <div class="col-md-10 ma_center">
                <p class="text1">
                    我们的客户广泛分布于各个领域的企业、政府部门、行业协会、金融机构、创业园区、实验基地等，通过获取科学家在线ScientistIn提供的知识和技术，实现决策的把控、技术的革新、产能的提升、管理的优化、人才的流通等。</p>
                <br><br>
            </div>
        </div>
    </div>


</div>

<section id="source">
    <div class="container">
        <div class="source-title">
            <h2>丰富的专家资源</h2>
            <p>专业的线上和线下渠道，由专人收集知识和智力需求，智能匹配合适专家</p>
            <p>实现专家的一对一和多对一服务</p>
        </div>
        <div class="row">
            <div class="col-md-4 one">
                <div class="jiaoshou-title">
                    <div class="pull-left">
                        <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                    </div>
                    <div class="pull-left">
                        <p>专家教授</p>
                        <p>3500+</p>
                    </div>
                </div>
                <div class="jiaoshou-con">
                    <p><span>长江学者</span><span>2200+</span></p>
                    <p><span>特聘教授</span><span>1500+</span></p>
                    <p><span>两院院士</span><span>1500+</span></p>
                    <div>汇聚了全国出类拔萃的专家教授</div>
                </div>
            </div>
            <div class="col-md-4 two">
                <div class="hight">
                    <div class="jiaoshou-title">
                        <div class="pull-left">
                            <i class="fa fa-cubes" aria-hidden="true"></i>
                        </div>
                        <div class="pull-left">
                            <p>领域专家</p>
                            <p>200万+</p>
                        </div>
                    </div>
                    <div class="jiaoshou-con">
                        <p><span>企业科技专家</span><span>18万+</span></p>
                        <p><span>大学科研专家</span><span>120万+</span></p>
                        <p><span>医学研究专家</span><span>78万+</span></p>
                        <p><span>研究院所人员</span><span>78万+</span></p>
                        <p><span>其他类型专家</span><span>50万+</span></p>
                        <div>充分覆盖到各个行业领域</div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 three">
                <div class="jiaoshou-title">
                    <div class="pull-left">
                        <i class="fa fa-edit" aria-hidden="true"></i>
                    </div>
                    <div class="pull-left">
                        <p>各行学者</p>
                        <p>10万+</p>
                    </div>
                </div>
                <div class="jiaoshou-con">
                    <p><span>H因子大于30的学者</span><span>4472</span></p>
                    <p><span>被引次数超过500次</span><span>67,665</span></p>
                    <p><span>论文成果书多于100篇</span><span>10万+</span></p>
                    <div>几乎涵盖20多个全部的学科分类</div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="service_mas">
    <div class="container">
        <div class="row text-center">
            <h1 class="tit_h1">科学家在线ScientistIn的服务范围涵盖全方位的知识与技术供给</h1>
        </div>
        <div class="row">
            <a class="col-md-4 trans_easeOut_2">
                <img src="./img/s111.png" class="icos">
                <span>专家搜索引擎</span>
                <p class="text1">依托于科学家在线ScientisIn
                    网站的专家数据库，科学家在线提供学术专家的智能发现引擎，可以通过姓名、研究成果、研究领域、研究项目、研究专长等方面的关键词发现专家，并了解专家的研究成果。</p>
            </a>
            <a class="col-md-4 trans_easeOut_2">
                <img src="./img/s222.png" class="icos">
                <span>电话咨询</span>
                <p class="text1">通过科学家在线系统的需求提交与匹配，与专家通过电话进行一对一交流。</p>
            </a>
            <a class="col-md-4 trans_easeOut_2">
                <img src="./img/s333.png" class="icos">
                <span>面对面咨询</span>
                <p class="text1">与专家一对一面谈或展开小组讨论，实现更有效的沟通。</p>
            </a>
        </div>
        <div class="row">
            <a class="col-md-4 trans_easeOut_2">
                <img src="./img/s444.png" class="icos">
                <span>技术研讨会</span>
                <p class="text1">针对大型或较复杂的技术问题，科学家在线可组织多位专家开展技术研讨会，形成最优方案。</p>
            </a>
            <a class="col-md-4 trans_easeOut_2">
                <img src="./img/s555.png" class="icos">
                <span>现场服务</span>
                <p class="text1">邀请专家至现场就技术问题进行指导与跟进、提供解决方案。</p>
            </a>
            <a class="col-md-4 trans_easeOut_2">
                <img src="./img/s666.png" class="icos">
                <span>专家问卷调查</span>
                <p class="text1">客户委托科学家在线向特定专家群体开展问卷调差，了解群体情况。</p>
            </a>
        </div>
        <div class="row">
            <a class="col-md-4 trans_easeOut_2">
                <img src="./img/s777.png" class="icos">
                <span>研究报告</span>
                <p class="text1">通过大数据和案例研究，科学家在线为各行业按特定需求提供相关定制报告。</p>
            </a>
            <a class="col-md-4 trans_easeOut_2">
                <img src="./img/s888.png" class="icos">
                <span>专家培训</span>
                <p class="text1">科学家在线邀请专家为客户提供团队培训、人才培训、技术培训等。</p>
            </a>
            <a class="col-md-4 trans_easeOut_2">
                <img src="./img/s999.png" class="icos">
                <span>长期顾问</span>
                <p class="text1">推荐专家担任长期顾问和运营职务。</p>
            </a>
        </div>
        <div class="row">
            <a class="col-md-4 trans_easeOut_2">
                <img src="./img/s101010.png" class="icos">
                <span>人才引进</span>
                <p class="text1">根据特定需求推荐并引进相关技术人才。</p>
            </a>
            <a class="col-md-4 trans_easeOut_2">
                <img src="./img/st111.png" class="icos">
                <span>招商引资</span>
                <p class="text1">协助当地符合条件的区域进行宣传展示和招商引资。</p>
            </a>
            <a class="col-md-4 trans_easeOut_2">
                <img src="./img/st222.png" class="icos">
                <span>拓展市场渠道</span>
                <p class="text1">通过科学家在线平台，为平台的客户寻求合作机会、拓展市场渠道、实现撮合交易。</p>
            </a>
        </div>
        <div class="row">
            <a class="col-md-4 trans_easeOut_2">
                <img src="./img/st333.png" class="icos">
                <span>渠道建立</span>
                <p class="text1">在符合条件的地方设立（挂牌）科技服务站点，帮助站点成为跨区域的渠道网络。</p>
            </a>
            <a class="col-md-4 trans_easeOut_2">
                <img src="./img/st444.png" class="icos">
                <span>技术项目推介</span>
                <p class="text1">为有需求的客户推荐可转化、可落地的技术项目，实现团队的对接。</p>
            </a>
            <a class="col-md-4 trans_easeOut_2">
                <img src="./img/st555.png" class="icos">
                <span>其他</span>
                <p class="text1">科研仪器共享？科研专利购买？检测服务？文献购买？</p>
            </a>
        </div>
    </div>
</div>

<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<!-- Owl carousel -->
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/jquery.dotdotdot.min.js"></script>

<script src="../js/layer.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/style.js" type="text/javascript" charset="utf-8"></script>


<script type="text/javascript">
    $(function () {
        $(".zhiye_top_nav a").each(function () {
            if ($(this).attr("data-types") == 2) {
                $(this).addClass("active");
            }
        });
    })

</script>

<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            type: "POST",
            dataType:"json",
            url: "/user/getLoginUsername",
            success:function (data) {
                var html ="" ;
                html=data.data+"&nbsp&nbsp";
                $("#login_user").html(html);

            },

        })
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
        //权限检查
        $.ajax({
            type: "POST",
            dataType:"json",
            url: "/user/getLoginUsername",
            success:function (data) {
                var idendity = data.idendity ;
                var owner = "${detail.owner}"
                var mydemod = document.getElementById("mydemod")
                var tmanage = document.getElementById("tmanage")
                var usermanage = document.getElementById("usermanage")
                //1是高校  2是企业  3pt 0管理
                if (idendity=='2'||idendity=='0'){
                    mydemod.style.display="inline";
                }
                if (idendity=='1'||idendity=='0'){
                    tmanage.style.display="inline";
                }
                if (idendity=='0'){
                    usermanage.style.display="inline";
                }

            }
        })


        $.ajax({
            type: "POST",
            dataType:"json",
            url: "/demond/getAllByUsername",
            success:function (data) {
                var html ="" ;
                for(var i=0;i<data.length;i++) {

                    var id = data[i].id;
                    var owner = data[i].owner;
                    var keyword = data[i].keyword;
                    var ckind = data[i].cKind;
                    var datainfo = data[i].data;
                    var time2 = data[i].time.time;
                    //将时间戳转换成时间的string
                    var newdate = new Date();
                    newdate.setTime(time2);
                    var outTime = newdate.toLocaleDateString() ;
                    var term = data[i].term;
                    var minmoney = data[i].minMoney;
                    var maxmoney = data[i].maxMoney;
                    var target = data[i].target;
                    var content = "<div class='col-md-2'>" +
                        "<a href='/demond/showdetail?id=" + id + "'>" +
                        "<p class='tit he_f2 ellipsis' style='word-wrap: break-word;'>" + owner + "</p>" +
                        "<span class='he_f2 ellipsis' style='word-wrap: break-word;'>" + target.substring(0,20)+"..." + "</span>" +
                        "<p class='he_f1 ellipsis is-truncated' style='word-wrap: break-word;'>" + datainfo.substring(0,20)+"..." + "</p>" +
                        "<p>" + outTime + "</p>" +
                        "<p class='he_f3'>最新进展：客服发表评论</p>" + "</a></div>" ;
                    html+=content

                }
                $("#showinfo").html(html)

            },
            error:function (data) {
            },

        })

    })


</script>
</body>
</html>
