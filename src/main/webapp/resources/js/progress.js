function survey(item){
  var id = "#" + item; //for label id
  var v = "input[name=" + item + "]"; // 해당 name
  if($(v).is(':checked')){
    $(id).css("background", "#eee");
  }else{
    $(id).css("background", "#fff");
  }
  //sel_country = v;
  //$(".click-check2").css("background-color", "#a8d8d4");
  //document.getElementById(country.id).style.backgroundColor = "#279d93";
}

/* Projress bar */ 

function calc() {
	/*
	var test = 0;
	$("input[name='checkbox']:checked").each(function() {
		test += Number($(this).val()); 
	});*/
	
	var res = 0;
	$(".test").each(function() {
		if($(this).prop("checked") == true) {
			res += Number($(this).val());	
		} 
	});
    return res;
} // end of calc()


function move() {
  var elem = document.getElementById("myBar2");   
  var width = 10;
  var id = setInterval(frame, 10);
  function frame() {
    if (width >= 100) {
      clearInterval(id);
    } else {
      var result = calc();
      width++; 
      elem.innerHTML =   width * 0.1 * result + '%'; //num
      elem.style.width = width * 0.1 * result + '%'; //progress
      result = calc()*10;
      //진단결과에 따른 문구
      if((result>=0) && (result<=20)){
      	$(".notify-result-ment").html("준비가 많이 필요합니다<br> 이너레스트와 쉽고 간편한 준비를 해보시겠습니까?");
      }
      else if((result>20) && (result<=40)){
      	$(".notify-result-ment").html("기초적인 준비가 되었습니다<br>이너레스트와 쉽고 간편한 준비를 해보시겠습니까?");
      }
      else if((result>40) && (result<=60)){
      	$(".notify-result-ment").html("어느정도 준비가 되었습니다<br>이너레스트와 더 완벽한 수출 준비를 해보시겠습니까?");
      }
      else if((result>60) && (result<=80)){
      	$(".notify-result-ment").html("수출 준비가 많이 되었습니다<br>이너레스트와 더 완벽한 수출 준비를 해보시겠습니까?");
      }
      else {
      	$(".notify-result-ment").html("수출 준비가 거의 완벽합니다<br>이너레스트와 합리적인 수출을 진행해 보시겠습니까?");
      }


    }
  }
}  // end of move()
 

/* MJ
  var val1 = Number($("#val1").val()); // input 값을 가져올 때 사용하는 방식
	var val2 = Number($("#val2").val());  
	var val3 = Number($("#val3").val());  
	
	$('input:checkbox[id="checkbox_id"]').attr("checked", true);
	
	var result = val1 + val2 +val3 ;
	$("#result").val(result);    // result 값을 input에 넣을 때 사용하는 방식
	
	console.log(val1); // 6
	console.log(val2); // 6
	console.log(result); // 6
	*/
	

