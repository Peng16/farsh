var Bproduct = {
		URL:{
			now:function(){
				return 'Product/addproduct';
			}
		},
	detail:{
		init:function(params){
			$.get(Bproduct.URL.now(),{},function(){
				
			});
		}
	}
}