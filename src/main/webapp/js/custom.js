/**
 * Created by Lichong on 6/10/16.
 */

/**
 * checkbox插件
 * 使用方法:  $(".custom_checkbox").custom_checkbox();
 */

$.fn.custom_checkbox = function(){
    var _this = $(this);
    _this.on("click",function(){

        if (_this.hasClass('unchecked') || _this.hasClass('disabled')) {
            _this.removeClass('unchecked disabled').addClass('checked');
        } else {
            _this.removeClass('checked').addClass('unchecked');

        }

    });
};




/**
 * @author mchange
 * @description 该控件用于对输入的内容进行字数统计和字数限制。
 * @property {int} [limitCount] [限制的字数]
 * @property {string} [msg] [超过限制的字数所提示的文字]
 * @email：tzzhongwen@gmail.com
 * @declare:个人练习，简陋之极，仅供参考
 * 2012-05-02
 */
jQuery.fn.extend({
    limitWord:function(limitCount,msg){
        var flag = 0;
        $("#msg").text(limitCount+"/120字");
        $(this).children().filter(".limitedContent").bind('keyup input paste',function(){
            var contentLength = $(this).val().length;
            if(limitCount >= contentLength){
                flag = limitCount - contentLength;
                $("#msg").text(flag+"/120字");
            }else{
                $(this).val($(this).val().substring(0,limitCount));
                $("#msg").text(msg);
            }

        });
    }
});




/**
 * 发送短信倒计时
 *
 * @class $.fn.sendSms
 * @extends jQuery
 * @requires jQuery 1.0
 *
 *  @param {Object} optionsSms 传入的配置对象
 *  @param {Number}optionsSms.time=60 倒计时时间
 *  @param {Boolean}optionsSms.autoStart=true  是否自动开始
 *  @param {String}optionsSms.recentText  倒计时结束时重新发送文案
 *
 *      @example
 *      var optionsSms = {
     *          time:60
     *      };
 *      $(".sms-button").sendSms(optionsSms);
 *
 * @returns {Object} {start: start, clear: clear}
 */
$.fn.sendSms = function(options){
    options = $.extend({time:60,autoStart:true,recentText:"重新发送"},options);
    var $this = this;
    $this.attr("disabled","disabled").addClass("gray").removeClass('re-send-sms-hover');
    var _counter=null;//for debug;

    //处理逻辑
    var count = function(){
        $this.val("   "+options.time+"  ");
        if(options.time != 0){
            _counter = setTimeout(function(){
                options.time --;
                //$this.val(options.time + "秒后重新发送");
                $this.val("   "+options.time+"   ");
                count();
            },1000);
        }else{
            $this.val(options.recentText);
            $this.removeAttr("disabled").removeClass("gray").addClass("re-send-sms-hover");
            $this.siblings(".form-msg").text("");
        }
    };

    if(options.autoStart){
        count();
    }

    // 如果 autoStart 为true，就不要再调用 start方法。
    var methods = {
        start:function(){
            count();
        },
        clear:function(){
            clearTimeout(_counter);
            $this.val("获取验证码");
            $this.removeAttr("disabled").removeClass("gray");
            $this.siblings(".form-msg").text("");
        }
    };
    return methods;
};


/**
 * 检测手机号是否正确
 * @param p_mobile
 * @returns
 */
function checkouMobile(p_mobile){
	return /^1\d{10}$/.test(p_mobile);
}
