
$(document).ready(function() {

		//총구매금액
		var total = parseInt($('#total').text());
   		
   		 var liArray = [];
        $("#option-list").change(function(){

        	var selected = $(this).find(":selected").text()
        	var selected_val = parseInt($(this).find(":selected").val())
        	var selected_id = $(this).find(":selected").attr("id");
        		
        	//옵션이 이미 선택되었는지 확인
        	if(liArray.length >0){       		
        		if(liArray.includes(selected)){
        			alert('이미 선택하셨습니다.');
        		}
        		else{
        			$(".selec-product").append(
        					'<li class = "selec-wrapper"><p class = "selec-each"></p><p id = "each-price">0</p><div class="selec-count"><div class="add-btn input-group mb-3" style="max-width: 109px;"><div class="input-group-prepend"><button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button></div><input type="text" class="form-control text-center count" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1"><div class="input-group-append"><button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button></div></div></div><button class = "remove"><i class="fas fa-times"></i></button></li>');
        			liArray.push(selected)
        			
        			var temp = 'option_'+selected_id;
        			$('.selec-product li:last-child').attr('id',temp);
        			
	        		$('#'+temp+' '+'.selec-each').text(selected);
	        		$('#'+temp+' '+'#each-price').text(selected_val);
	        		//총가격에 +       		
	        		total += selected_val;
	        		$('#total').text(total)
        		}
        	}
        	//옵션을 처음 선택하는 경우
        	else{
        		$(".selec-product").append('<li class = "selec-wrapper"><p class = "selec-each"></p><p id = "each-price">0</p><div class="selec-count"><div class="add-btn input-group mb-3" style="max-width: 109px;"><div class="input-group-prepend"><button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button></div><input type="text" class="form-control text-center count" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1"><div class="input-group-append"><button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button></div></div></div><button class = "remove"><i class="fas fa-times"></i></button></li>');
        		liArray.push(selected)
        		//$('.selec-product li:last-child').addClass("option_"+nums);
        		var temp = 'option_'+selected_id;
        		$('.selec-product li:last-child').attr('id',temp);
        		
        		$('#'+temp+' '+'.selec-each').text(selected);
        		$('#'+temp+' '+'#each-price').text(selected_val);
        		//총가격에 +       		
        		total += selected_val;
        		$('#total').text(total)
        	}
		});
		//선택 상품 개수 
        var sitePlusMinus = function() {
			$(document).on("click",".js-btn-minus",function(e){
			e.preventDefault();
				if ( $(this).closest('.input-group').find('.form-control').val() != 0  ) {
					$(this).closest('.input-group').find('.form-control').val(parseInt($(this).closest('.input-group').find('.form-control').val()) - 1);
					//총 가격 계산 -
					total -= parseInt($(this).closest('.selec-wrapper').find('#each-price').text())
					$('#total').text(total)

				} else {
					$(this).closest('.input-group').find('.form-control').val(parseInt(0));
				}
			});
			$(document).on("click",".js-btn-plus",function(e){
			e.preventDefault();
				$(this).closest('.input-group').find('.form-control').val(parseInt($(this).closest('.input-group').find('.form-control').val()) + 1);
				// 총 가격 계산 +
				total += parseInt($(this).closest('.selec-wrapper').find('#each-price').text())
				$('#total').text(total)

			});

		};
		sitePlusMinus();

        //선택한 상품 선택 해제
		var removeitem = function(){
			$(document).on("click","button.remove",function(e){
				var removeitem = $(this).parents('li').attr('id');		
				var remove = $('#'+removeitem +' '+'.selec-each').text();
				//alert(remove)
				var filteredAry = liArray.filter(function(e) { return e !== remove });
				liArray = filteredAry;

				//총 가격 계산 -
				var count = $(this).closest('.selec-wrapper').find('.form-control').val()
				var price = parseInt($(this).closest('.selec-wrapper').find('#each-price').text())
				var cal = price*count;
				total -= cal;
				$('#total').text(total)
				$("#"+removeitem).remove();
				/*function calc(this){
					var count = this.closest('.selec-wrapper').find('.form-control').val()
					var price = parseInt($(this).closest('.selec-wrapper').find('#each-price').text())
					var cal = price*count;
					alert(count);
				};
				calc($(this));*/				
			});
		};
		removeitem();

		var price = function(){

		};

		$(".buy").on("click", function(){
			
			var $lists = $('.selec-product li');
			if($lists.length < 1) {
				alert("옵션을 선택해주세요");
				return;
			}
			
			var ajsonArray = new Array();
			$lists.each(function(){
				var pd_num = $(this).attr("id").split("_")[1];
				var quantity = $(this).find(".form-control").val();
								
				var ajson = new Object();
				ajson.pd_num = pd_num;
				ajson.quantity = quantity;
				
				ajsonArray.push(ajson);
				/*var inputHtml = 
		    	'<input type="hidden" name="pd_num" value="'+pd_num+'">'+
		    	'<input type="hidden" name="quantity" value="'+quantity+'">'

		    	$("#shopForm").html(inputHtml);*/
			});
			
			var sjson = JSON.stringify(ajsonArray);
			var bjson = btoa(sjson);
			location.href="/shop/checkout_s?data="+bjson;
		});
		
		$(".cart").on("click", function() {
			var $lists = $('.selec-product li');
			if($lists.length < 1) {
				alert("옵션을 선택해주세요");
				return;
			}
			
			var ajsonArray = new Array();
			$lists.each(function(){
				var pd_num = $(this).attr("id").split("_")[1];
				var quantity = $(this).find(".form-control").val();
								
				var ajson = new Object();
				ajson.pd_num = pd_num;
				ajson.quantity = quantity;
				
				ajsonArray.push(ajson);
			});
			
			var jsonString = JSON.stringify(ajsonArray);
			$.ajax({
				url:"/ajax/cart/create",
				type:"post",
				contentType:"application/json",
				data:jsonString,
				dataType:"text"
			}).done(function(){
				alert("추가했습니다");
				return;
			}).fail(function(){
				alert("SERVER ERROR");
				return;
			});
		});
		//

});



window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 900 || document.documentElement.scrollTop > 900) {
        //document.getElementById("subinfo").style.display = "block";
        //$(".subinfo").animate({height: "85px"});
        $("#subinfo").slideDown("slow");
    } else {
        //document.getElementById("subinfo").style.display = "none";
        //$(".subinfo").animate({height: "10px"});
        $("#subinfo").slideUp("slow");
    }
}


