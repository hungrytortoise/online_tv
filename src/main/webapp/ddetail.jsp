<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>需求详情</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />

	<link rel="shortcut icon" href="../images/favicon.ico">
	<link rel="stylesheet" href="../css/weui.min.css" >
	<link rel="stylesheet" href="../css/style.css" >
	<link rel="stylesheet" type="text/css" href="../css/newmycss.css"/>
	        <!--file upload-->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-fileupload.min.css" />
 
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
<body class="gd_tops" ontouchstart>

	


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
<!-- Waypoints 滚动监听 -->
<script src="../js/jquery.waypoints.min.js"></script>
<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/jquery.dotdotdot.min.js"></script>
<script src="/js/layer/layer.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/style.js" type="text/javascript" charset="utf-8"></script>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript">
var apiBasePath = "/api";
var URL = "/api/header";
var home_url = "/user/home.do";
var bp_upload_url = "";

var bp_uid="5166bfb05818a5dc42b19401b679193c";
$(document).ready(function(){
//权限检查
    $.ajax({
        type: "POST",
        dataType:"json",
        url: "/user/getLoginUsername",
        success:function (data) {
            var idendity = data.idendity ;
            var username = data.username ;
            var owner = "${detail.owner}"
            if ((idendity=='2' && owner==username) || idendity=='0'){
                var ele = document.getElementById("btnInterest")
				ele.style.visibility="visible";
            }

        }

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
	$("#btnInterest").click(function () {
			//获取id
		$.ajax({
            type: "POST",
            dataType:"json",
            url: "/demond/delete",
			data:{id:"${detail.id}"},
			success :function (data) {
				var status = data.status ;
                parent.location.href ="/demand.jsp"
            }
		})
    })



	var search_event =  function(){
		var k = $("#search-entrance-keyword").val();
		if(k === "" || /^(\s)+$/.test(k)){
			return;
		}
		window.location.href="/search/web/result.jsp?type=5&k="+k;
 
	}

	$("#search-entrance-button").on("click", search_event);
	$("#search-entrance-keyword").on("keydown", function(e){
		event.keyCode == 13 && search_event();
	});
	$.ajax({
		type:'POST',
		url:URL,
		dataType:"json",
		cache: false,
		success:function(result){
			var headerFlowNum = result.data.flowCount;//动态未读数量
			 if(headerFlowNum>0){ 
			 	if(headerFlowNum > 99){
			 		headerFlowNum = '+99';
			 	} 
				$("#headerFlowNum").html(headerFlowNum);
				$("#headerFlowNum").addClass("num");
			}else{
				$("#headerFlowNum").removeClass("num");
			}
			var headerMsgNum = result.data.msgCount;//消息未读数量
			if(headerMsgNum>99){headerMsgNum=99;}
			if(headerMsgNum>0){ 
				$("#headerMsgNum").html(headerMsgNum);
				$("#headerMsgNum").addClass("num");
			}else{
				$("#headerMsgNum").removeClass("num");
			}
			var portrait = result.data.portrait;//头像地址
			if(portrait!=null&&portrait!=''){
				if(portrait.indexOf("http")==0){
					$("#headerUserPortrait").attr("src",portrait);
				}else{
					$("#headerUserPortrait").attr("src","http://rep.scientistin.com"+portrait);
				}
				
				
			}
		},
	});	
	$('.invite-others').click(function(event){
		
		show_dialog('.invite-others-dialog');
		var $dialog = $('#dialog')
		$dialog.find('form').on('submit',function(event){
			event.preventDefault();
		});
		$dialog.find('.send').on('click',function(event){
			event.preventDefault();
			var name = $dialog.find('.invite-others-name').val();
			var email = $dialog.find('.invite-others-email').val();
			if(name && /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/.test(email)){
				$.ajax({
	                type: 'POST',
	                url: "/api/invite-to-register",
	                dataType: "json",
	                cache: false,
	                data: {name : name,email : email},
	                beforeSend: function () {
				        $("#loading").show();
				    },
	                success: function (data) {
	                	$("#loading").hide();
	                	if(data.code == 0){
	                		alert('邮件发送成功');
	                		$dialog.trigger('close');
	                	}else{
	                		alert(data.data);
	                	}
	                }
	            });
			}
		})
		return false;
	});
	
	$('.add_bp').click(function(event){
		var bp_type=0;
		show_dialog('.bp-dialog');
		var $dialog = $('#dialog')
		$dialog.find('form').on('submit',function(event){
			event.preventDefault();
		});
		$dialog.find('.tit_bp_type li').on('click',function(event){
			bp_type = $(this).index();
			$dialog.find('.tit_bp_type li').removeClass("active");
			$(this).addClass("active");
		});
		
		
		$dialog.find('.send').on('click',function(event){
			event.preventDefault();
			var title = $dialog.find('.tit_bp_title').val();
			var keyword = $dialog.find('.tit_bp_keyword').val();
			var topic =$dialog.find('.tit_bp_topic').val(); 
			var uploadUrl = bp_upload_url;
			if($.trim(title)==null || $.trim(title).length<1){
				alert("请输入标题");//错误提示
				return false;
			}
			if($.trim(keyword)==null || $.trim(keyword).length<1){
				alert("请输入关键词");//错误提示
				return false;
			}
			if($.trim(topic)==null || $.trim(topic).length<1){
				alert("请输入摘要");//错误提示
				return false;
			}
			$.ajax({
	                type: 'POST',
	                url: "/api/bp-save",
	                dataType: "json",
	                cache: false,
	                data: {'type' : bp_type,'title' : title,'keyword':keyword,'topic':topic,'uploadUrl':uploadUrl,'uid':bp_uid},
	                beforeSend: function () {
				        $("#loading").show();
				    },
	                success: function (data) {
	                	$("#loading").hide();
	                	if(data.code == 0){
	                		alert(data.data);
	                		$('.bp-upload-word-span').text('上传文件(20MB以内的文件或图片）'); 
	                		$dialog.trigger('close');
	                	}else{
	                		alert(data.data);
	                	}
	                }
	            });
		}) 
		return false;
	});
	
    /* 上传文件 */
	$('.bp_file').change(function(e) {
		$('.bp_file_upload').ajaxSubmit({
			success: function (result) { 
				bp_upload_url=result;
				$('.bp-upload-word-span').text('上传成功，点击更换'); 
			}
		 })
	})
	
});	

	
function bp_upload_image(){
	$('.bp_file').click();
}

function changeSin(sen){
	$.ajax({
        type: 'POST',
        url: "/api/change-sin",
        dataType: "json",
        cache: false,
        data: {'s':sen},
        beforeSend: function () {
	        $("#loading").show();
	    },
        success: function (data) {
        	$("#loading").hide();
        	if(data.code == 0){
        		   window.location.href="/"; 
          	}else{
        		alert(data.data);
        	}
        }
    });
     return false;	
}

</script>
<link rel="stylesheet" type="text/css" href="../css/shake.css"/>
<link rel="stylesheet" type="text/css" href="/js/perfect-scrollbar-0.4.1.with-mousewheel.min.js"/>
<script src="/js/perfect-scrollbar-0.4.1.with-mousewheel.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/layer/layer.js" type="text/javascript" charset="utf-8"></script>   
		<div class="dialog invite-others-dialog disp" >
			<h1>邀请同事加入科学家在线ScientistIn：</h1>
			<form action="" method="post">
				<div class="inp_form top_ls" style="margin-top:30px;margin-bottom:0;">
					<div class="lo_re_inp_two">
						<div class="lo_re_inp">
							<!-- <label><span class="til">姓名 : </span></label> -->
							<input type="text" class="invite-others-name" value="" placeholder="请输入同事姓名" />
						</div>
						<div class="lo_re_inp">
							<!-- <label><span class="til">邮箱 : </span></label> -->
							<input type="text" class="invite-others-email" value="" placeholder="请输入同事邮箱" />
						</div>
						<div class="clear"></div>
					</div>
					<a class="send">发送</a>
				</div>
			</form>
			
			<div class="clear"></div>
		</div>
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
		<div class='top_paosi'>
		<div class="head_cons">
			<a class="navbar-brand" href="/">网站标题（自定义）</a>
			<ul class="left_tab_ul">
				<li><a href="/" class="">自定义<span id="headerFlowNum" style="left:41px;"></span></a></li>
				<li><a href="/" class=" xq_acti">自定义</a></li>
				<li><a href="/" class="active">自定义</a></li>

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

				</ul>
			</div>
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
				<h1 class="issue_h1"><i class="btn btn-success tit_icons tit_icons_">节能环保</i>${detail.target}
				<div class="bdsharebuttonbox" data-tag="share_1" style="float:right;margin-left:20px;margin-top: -5px">
					<em style="float:left;color:#999;line-height:32px;font-size:16px;padding-top:5px;">分享到：</em><a class="bds_weixin" data-cmd="weixin"></a>
				</div>
				
					
					<a id="btnInterest" class="btn btn-danger" style="float:right;visibility:hidden ;" >删除</a>
					
				
				</h1>
				<div class="iss_floor1 iss_floor2">
					<div class="row">
						<div class="col-md-4 t_bold">
							<span class="iss_company">${detail.company}</span>
						</div>
						<div class="col-md-4">
							<span class="iss_time">${detail.time} </span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<font class="t_bold">关键词：</font>${detail.keyword}
						</div>
						<div class="col-md-2">
							<font class="t_bold">客户类型：</font> ${detail.cKind}
						</div>
						<div class="col-md-2">
							<font class="t_bold">解决期限：</font>${detail.term}
						</div>
						<div class="col-md-2">
							<font class="t_bold">最佳预算：</font>${detail.minMoney}
						</div>
						<div class="col-md-2">
							<font class="t_bold">预算上限：</font>${detail.maxMoney}
						</div>
					</div>

					<div class="row">
						<div class="col-md-2 t_bold">
							需求详情：
						</div>
						<div class="col-md-10 no_pa_left">
						${detail.data}

						</div>
					</div>
					<div class="row">
						<div class="col-md-2 t_bold">
							技术指标：
						</div>
						<div class="col-md-10 no_pa_left">
						${detail.target}
						</div>
					</div>

					<div class="row">
						<div class="col-md-2 t_bold">
							处理进度：
						</div>
						<div class="col-md-10 no_pa_left">
							<div class="speed_progress">
								<ul>
							
							
								  <li class="active">
								  	<span class="ico"><i class="glyphicon glyphicon-file "></i>
								 
								  	</span>
								  	<span class="pro_name">提交需求</span>
								  	<span class="pro_time">2016-11-24 20:43</span>
								  	
								  	<span class="lins"></span>
								  </li>
							
							
								  <li class="active">
								  	<span class="ico"><i class="glyphicon glyphicon-saved"></i>
								 
								  	</span>
								  	<span class="pro_name">需求确认</span>
								  	<span class="pro_time">2016-11-24 21:17</span>
								  	<a target="_blank" style="color:#0F63A8;" href="/issue/showMatchesInDB.do?issueid=892310e90692fb50d32a246f9fe4f162">查看匹配专家</a> 
								  	<span class="lins"></span>
								  </li>
							
							
							 	<li>
								 	<span class="ico"><i class="glyphicon glyphicon-pushpin"></i>
								 	</span>
									<span class="pro_name">需求签约</span>
									<span class="lins"></span>
								</li> 
							
							
							 	<li>
								 	<span class="ico"><i class="glyphicon glyphicon-wrench"></i>
								 	</span>
									<span class="pro_name">需求服务</span>
									<span class="lins"></span>
								</li> 
							
							
							 	<li>
								 	<span class="ico"><i class="glyphicon glyphicon-ok"></i>
								 	</span>
									<span class="pro_name">需求关闭</span>
									<span class="lins"></span>
								</li> 
							
								</ul>
							</div>
						</div>
					</div>
					
					
				</div>
				
			</div>
		</div>
	</div>
	<div style="height:100px;"></div>
    		<div class="footer">
			<p class="foot_our">
				<a href="">加入我们</a>
				<a href="/contact.jsp">联系我们</a>
				<a onclick="layer_full_scroll('http://www.scientistin.com/private.html','隐私声明')" href="javascript:void(0);">隐私声明</a>
				<a onclick="layer_full_scroll('http://www.scientistin.com/contract.html','使用协议')" href="javascript:void(0);">使用协议</a>		
				<a target="_blank" href="/help.jsp">操作说明</a>				
			</p>
			<p>©xx网站（www.xxx.com)</p>
			<p>京ICP备16018789号・xxxxxxxx</p>
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
		
    <div class="file_images hide">
    <!-- 图片 -->
    <div class="file_1">
        <div class="fileupload fileupload-new" data-provides="fileupload">
            <div class="fileupload-new thumbnail" style="width: 100px; height:100px;">
          		<img src="http://www.placehold.it/100x100/EFEFEF/AAAAAA&amp;text=无图片" alt="" />
            </div>
            <div class="fileupload-preview fileupload-exists thumbnail" style="width: 100px;height: 100px;"></div>
            <div class="file_btns">
                <span class="btn-file">
                <span class="fileupload-new"><i class="fa fa-paper-clip"></i><i class="glyphicon glyphicon-picture"></i></span>
                <span class="fileupload-exists"><i class="fa fa-undo"></i><i class="glyphicon glyphicon-refresh"></i></span>
                <input type="file" class="default imgs_btn_up" name="cover" accept="image/*"/>
                </span>
             	 <a href="#" class="btn fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i><i class="glyphicon glyphicon-trash"></i></a>
            </div>
        </div>
        <br/>
   </div>
   </div>
   <!-- 文件 -->
   <div class="file_file hide">
   <div class="file_1">
        <div class="fileupload fileupload-new" data-provides="fileupload">
            <div class="fileupload-new thumbnail" style="width: 100px; height:100px;">
          		<img src="http://www.placehold.it/100x100/EFEFEF/AAAAAA&amp;text=无文件" alt="" />
            </div>
            <div class="fileupload-preview fileupload-exists thumbnail" style="width: 100px;height: 100px;"></div>
            <div class="file_btns">
                <span class="btn-file">
                <span class="fileupload-new"><i class="fa fa-paper-clip"></i><i class="glyphicon glyphicon-folder-open"></i></span>
                <span class="fileupload-exists"><i class="fa fa-undo"></i><i class="glyphicon glyphicon-refresh"></i></span>
                <input type="file" class="default imgs_btn_up" name="cover"/>
                </span>
             	 <a href="#" class="btn fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i><i class="glyphicon glyphicon-trash"></i></a>
            </div>
        </div>
        <br/>
   </div>
   </div>
   
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg bt_layes hide" data-toggle="modal" data-target="#myModal">
此需求已经被关闭
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="">
  <div class="modal-dialog" style="margin-top: 25%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
        <h4 class="modal-title" id="myModalLabel">该需求已解决，为您推荐相关领域其他需求</h4>
      </div>
      <div class="modal-body issue_prod_cos">
      	<!-- <h1>该需求已解决，为您推荐相关领域其他项目</h1> -->
      	<div class="issue_prod_cos_ins">
      	
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>

   
    <!--file upload-->
<script type="text/javascript" src="/js/bootstrap-fileupload.min.js"></script>

    <script type="text/javascript">

	$(function(){
		var images_html = $(".file_images").html();
		var file_html = $(".file_file").html();
		
		/* 图片上传 */
		$(".upload_files_images").click(function(){
			$(".list_cons_ne").append(images_html);
			$(".list_cons_ne .file_1:last").find(".imgs_btn_up").click();
		})
		/* 文件上传 */
		$(".upload_files_file").click(function(){
			$(".list_cons_ne").append(file_html);
			$(".list_cons_ne .file_1:last").find(".imgs_btn_up").click();
		})
		
		/* 回复 评论 */
		$(".reply_list_this").click(function(){
			var escId = $(this).attr("escId");
			$("#pid").val(escId);
			$("html,body").animate({scrollTop:$("#reply_containers").offset().top-80},500);
			$(".qx_replay").show();
			$(".buts_replay").val("提交回复");
		})
		$(".qx_replay").click(function(){
			$("#pid").val("");$(".buts_replay").val("提交评论");
			$(".qx_replay").hide();
		})
		
		/* 删除评论  */
		$(".del_list_this").click(function(){
			loading_layer_show();
			var escId = $(this).attr("escId");
			var iid = "892310e90692fb50d32a246f9fe4f162";
			$.ajax({
		        type: 'POST',
		        url: "/api/remove-process",
		        dataType: "json",
		        cache: false,
		        data: {'iid':iid ,'pid': escId},
		        success: function(data){
             	   console.log(data);
                    if(data.code==0){
                 	   //layer_tips(data.data);
                 	   window.location.href="/pc/issueInfo.do?reply=1&iid=892310e90692fb50d32a246f9fe4f162";
                    }else{
                 	   loading_layer_hide();
                 	   layer_tips(data.data);
                    }
                },
                error: function (e) {
             	   loading_layer_hide();
             	   layer_tips('信息同步失败,请重试');
                }
		    });
            loading_layer_hide();
			return false;
		}) 
		
		  $('.claim-issue').on('click',function(){
			  	loading_layer_show();
				var iid = "892310e90692fb50d32a246f9fe4f162";
				$.ajax({
			        type: 'POST',
			        url: "/api/claim-issue",
			        dataType: "json",
			        cache: false,
			        data: {'iid':iid},
			        success: function(data){
	             	   console.log(data);
	                    if(data.code==0){
	                    	  //去掉按钮
	                    	  $(".claim-issue").remove();
	                    	  $('.abandon-issue').remove();
	                    	  loading_layer_hide();
	                    }else{
	                 	   loading_layer_hide();
	                 	   layer_tips(data.data);
	                    }
	                },
	                error: function (e) {
	             	   loading_layer_hide();
	             	   layer_tips('信息同步失败,请重试');
	                }
			    });
				return false;
			});
		   $('.abandon-issue').on('click',function(){
			   		loading_layer_show();
					var iid = "892310e90692fb50d32a246f9fe4f162";
					$.ajax({
				        type: 'POST',
				        url: "/api/abandon-issue",
				        dataType: "json",
				        cache: false,
				        data: {'iid':iid},
				        success: function(data){
		             	   console.log(data);
		                    if(data.code==0){
		                 	   //去掉按钮
		                    	 $(".claim-issue").remove();
		                    	  $('.abandon-issue').remove();
		                    	  loading_layer_hide();
		                    }else{
		                 	   loading_layer_hide();
		                 	   layer_tips(data.data);
		                    }
		                },
		                error: function (e) {
		             	   loading_layer_hide();
		             	   layer_tips('信息同步失败,请重试');
		                }
				    });
					return false;
				});
		$(".open_others").click(function(){
			if($(this).find("i").hasClass("glyphicon-chevron-down")){
				$(this).find("i").addClass("glyphicon-chevron-up").removeClass("glyphicon-chevron-down");
				$(".infos_lus li.yc_hides").removeClass("hide");
			}else{
				$(this).find("i").addClass("glyphicon-chevron-down").removeClass("glyphicon-chevron-up");
				$(".infos_lus li.yc_hides").addClass("hide");
			}
		})
		
		$(".buts_replay").click(function(){
			if($.trim($("#remark").val()) == null || $.trim($("#remark").val()).length<1){
				layer_tips('请输入提交的内容');
				return false;
			}
			loading_layer_show();
			$("#report-form").submit();
		})
		
	});


$(document).ready(function(){

	$("#btnInterest").click(function(){
		//如果没登录则跳转到登录
		
		sendInterest(); //感兴趣
		
		
	});
});



    </script>
    
<script>
	window._bd_share_config = {
		common : {
			bdText : "科学家在线 ScientistIn的项目需求：需要小规模的、可应用于工业企业内部减量使用的小型水处理设备技术",//自定义分享内容	
			bdDesc : "科学家在线：需要小规模的，可以应用于工业企业内部减量使用的小型水处理设备技术，每天10吨左右工业废水的。处理废水包括：有机废水、清洗溶剂、光阻、HMDS、NMP、DESO、PGME、MPA、DMF、TMAH、界面活性剂、塑化剂、新兴水污染物等. 无机废水：含氟废水、氨氮废水、重金属废水、酸碱废水、氰化物、硝酸盐、磷酸盐、砷化物、硫化物、H2O2废水、混合型废水等，设备量产后价格200万内。设备研发或采购皆可，需要中试以上水平。给出现有的三组水，氨氮含量： A组（COD 2101  氨氮 1050 总氮1352）、B组（COD 2020  氨氮 1335 总氮1544）、C组（COD 1293  氨氮 1841 总氮2210）",//自定义分享摘要	
			bdUrl : "http://www.scientistin.com/h5/issueInfoTemp.do?iid=892310e90692fb50d32a246f9fe4f162",//自定义分享url地址 	
			bdPic : "http://www.scientistin.com/img/logonew2.png"
		},
		share : [{
			"bdSize" :32
		}],
		image : [{
			viewType : 'list',
			viewPos : 'top',
			viewColor : 'black',
			viewSize : '32',
			viewList : ['weixin']
		}],
		selectShare : [{
			"bdselectMiniList" : ['weixin']
		}]
	}
	with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
</script>

    
</body>
</html>
