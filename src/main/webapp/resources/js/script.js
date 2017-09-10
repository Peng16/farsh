//菜单栏的显示
$("#banner_menu_wrap").children().hover(function(){
    $(this).css("background","#0CBBEF");
    $(this).children(".banner_menu_content").css("border","1px solid #F0F0F0").show();
},function(){
    $(this).css("background","none");
    $(this).children(".banner_menu_content").css("border","0px solid #F0F0F0").hide();
});
//轮播
var pic = $("#big_banner_pic li");//获取图片
var left = $("#big_banner_wrap #big_banner_change_wrap #big_banner_change_prev");//获取左按钮
var right = $("#big_banner_wrap #big_banner_change_wrap #big_banner_change_next");//获取右按钮
var btn = $("#big_banner_wrap #big_banner_change_wrap div");//获取左右按钮
var _index = 0;
pic.hover(function(){
	btn.show();
	 },function(){
		btn.hide();
		 })
btn.hover(function(){
	btn.show();
	 },function(){
		btn.hide();
		 })
function zone(_index){
	 pic.eq(_index).fadeIn().siblings().fadeOut();
	 }
left.click(function(){
	 _index++;
	 if(_index==pic.length){
		 _index=0;
		 }
	 zone(_index);
	 })
right.click(function(){
	_index--;
	if(_index<0){
		_index=pic.length-1;
		}
	zone(_index);
	})
setInterval(function(){//自动切换 3秒切换一次
	 _index++;
	 if(_index==pic.length){
		 _index = 0;
		 }
		zone(_index);
	 },3000)

$("#big_menu").children().hover(function(){
   
    $(this).children("#big_menu_content").show();
},function(){
   
    $(this).children("#big_menu_content").hide();
});
 