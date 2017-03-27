<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>title</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/newmycss.css">
	<link rel="stylesheet" href="./css/layer.css" id="layui_layer_skinlayercss">

	<!--[if lt IE 9]>
	<script src="null"></script>
	<![endif]-->
	<style type="text/css">
		body,html{width:100%;height:100%;}
	</style>
	<style type="text/css">
		body,table{
			font-size:12px;
		}
		table{
			table-layout:fixed;
			empty-cells:show;
			border-collapse: collapse;
			margin:0 auto;
		}
		td{
			height:30px;
		}
		h1,h2,h3{
			font-size:12px;
			margin:0;
			padding:0;
		}
		.table{
			border:1px solid #cad9ea;
			color:#666;
		}
		.table th {
			background-repeat:repeat-x;
			height:30px;
		}
		.table td,.table th{
			border:1px solid #cad9ea;
			padding:0 1em 0;
		}
		.table tr.alter{
			background-color:#f5fafe;
		}
	</style>
</head>

<body class="gd_tops bg_colors" ontouchstart >

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

<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<!-- Owl carousel -->
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/jquery.dotdotdot.min.js"></script>

<script src="../js/layer.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/style.js" type="text/javascript" charset="utf-8"></script>

<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<!-- Owl carousel -->
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/jquery.dotdotdot.min.js"></script>

<script src="../js/layer.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/style.js" type="text/javascript" charset="utf-8"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript">
var apiBasePath = "/api";
var URL = "/api/header";
var home_url = "/user/home.do";
var bp_upload_url = "";
var bp_uid="5166bfb05818a5dc42b19401b679193c";
$(document).ready(function() {
    var search_event = function () {
        var k = $("#search-entrance-keyword").val();
        if (k === "" || /^(\s)+$/.test(k)) {
            return;
        }
        window.location.href = "/search/web/result.jsp?type=5&k=" + k;

    }
    $("#search-entrance-button").on("click", search_event);
    $("#search-entrance-keyword").on("keydown", function (e) {
        event.keyCode == 13 && search_event();
    });
    $.ajax({
        type: 'POST',
        url: URL,
        dataType: "json",
        cache: false,
        success: function (result) {
            var headerFlowNum = result.data.flowCount;//动态未读数量
            if (headerFlowNum > 0) {
                if (headerFlowNum > 99) {
                    headerFlowNum = '+99';
                }
                $("#headerFlowNum").html(headerFlowNum);
                $("#headerFlowNum").addClass("num");
            } else {
                $("#headerFlowNum").removeClass("num");
            }
            var headerMsgNum = result.data.msgCount;//消息未读数量
            if (headerMsgNum > 99) {
                headerMsgNum = 99;
            }
            if (headerMsgNum > 0) {
                $("#headerMsgNum").html(headerMsgNum);
                $("#headerMsgNum").addClass("num");
            } else {
                $("#headerMsgNum").removeClass("num");
            }
            var portrait = result.data.portrait;//头像地址
            if (portrait != null && portrait != '') {
                if (portrait.indexOf("http") == 0) {
                    $("#headerUserPortrait").attr("src", portrait);
                } else {
                    $("#headerUserPortrait").attr("src", "http://rep.scientistin.com" + portrait);
                }


            }
        },
    });


    $('.add_bp').click(function (event) {
        var bp_type = 0;
        show_dialog('.bp-dialog');
        var $dialog = $('#dialog')
        $dialog.find('form').on('submit', function (event) {
            event.preventDefault();
        });
        $dialog.find('.tit_bp_type li').on('click', function (event) {
            bp_type = $(this).index();
            $dialog.find('.tit_bp_type li').removeClass("active");
            $(this).addClass("active");
        });


        $dialog.find('.send').on('click', function (event) {
            event.preventDefault();
            var title = $dialog.find('.tit_bp_title').val();
            var keyword = $dialog.find('.tit_bp_keyword').val();
            var topic = $dialog.find('.tit_bp_topic').val();
            var uploadUrl = bp_upload_url;
            if ($.trim(title) == null || $.trim(title).length < 1) {
                alert("请输入标题");//错误提示
                return false;
            }
            if ($.trim(keyword) == null || $.trim(keyword).length < 1) {
                alert("请输入关键词");//错误提示
                return false;
            }
            if ($.trim(topic) == null || $.trim(topic).length < 1) {
                alert("请输入摘要");//错误提示
                return false;
            }
            $.ajax({
                type: 'POST',
                url: "/api/bp-save",
                dataType: "json",
                cache: false,
                data: {
                    'type': bp_type,
                    'title': title,
                    'keyword': keyword,
                    'topic': topic,
                    'uploadUrl': uploadUrl,
                    'uid': bp_uid
                },
                beforeSend: function () {
                    $("#loading").show();
                },
                success: function (data) {
                    $("#loading").hide();
                    if (data.code == 0) {
                        alert(data.data);
                        $('.bp-upload-word-span').text('上传文件(20MB以内的文件或图片）');
                        $dialog.trigger('close');
                    } else {
                        alert(data.data);
                    }
                }
            });
        })
        return false;
    });


    function bp_upload_image() {
        $('.bp_file').click();
    }
})
</script>
<link rel="stylesheet" type="text/css" href="../css/shake.css"/>
<link rel="stylesheet" type="text/css" href="../css/perfect-scrollbar-0.4.1.min.css"/>
<script src="../js/perfect-scrollbar-0.4.1.with-mousewheel.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/layer/layer.js" type="text/javascript" charset="utf-8"></script>  


		<div class="dialog invite-scientist-dialog disp invite_yq_adro">
			<h1>推荐学者加入科学家在线ScientistIn：</h1>
			<form action="" method="post">
				<div class="inp_form top_ls" >
					<div class="lo_re_inp_two">
						<div class="lo_re_inp">
							<input type="text" name="username" class="username" value="" placeholder="请输入学者姓名">
						</div>
						<div class="lo_re_inp">
							<input type="text" name="email" class="email" value="" placeholder="请输入学者邮箱">
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<a class="send">发送</a>
			</form>
			<div class="clear"></div>
		</div>
<div class="head_cons">
	<a href="/" class="home_logos_new">
		<img src="/img/logonew.png">
	</a>
	<ul class="left_tab_ul">

		<li><a href="/" class="">自定义<span id="headerFlowNum" style="left:41px;"></span></a></li>
		<li><a href="/" class=" xq_acti">自定义</a></li>
		<li><a href="/" class="">自定义</a></li>


		<!--
           <li><a  href="/user/dataAnalysis.do" class="">大数据</a></li>
       大数据 -->

	</ul>
	<div class="rig_dip">
		<ul class="right_tab_ul">
			<li>
				<input type="text" name="keyword" id="search-entrance-keyword" class="inp_sp" value="" placeholder="搜索" />
				<i class="se_icon"></i>
				<input type="button" value="" class="inp_sub" id="search-entrance-button"/>
			</li>

			<li>
				<a class="top_icons top_icons_yj" href="/user/mailbox.do">
					<span id="headerMsgNum"></span>
				</a>
			</li>
			<li>
				<a  href="javascript:;" id="iframe_notify" class="top_icons top_icons_tz shake-rotate iframe_notify_btn active  shake-constant "></a>
			</li>
			<li><a href="javascript:void(0);" class="top_icons top_icons_change" onclick="return changeSin('sin');" title="客户场景"></a></li>
			<li id="sec_ewm">
				<a class="list" href="javascript:void(0);">
					<img src="/img/ewm.jpg" style="width:27px;">
				</a>
				<div class="diaga_ewm" style="display:none;">
					<div class="ewm_lays">
						<img src="/img/ewm.jpg">
						<span>
									使用微信扫描该二维码，或在微信中搜索公众号“科学家在线”，关注公众号。随时随地接收你的学术动态。
								</span>
					</div>
				</div>
			</li>
			<li class="use">
				<img id="headerUserPortrait" src="http://rep.scientistin.com/default/portrait.png"/>
				<i></i>
				<div class="logout disp menus_top_downs">
					<ul>
						<li><a href="/">首页</a></li>

						<li class="invite-others">
							邀请同事

						</li>
						<li style="border-bottom:1px solid #dbdbdb;"><a href="/user/info.do">账号设置</a></li>
						<li style="border-bottom:1px solid #dbdbdb;"><a href="/user/task.do">上传进度</a></li>

						<li><a href="javascript:void(0);" class="change-sin" onclick="return changeSin('sin');">客户场景</a></li>
						<li><a href="/logout.do">退出</a></li>
					</ul>
				</div>
			</li>
		</ul>
	</div>
</div>
	
	<div class="dialog bp-dialog disp" >
		<h1>提交可转换成果或商业计划书：</h1>
			<div class="inp_form top_ls" style="margin-top:30px;margin-bottom:0;">
				<div class="tit_bp_type">
					<label>请选择提交的内容类型</label>
					<ul>
						<li class="active">可转换成果</li>
						<li>商业计划书</li>
					</ul>
				</div>
				<div class="lo_re_inp_two">
					<div class="lo_re_inp">
						<input type="text" class="tit_bp_title" value="" placeholder="请输入标题" />
					</div>
					<div class="lo_re_inp">
						<input type="text" class="tit_bp_keyword" value="" placeholder="请输入关键词，空格分开多个关键词" />
					</div>
					<div class="lo_re_inp">
						<textarea rows="5" class="tit_bp_topic" placeholder="请输入摘要信息"></textarea>
					</div>
					<div class="lo_re_inp">
						<a href="javascript:;" onclick="bp_upload_image()"><img src="/img/uplas.png" style="width:30px;"/>
						<span class="bp-upload-word-span">上传文件(20MB以内的文件或图片）</span>
						</a>
					</div>
					<div class="clear"></div>
				</div>
				<a class="send">提交</a>
			</div>
		<div class="clear"></div>
	</div>
	
	<form action="/api/bp-upload" enctype="multipart/form-data" method="post" class="bp_file_upload">
		<input type="file" class="hide bp_file" name="file" id="bp-upload-multipart-id" />
	</form>
	
	<div class="top_paosi_yc"></div>
	
	<div class="iframe_notify">
		<div class="iframe_notify_cons">
			
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$(".iframe_notify_btn").click(function(){
				layer.open({
				  type: 2,
				  title: '消息通知',
				  offset:"rb",
				  shadeClose: true,
				  shade: 0.2,
				  scrollbar: false,
				  shift:1,
				  area: ['500px', '100%'],
				  content: '/pc/notify.do' //iframe的url
				});
			})
		})
	
	</script>

	<div class="container">
		<div class="row">
			<div class="col-md-10 ma_center bs_co_ff">
				<div class="clear" style="height:1px;"></div>
	            <div class="form-group res_mm group_lef">
					<table id="mytable" width="90%" class="table">

					</table>

				</div>


			 		<div id="wrapper">
						<div class="page-body">
							<div id="post-container" >
							    <div class="page-container">
							    <form id="fileUpdate" name="fileUpdate" action="" enctype="multipart/form-data" method="post">
							        <input type="hidden" id="iid" name="iid" value="a5586ba1388eee79ea0c365e551d8448">
							        <h1 id="demo"></h1>
									<div id="uploader" class="wu-example">
									    <div class="queueList">
									        <div id="dndArea" class="placeholder">
									            <div class="webuploader-container" id="filePicker">

									            </div>
									        </div>
									    <ul class="filelist">
									    
									    
									    </ul>
									   </div>

									</div>
								  </form>
							    </div>
							</div>
						</div> 
				    </div>
			</div>
		</div>
	</div>		    
    <br/><br/>
    <div style="height:100px;"></div>
    <div class="weui_toptips weui_warn js_tooltips"></div>
    		<div class="footer">
			<p class="foot_our">
				<a href="">加入我们</a>
				<a href="/contact.jsp">联系我们</a>
				<a onclick="layer_full_scroll('http://www.scientistin.com/private.html','隐私声明')" href="javascript:void(0);">隐私声明</a>
				<a onclick="layer_full_scroll('http://www.scientistin.com/contract.html','使用协议')" href="javascript:void(0);">使用协议</a>		
				<a target="_blank" href="/help.jsp">操作说明</a>				
			</p>
			<p>©xxxx（www.xxx.com)</p>
			<p>京ICP备16018789号・xxxxxxx</p>
		</div>
				<!-- 加载等待图 -->
		<div id="loading" style="display:none;">
		    <div class="load-container">
		        <div class="loader">Loading...</div>
		    </div>
		    <div id="loading_fullscreen"></div>
		</div>    
		<script>
		var _hmt = _hmt || [];
		(function() {
		  var hm = document.createElement("script");
		  hm.src = "https://hm.baidu.com/hm.js?4efd335e8a97fc982442c2ff7f53243d";
		  var s = document.getElementsByTagName("script")[0]; 
		  s.parentNode.insertBefore(hm, s);
		})();
		</script>
		
    <script>

    </script>
    <script src="../js/webuploader.js" type="text/javascript" charset="utf-8"></script>
	
	<script src="../js/demo.js" type="text/javascript" charset="utf-8"></script>


<script type="text/javascript">

	$(function () {
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
                //获取全部的用户的信息
				type :"POST",
				dataType :"json",
				url:"/user/getAll",
				success:function (data) {
                    var head = "<tr><th>编号</th><th>姓名</th><th>性别</th><th>电话</th> <th>昵称</th><th>身份</th>"+
                        "<th>用户名</th><th>密码</th><th>操作</th><th>操作</th></tr>";
                    for(var i=0;i<data.length;i++) {
                        var user = data[i] ;
                        var content = "<tr><td>"+user.id+"</td><td>"+user.name+"</td><td>"+
                            user.gender+"</td><td>"+user.phone+"</td><td>"+user.nickname+"</td><td>"+
                            user.identity+"</td><td>"+user.username+"</td><td>"+user.password+"</td><td>"+
                            "<a href='/user/delete?id="+user.id+"'>删除</a></td><td><a>修改</a></td></tr>" ;

                        head += content;

                    }

					document.getElementById("mytable").innerHTML=head ;
                }


			})





    })

	</script>


</body>
</html>
