
var windowScroll = function() {
	$(window).scroll(function() {

		var scrollPos = $(this).scrollTop();
	/*	if ( $('body').hasClass('fh5co-mobile-menu-visible') ) {
			$('body').removeClass('fh5co-mobile-menu-visible');
		}*/

		if ( $(window).scrollTop() > 70 ) {
			$('#zhiye-header').addClass('zhiye-scrolled');
		} else {
			$('#zhiye-header').removeClass('zhiye-scrolled');
		}


		/*// Parallax
		$('.fh5co-hero-intro').css({
      'opacity' : 1-(scrollPos/300)
    });*/

	});
};

$(function(){

})

;(function () {
	
	'use strict';

	// iPad and iPod detection	
	var isiPad = function(){
		return (navigator.platform.indexOf("iPad") != -1);
	};

	var isiPhone = function(){
	    return (
			(navigator.platform.indexOf("iPhone") != -1) || 
			(navigator.platform.indexOf("iPod") != -1)
	    );
	};
	
	var animateWayPoint = function() {
		if ( $('#animate_images').length > 0 ) {
			$('#animate_images').waypoint( function( direction ) {
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					setTimeout(function(){
						$('#animate_images .to-animate').each(function( k ) {
							var el = $(this);
							setTimeout ( function () {
								el.addClass('bounceIn animated');
							},  k * 200, 'easeInOutExpo' );
						});
					}, 200);
					$(this).addClass('animated');
				}
			} , { offset: '80%' } );
		}
	};
	
	var animateWayPoint2 = function() {
		
		if ( $('#animate_images2').length > 0 ) {
			$('#animate_images2').waypoint( function( direction ) {
				console.log(direction)
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					setTimeout(function(){
						$('#animate_images2 .to-animate').each(function( k ) {
							var el = $(this);
							setTimeout ( function () {
								el.addClass('lightSpeedIn animated');
							},  k * 200, 'easeInOutExpo' );
						});
					}, 200);
					$(this).addClass('animated');
				}
			} , { offset: '80%' });
		}
	};
	
	
	var animateWayPoint3 = function() {
		if ( $('#animate_images3').length > 0 ) {
			$('#animate_images3').waypoint( function( direction ) {
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					setTimeout(function(){
						$('#animate_images3 .to-animate').each(function( k ) {
							var el = $(this);
							setTimeout ( function () {
								el.addClass('tada animated');
							},  k * 200, 'easeInOutExpo' );
						});
					}, 200);
					$(this).addClass('animated');
				}
			} , { offset: '80%' } );
		}
	};
	
	$(function(){
		animateWayPoint();
		animateWayPoint2();
		animateWayPoint3();
	})

}());

/* 弹出提示 */
function show_tips(obj){
	$(".tips_btn_modal .modal-body").text(obj)
	$("#tips_btn").click();
	setInterval(function(){
		$(".tips_btn_modal .close").click();
	},3000)
}

/* 弹出提示 */
function layer_tips(obj){
	$(".tips_btn_modal .modal-body").text(obj)
	$("#tips_btn").click();
	setInterval(function(){
		$(".tips_btn_modal .close").click();
	},3000)
};
function error_tips(obj){
	$(".js_tooltips").show().text(obj);
	setTimeout(function (){
        $('.js_tooltips').hide();
    }, 3000);
}
function loading_layer_show(){
	$("#loadingToast").show();
}

function loading_layer_hide(){
	$("#loadingToast").hide();
}
//验证手机号码
function checkSubmitPhone(obj) {
	if ($.trim(obj) == "") {
		return false;
	}
	if (!obj.match(/^1([23578])\d{9}$/)) {
		return false;
	}
	return true;
};


/* 通用部分 （防止error） */
function layer_full_scroll(obj,obj_title){
	var obj_title = obj_title || "信息";
	//弹出即全屏
	var index = layer.open({
	  type: 2,
	  title:obj_title,
	  content:obj,
	  area: ['300px', '195px'],
	  maxmin: true
	});
	layer.full(index);
}

$(".tips_inf").tooltip();
