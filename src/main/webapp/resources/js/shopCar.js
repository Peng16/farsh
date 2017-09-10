//全选
		var accut = $("#uAccount").text();
		 $("#all").click(function(){
			    var sum = 0.00;
				var amount = 0;
				var checkBox = $("input[name='check']");
				if (this.checked) {
					 for(var i=0;i<checkBox.length;i++){
						 checkBox[i].checked=true;
						 var sumPrice = $("#f5"+i+"");
						 var price = sumPrice.html();
						 sum += parseFloat(price);
						 amount++;
					 }
				} else {
					$("input[name='check']").each(function(){this.checked=false;}); 
				}
				$("#payMoney").html("<span>"+sum+"</span>");
				$("#choiceAmount").html("<span>"+amount+"</span>");
	       });
		 //选择任意的全选框
		$("input[name='check']").click(function(){
			var sum = 0.00;
			var amount = 0;
			var checkBox = $("input[name='check']");
			 for(var i=0;i<checkBox.length;i++){
				 var sumPrice = $("#f5"+i+"");
				 var price = sumPrice.html();
		    	 if(checkBox[i].checked){
		    		 checkBox[i].checked = true;
		    		 sum += parseFloat(price);
		    		 amount++;
		    	 }
		    	 
		    	 if (checkBox[i]==false) {
		    		 sum -= parseFloat(price);
				}
		     }
			 
		     $("#payMoney").html("<span>"+sum+"</span>");
			 $("#choiceAmount").html("<span>"+amount+"</span>");
		 });
		 
		var suball = $("input[name='check']");
		suball.click(function(){
			$("#all").prop("checked",suball.length == suball.filter(":checked").length?true:false);
		});
		
		//获取数量
		var d = parseInt($("#ind").val());
		for(var i=0;i<d;i++){
			var checkB ="check"+i;
			var checkBox = $("#"+checkB);
			var textBox = "textBox+" + parseInt(checkBox.val());
			var amut = $("input[name='"+textBox+"']");
			var minus = "minus+"+ parseInt(checkBox.val());
			var min = $("input[name='"+minus+"']");
			amut.val(parseInt(amut.val()));
			if(parseInt(amut.val()) == 1){
				min.attr('disabled',true);
			}
			var aname="addAmount+"+i; 
			var addAmount = $("input[name='"+aname+"']");
			addAmount.click(function(){
				var arr = $(this).attr("name").split("+");
				var textBox = "textBox+" + parseInt(arr[1]);
				var minus = "minus+"+ parseInt(arr[1]);
				var amut = $("input[name='"+textBox+"']");
				var min = $("input[name='"+minus+"']");
				amut.val(parseInt(amut.val()) + 1);
				if(parseInt(amut.val()) != 1){
					min.attr('disabled',false);
				}
				changeAmount(checkBox,amut.val(),arr[1]);
			});
			var minuss = "minus+"+ i;
			var minn = $("input[name='"+minuss+"']");
			minn.click(function(){
				var arr =$(this).attr("name").split("+");
				var textBox = "textBox+" + parseInt(arr[1]);
				var minus = "minus+"+ parseInt(arr[1]);
				var amut = $("input[name='"+textBox+"']");
				var min = $("input[name='"+minus+"']");
				amut.val(parseInt(amut.val()) - 1);
				if(parseInt(amut.val()) == 1){
					min.attr('disabled',true);
				}
				changeAmount(checkBox,amut.val(),arr[1]);
			});
			
		}
		//checkAllBox
		 
		//改变数量
		function changeAmount(checkBox,amount,sid){
			var checkB ="check"+sid;
			var checkBox = $("#"+checkB);
			var id = checkBox.val();
			/*alert(sid+"  sid");
			alert(id+"  id");*/
			if(checkBox.checked=true){
				$.post("Scart/changeAmount",{"amount":amount,"sid":id},function(response){
					var sumPrice = $("#f5"+sid+"");
					 alert(response.sumprice);
				 	 sumPrice.html(response.sumprice);
				 	$("#payMoney").html("<span>"+sum+"</span>");
				    
				});
			}else{
				$.post("Scart/changeAmount",{"amount":amount,"sid":id},function(response){
					var sumPrice = $("#f5"+sid+"");
					 alert(response.sumprice);
				 	 sumPrice.html(response.sumprice);
				});
			}
		}	 
