//13.mypage tab 

$(document).ready(function(){ 
$(".btn-tab-menu li").click(function(){
    
    var list = $(this).index();
    
    $(".tab-wrap ul").hide();
    $(".tab-wrap ul").eq(list).show();
    
    $(".btn-tab-menu li").children("a").removeClass("on-tab");
    $(this).children("a").addClass("on-tab")
});
    


});


// transportation selection 
//trans_type 전역변수 선언
var trans_type = "";
  function myFunction(trans){
  var v = document.getElementById(trans.id).value;
  trans_type = v;
  $(".click-check").css("background-color", "#a8d8d4");
  document.getElementById(trans.id).style.backgroundColor = "#279d93";
  //$(".selectbox_sub").prop("selectedIndex", 0);
  $(".selectbox_sub").hide();
  $("#selectbox_"+v).show();

}
//country 전역변수 선언
var sel_country = "";
  function myFunction2(country){
  var v = document.getElementById(country.id).value;
  sel_country = v;
  $(".click-check2").css("background-color", "#a8d8d4");
  document.getElementById(country.id).style.backgroundColor = "#279d93";
}

//카테고리 선택창
var productSelc = {};
productSelc['향수 및 화장수'] = ['향수', '화장수'];
productSelc['기초화장품,매니큐어'] = ['입술화장제품류', '눈화장제품류', '메니큐어 및 페디큐어', '기타(분말 압축포함)', '(기초화장품)기타'];
productSelc['두발용 제품'] = ['샴푸', '(두발용)기타'];
productSelc['면도용 제품'] = ['면도용 제품류'];
productSelc['목욕용 제품'] = ['목욕용 제품류'];
productSelc['인체용 탈취 제품'] = ['인체탈취제 및 내발한제'];
productSelc['탈모제와 기타 제조 향료'] = ['실내용 가향 또는 방취조제품'];
productSelc['구분되어 있지 않은 화장품'] = ['(구분되지않은화장품)기타'];
productSelc['비누, 종이비누'] = ['비누, 종이비누 등', '비누, 유기계면 활성화 제품과 조제품(고체)', '기타 형상의 비누'];

var productSelc2 = {};
productSelc2['향수'] = ['선택 없음'];
productSelc2['화장수'] = ['선택 없음'];

productSelc2['입술화장제품류'] = ['립스틱', '기타'];
productSelc2['눈화장제품류'] = ['아이셰도우', '기타'];
productSelc2['메니큐어 및 페디큐어'] = ['네일에나멜', '기타'];
productSelc2['기타(분말 압축포함)'] = ['훼이스파우더', '베이비파우더(탈쿰 파우더 포함)', '기타'];
productSelc2['(기초화장품)기타'] = ['기초화장용 제품류', '메이크업용 제품류', '어린이용 제품류', '기타'];

productSelc2['샴푸'] = ['(샴푸)샴푸', '펌용 제품', '헤어 래커'];
productSelc2['(두발용)기타'] = ['헤어 린스', '헤어 크림', '기타'];

productSelc2['면도용 제품류'] = ['에프터 셰이빙 로션', '기타'];

productSelc2['목욕용 제품류'] = ['가향한 목욕용 염', '기타'];

productSelc2['인체탈취제 및 내발한제'] = ['선택없음'];

productSelc2['실내용 가향 또는 방취조제품'] = ['아가바티와 기타 분향', '(탈모제와 기타 제조향료)기타'];

productSelc2['(구분되지않은화장품)기타'] = ['탈모제', '향낭', '콘택트렌즈의 액 또는 의안의 액', '기타'];

productSelc2['비누, 종이비누 등'] = ['약용비누', '기타'];
productSelc2['비누, 유기계면 활성화 제품과 조제품(고체)'] = ['세탁비누', '비누(기타)', '종이비누같은 제품군'];
productSelc2['기타 형상의 비누'] = ['피부 세척용 제품과 조제품'];


var productHS = {};
productHS['-------'] = [''];
productHS['화장품'] = ['33'];

productHS['향수 및 화장수'] = ['03'];
productHS['기초화장품,매니큐어'] = ['04'];
productHS['두발용 제품'] = ['05'];
productHS['면도용 제품'] = ['07'];
productHS['목욕용 제품'] = ['07'];
productHS['인체용 탈취 제품'] = ['07'];
productHS['탈모제와 기타 제조 향료'] = ['07'];
productHS['구분되어 있지 않은 화장품'] = ['07'];
productHS['비누, 종이비누'] = ['3401'];

productHS['향수'] = ['00.1000'];
productHS['화장수'] = ['00.2000'];
productHS['입술화장제품류'] = ['10'];
productHS['눈화장제품류'] = ['20'];
productHS['메니큐어 및 페디큐어'] = ['30'];
productHS['기타(분말 압축포함)'] = ['91'];
productHS['(기초화장품)기타'] = ['99'];
productHS['샴푸'] = [''];
productHS['실내용 가향 또는 방취조제품'] = [''];
productHS['(두발용)기타'] = ['90'];
productHS['면도용 제품류'] = ['10'];
productHS['목욕용 제품류'] = ['30'];
productHS['인체탈취제 및 내발한제'] = ['20'];
productHS['실내용 가향 또는 방취조제품'] = [''];
productHS['(구분되지않은화장품)기타'] = ['90'];
productHS['비누, 종이비누 등'] = ['11'];
productHS['비누, 유기계면 활성화 제품과 조제품(고체)'] = ['19'];
productHS['기타 형상의 비누'] = ['30'];

productHS['선택 없음'] = [''];
productHS['선택없음'] = ['0000'];
productHS['립스틱'] = ['1000'];
productHS['아이셰도우'] = ['1000'];
productHS['네일에나멜'] = ['1000'];
productHS['훼이스파우더'] = ['1000'];
productHS['베이비파우더(탈쿰 파우더 포함)'] = ['2000'];
productHS['기초화장용 제품류'] = ['1000'];
productHS['메이크업용 제품류'] = ['2000'];
productHS['어린이용 제품류'] = ['3000'];
productHS['샴푸'] = [''];
productHS['(샴푸)샴푸'] = ['10.0000'];
productHS['펌용 제품'] = ['20.0000'];
productHS['헤어 래커'] = ['30.0000'];
productHS['헤어 린스'] = ['1000'];
productHS['헤어 크림'] = ['2000'];
productHS['에프터 셰이빙 로션'] = ['1000'];
productHS['가향한 목욕용 염'] = ['1000'];
productHS['기타 목욕용 제품류'] = ['2000'];
productHS['아가바티와 기타 분향'] = ['41.0000'];
productHS['(탈모제와 기타 제조향료)기타'] = ['49.0000'];
productHS['탈모제'] = ['1000'];
productHS['향낭'] = ['2000'];
productHS['콘택트렌즈의 액 또는 의안의 액'] = ['3000'];
productHS['약용비누'] = ['1000'];
productHS['세탁비누'] = ['1010'];
productHS['(비누)기타'] = ['1090'];
productHS['종이비누같은 제품군'] = ['2000'];
productHS['피부 세척용 제품과 조제품'] = ['0000'];
productHS['기타'] = ['9000'];


function ChangeProductList1() {
  var productList = document.getElementById("category");
  var modelList = document.getElementById("category2");
  var selProduct = productList.options[productList.selectedIndex].value;
  while (modelList.options.length) {
    modelList.remove(0);
  }
  var products = productSelc[selProduct];
  if (products) {
    $('#category2').append($('<option>', { 
        value: 'front',
        text : '-------' 
    }));
    $("#category2 option[value='front']").prop('disabled', true);
    var i;
    for (i = 0; i < products.length; i++) {
      var product = new Option(products[i], i);
      modelList.options.add(product);
    }
    //$('#category2').find("option:eq(0)").prop("selected", true);
  }
}

function ChangeProductList2() {

  var productList = document.getElementById("category2");
  var modelList = document.getElementById("category3");
  var selProduct = productList.options[productList.selectedIndex].text;
  while (modelList.options.length) {
    modelList.remove(0);
  }
  var products = productSelc2[selProduct];
  if (products) {
    $('#category3').append($('<option>', { 
        value: 'front',
        text : '-------' 
    }));
    $("#category3 option[value='front']").prop('disabled', true);
    var i;
    for (i = 0; i < products.length; i++) {
      var product = new Option(products[i], i);
      modelList.options.add(product);
    }
    //$('#category3').find("option:eq(0)").prop("selected", true);
  }
}

// HS-CODE 보여주기

$("#btnDocument").click(
    function() {
      var selected = [];
      selected[0] = $('#major-category').find(":selected").text();
      selected[1] = $('#category').find(":selected").text();
      selected[2] = $('#category2').find(":selected").text();
      selected[3] = $('#category3').find(":selected").text();
      var trans1 = $('#selectbox_ship').find(":selected").text();
      var trans2 = $('#selectbox_airport').find(":selected").text();

      var product_name = $('#product-name').val(); //제품명
      var departure = $('#departure').find(":selected").text(); //출발지
      var product_weight = $('#product-weight').val(); // 무게
      var sel_trans = ""; //선박 혹은 비행기 옵션
      var hscode = ""; //hs-code 합친거
      // sel_country 수출 국가
      //trans_type 선적 종류
      

      //빈칸 체크
      //제품명
      if(product_name ==""){
        alert("제품명을 입력해주세요");
        return false;
      }
      //무게
      if(product_weight ==""){
        alert("제품 무게를 입력해주세요");
        return false;
      }
      //국가
      if(sel_country== ""){
        alert("수출 국가를 선택해주세요");
        return false;
      } 
      //선적 종류
      if(trans_type== ""){
        alert("선적 타입 선택해주세요");
        return false;
      }
      //수출도시 선택 여부
      if(trans_type =="ship"){
        if(trans1 == "---"){
          alert("구체적인 수출 도시를 선택해주세요");
          return false;
        }else{
          sel_trans = trans1;
        }
      }else if(trans_type =="airport"){
        if(trans2 =="---"){
          alert("구체적인 수출 도시를 선택해주세요");
          return false;
        }else{
          sel_trans = trans2;
        }
      }
      var i;
      for (i = 0; i < 4; i++) {
        if (selected[i] == "-------") {
          alert("카테고리를 모두 선택해주세요");
          return false;
        } else {
          if (!selected[i]) {
            selected[i] = "";
          } else {
            selected[i] = productHS[selected[i]];
          }
        }

      }

      if(selected[1] == "03"){
            hscode = selected[0]+selected[1]+'.'+selected[2];
            $('.hs-code').text(hscode);
      } else if (selected[2] == "") {
            hscode = selected[0]+selected[1]+'.'+selected[3];
            $('.hs-code').text(hscode);
      } else if (selected[1] == "3401") {
            hscode = selected[1]+'.'+selected[2]+'.'+selected[3];
            $('.hs-code').text(hscode);
      } else {
            hscode = selected[0]+selected[1]+'.'+selected[2]+'.'+selected[3];
          $('.hs-code').text(hscode);
      }
      
      $("input[name='country']").val(sel_country);
      $("input[name='transport']").val(trans_type);
      $("input[name='type']").val(selected[0]);
      $("input[name='category']").val(selected[1]);
      $("input[name='product']").val(selected[2]);
      $("input[name='product_name']").val(selected[3]);
      $("input[name='hs_code']").val(hscode);
      $("input[name='end_point']").val(sel_trans);
      
      var query = $("#docForm").serialize();
      
      $.ajax({
    	 url: "/document",
    	 method: "post",
    	 data : query
      }).success(function(data){
    	  if(data == 'success') {
    		  alert("신청되었습니다.");
    		  location.href="/document";
    	  }
    	  if(data == 'fail') {
    		  alert("권한이 없습니다.");
    	  }
      });
    	  

    });
