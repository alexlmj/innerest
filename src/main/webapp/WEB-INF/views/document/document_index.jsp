<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Innerest-Export Document</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">

    <!--related CSS file with Survey page-->
    <link rel="stylesheet" href="/resources/css/innerest/01.content.css">
    <link rel="stylesheet" href="/resources/css/innerest/02.survey_style.css">
    <link rel="stylesheet" href="/resources/css/innerest/03.loading_page.css">
    <link rel="stylesheet" href="/resources/css/innerest/04.selection.css">
    <link rel="stylesheet" href="/resources/css/innerest/common.css">
    <link rel="stylesheet" href="/resources/css/innerest/defualt.css">
    <link rel="stylesheet" href="/resources/css/innerest/font.css">


    <link rel="stylesheet" href="/resources/css/aos.css">

    <link rel="stylesheet" href="/resources/css/style.css">
    
  <script src="/resources/js/jquery-3.3.1.min.js"></script>
  <script src="/resources/js/jquery-ui.js"></script>
  <script src="/resources/js/popper.min.js"></script>
  <script src="/resources/js/bootstrap.min.js"></script>
  <!-- <script src="/resources/js/common.js"></script>
   --><script src="/resources/js/owl.carousel.min.js"></script>
  <script src="/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/js/aos.js"></script>
  <script src="/resources/js/main.js"></script>
  <script>
//13.mypage tab 
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

  // transportation selection 
  //trans_type 전역변수 선언
  var trans_type = "";
  var sel_country = "";
  
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
	    function myFunction2(country){
	    var v = document.getElementById(country.id).value;
	    sel_country = v;
	    $(".click-check2").css("background-color", "#a8d8d4");
	    document.getElementById(country.id).style.backgroundColor = "#279d93";
	  }

	  


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
	  
  $(document).ready(function(){ 
  $(".btn-tab-menu li").click(function(){
      
      var list = $(this).index();
      
      $(".tab-wrap ul").hide();
      $(".tab-wrap ul").eq(list).show();
      
      $(".btn-tab-menu li").children("a").removeClass("on-tab");
      $(this).children("a").addClass("on-tab")
  });
  
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
	        }).done(function(data){
	      	  if(data == 'success') {
	      		  alert("신청되었습니다.");
	      		  location.href="/document";
	      	  }
	      	  if(data == 'fail') {
	      		  alert("권한이 없습니다.");
	      	  }
	        }).fail(function() {
	        	alert("SERVER ERROR");
	        });
	      	  

	      });
  });

  </script>
  </head>
  <body>
  
  <div class="site-wrap">
       <jsp:include page="/WEB-INF/views/common/default-header-bar.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/common/default-header.jsp"></jsp:include>

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="/">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-color">Export Document</strong></div>
        </div>
      </div>
    </div>

<!--Export document start-->
 <div class = "container">
  <div id="wrapper-selection">
      <div class="content-selection survey-position"> 
          <!--<div class="top-title-select">
              <h2>Export Document</h2>
          </div>-->
          
          
          
          <div class="survey-title">
         <div class="survey-title-content">
       
   다음은 수출에 대한 정보를 제공받을 수 있는 Solutions 입니다. <br>
제품명을 입력하고 맞는 카테고리를 선택해 주시길 바랍니다.
        </div>
       </div> 
       
<!--
              <div class="selection-description-box">
                  <p>다음은 귀하가 수출하고자 하는 물품에 대한 정보를 알아보는 조사입니다.<br>질문에 입력해주세요.</p>
              </div>
              
         --> <form id="docForm">  
         <input type="hidden" name="country" id="country">
         <input type="hidden" name="transport" id="transport">
         <input type="hidden" name="hs_code" id="hs_code">
         <input type="hidden" name="end_point" id="end_point">
 <div class="survey-main-content2">
      
        <div class="survey-question2">
        
        <div class="selection-box">
                  <ul class="selection-list-wrap">
                      <li class="selection-list list-select-01 clear">
                          <div class="object-list">
                              <p>제품명</p>
                          </div>
                          <div class="select-list">
                              <input class="input-product" id = "product-name" name="name" type="text">
                          </div>
                      </li>
                      
                       <li class="selection-list list-select-02 clear">
                          <div class="object-list">
                              <p>출발지</p>
                          </div>
                          <div class="select-list">
                              <select name="start_point" id = "departure">
                                  <option value="서울특별시">서울특별시</option>
                                  <option value="인천광역시">인천광역시</option> 
                                  <option value="경기도">경기도</option> 
                                  <option value="인천광역시">부산광역시</option> 
                                  <option value="인천광역시">대구광역시</option>
                              </select>
                          </div>
                      </li>
                      
                      <li class="selection-list list-select-03 clear">
                          <div class="object-list">
                              <p>수출도시</p>
                          </div>
                          <div class="select-list">
                              <!--<select name="transportation">
                                  <option class="ship" value="선박">선박</option>
                                  <option class="airport" value="항공">항공</option>
                              </select>-->
                              <div class = "country">
                                <button type="button"  class="btn trans-btn click-check2" id = "china" value="china" onclick="myFunction2(this)"><img src="/resources/images/china.png" alt="footer-logo img" title="Innerest"></button>
                      <button type="button" class="btn click-check2"  id = "usa" value="usa" onclick="myFunction2(this)"><img src="/resources/images/usa.png" alt="footer-logo img" title="Innerest"></button>
                  </div>
                          </div>
                      </li>
                      
                      <li class="selection-list list-select-04 clear">
                          <div class="object-list">
                              <p>선적종류</p>
                          </div>
                          <!--
                          <div class="select-list"> 
                              <select class="city-export export-ship" name="city-export export-ship">
                                  <option value="Beihai">Beihai</option>
                                  <option value="Chiwan">Chiwan</option>
                                  <option value="Da Chan Bay Terminal One">Da Chan Bay Terminal One</option>
                                  <option value="Dalian">Dalian </option>
                                  <option value="Fuzhou">Fuzhou</option>
                                  <option value="Guangzhou">Guangzhou</option>
                                  <option value="Haikou">Haikou</option>
                                  <option value="Haimen">Haimen</option>
                                  <option value="Huadu">Huadu</option>
                              </select>
                              
                               <select class="city-export export-airport" name="city-export export-airport">
                                  <option value="ALTAY">ALTAY</option>
                                  <option value="ANKANG">ANKANG</option>
                                  <option value="AKSU">AKSU</option>
                                  <option value="ANQING">ANQING</option>
                                  <option value="ANYANG">ANYANG</option>
                                  <option value="BAOTOU">BAOTOU</option>
                                  <option value="BEIHAI">BEIHAI</option>
                                  <option value="BEIJING">BEIJING</option>
                                  <option value="BAOSHAN">BAOSHAN</option>
                                  <option value="GUANGZHOU BAIYUN">GUANGZHOU BAIYUN</option>
                                  <option value="CHANGDE">CHANGDE</option>
                                  
                              </select>
                          </div>-->
                          <div class="select-list">
                            <div class = "transport">

                              <button type="button"  class="btn btn-sm trans-btn click-check" id = "trans1" value="ship" onclick="myFunction(this)">SHIPMENT</button>
                    <button type="button" class="btn btn-sm click-check"  id = "trans2" value="airport" onclick="myFunction(this)">AIRLINE</button>
                  </div>
                  <select id="selectbox_ship" class="country-select selectbox_sub">
                <option>---</option>
                <option value="CNBHY">Beihai</option>
                <option value="CNCWN">Chiwan</option>
                <option value="CNDCB">Da Chan Bay Terminal One</option>
                <option value="CNDLC">Dalian </option>
                <option value="CNFOC">Fuzhou</option>
                <option value="CNCAN">Guangzhou</option>
                <option value="CNHAK">Haikou</option>
                <option value="CNHMP">Haimen</option>
                <option value="CNHDU">Huadu</option>
                <option value="CNHUA">Huangpu</option>
                <option value="CNHZP">Huizhou </option>
                <option value="CNJMN">Jiangmen</option>
                <option value="CNJNZ">Jinzhou</option>
                <option value="CNLYG">Lianyungang</option>
                <option value="CNLKU">Longkou</option>
                <option value="CNNKG">Nanjing </option>
                <option value="CNNTG">Nantong</option>
                <option value="CNNGB">Ningbo </option>
                <option value="CNTAO">Qingdao</option>
                <option value="CNSHP">Qinhuangdao</option>
                <option value="CNRZH">Rizhao</option>
                <option value="CNSHA">Shanghai</option>
                <option value="CNSWA">Shantou</option>
                <option value="CNSHEK">Shekou</option>
                <option value="CNTAG">Taicang</option>
                <option value="CNTZO">Taizhou</option>
                <option value="CNTXG">Tianjin</option>
                <option value="CNWNZ">Wenzhou</option>
                <option value="CNXMN">Xiamen</option>
                <option value="CNYNT">Yantai</option>
                <option value="CNYTN">Yantian</option>
                <option value="CNZJG">Zhangjiagang</option>
                <option value="CNZHA">Zhanjiang</option>
                </select>

                <select id="selectbox_airport" class="country-select selectbox_sub" style="display:none">
                <option>---</option>
                <option value = "AAT">ALTAY</option>
                <option value = "AKA">ANKANG</option>
                <option value = "AKU">AKSU</option>
                <option value = "AQG">ANQING</option>
                <option value = "AYN">ANYANG</option>
                <option value = "BAV">BAOTOU</option>
                <option value = "BHY">BEIHAI</option>
                <option value = "BJS">BEIJING</option>
                <option value = "BSD">BAOSHAN</option>
                <option value = "CAN">GUANGZHOU BAIYUN</option>
                <option value = "CGD">CHANGDE</option>
                <option value = "CGO">ZHENGZHOU</option>
                <option value = "CGQ">CHANGCHUN</option>
                <option value = "CHG">CHAOYANG</option>
                <option value = "CHW">JIUQUAN</option>
                <option value = "CIF">CHIFENG</option>
                <option value = "CIH">CHANGZHI</option>
                <option value = "CKG">CHONGQING</option>
                <option value = "CNI">CHANGHAI</option>
                <option value = "CSX">CHANGSHA</option>
                <option value = "CTU">CHENGDU</option>
                <option value = "CZX">CHANGZHOU</option>
                <option value = "DAT">DATONG</option>
                <option value = "DAX">DAXIAN</option>
                <option value = "DDG">DANDONG</option>
                <option value = "DLC">DALIAN</option>
                <option value = "DNH">DUNHUANG</option>
                <option value = "DSN">DONGSHENG</option>
                <option value = "DYG">DAYONG</option>
                <option value = "DZU">DAZU</option>
                <option value = "ENH">ENSHI</option>
                <option value = "ENY">YAN'AN</option>
                <option value = "FOC">FUZHOU</option>
                <option value = "PEK">BEIJING CAPITAL</option>
                <option value = "NAY">BEIJING NANYUAN AIRPORT</option>
                <option value = "DNG">DONNGUAN</option>
                <option value = "FUQ">FUQING</option>
                <option value = "FUG">FUYANG</option>
                <option value = "FYN">FUYUN</option>
                <option value = "KOW">GANZHOU</option>
                <option value = "GOQ">GOLMUD</option>
                <option value = "GHN">GUANGHAN</option>
                <option value = "LHK">GUANGHUA</option>
                <option value = "KWL">GUILIN</option>
                <option value = "KWE">GUIYANG</option>
                <option value = "HAK">HAIKOU</option>
                <option value = "HLD">HAILAR</option>
                <option value = "HMI">HAMI</option>
                <option value = "HGH">HANGZHOU</option>
                <option value = "HZG">HANZHONG</option>
                <option value = "HRB">HARBIN</option>
                <option value = "HFE">HEFEI</option>
                <option value = "HEK">HEIHE</option>
                <option value = "HNY">HENGYANG</option>
                <option value = "HET">HOHHOT</option>
                <option value = "HKG">HONG KONG INTL</option>
                <option value = "HTN">HOTAN</option>
                <option value = "HHA">HUANGHUA</option>
                <option value = "HYN">HUANGYAN</option>
                <option value = "JMU">JIAMUSI</option>
                <option value = "JIG">JIAXING</option>
                <option value = "JGN">JIAYUGUAN</option>
                <option value = "JIL">JILIN</option>
                <option value = "TNA">JINAN</option>
                <option value = "JDZ">JINGDEZHEN</option>
                <option value = "JHG">JINGHONG GASA</option>
                <option value = "JJN">JINJIANG</option>
                <option value = "KRY">KARAMAY</option>
                <option value = "KHG">KASHI</option>
                <option value = "KRL">KORLA</option>
                <option value = "KMG">KUNMING</option>
                <option value = "KCA">KUQA</option>
                <option value = "LHW">LANZHOU</option>
                <option value = "LZD">LANZHOU LANZHOUDON</option>
                <option value = "ZGC">LANZHOU ZHONGCHUAN</option>
                <option value = "LXA">LHASA</option>
                <option value = "LIA">LIANGPING</option>
                <option value = "LYG">LIANYUNGANG</option>
                <option value = "LZH">LIUZHOU</option>
                <option value = "LYA">LUOYANG</option>
                <option value = "LUZ">LUSHAN</option>
                <option value = "LUM">LUXI MANGSHI</option>
                <option value = "LZO">LUZHOU</option>
                <option value = "MXZ">MEIXIAN</option>
                <option value = "MDG">MUDANJIANG</option>
                <option value = "KHN">NANCHANG</option>
                <option value = "NAO">NANCHONG</option>
                <option value = "NKG">NANJING</option>
                <option value = "NNG">NANNING</option>
                <option value = "NNY">NANYANG</option>
                <option value = "NGB">NINGBO</option>
                <option value = "PVG">PU DONG</option>
                <option value = "IQM">QIEMO</option>
                <option value = "TAO">QINGDAO</option>
                <option value = "IQN">QINGYANG</option>
                <option value = "SHP">QINHUANGDAO</option>
                <option value = "NDG">QIQIHAR</option>
                <option value = "SYX">SANYA</option>
                <option value = "SHA">SHANGHAI</option>
                <option value = "SHF">SHANHAIGUAN</option>
                <option value = "SXJ">SHANSHAN</option>
                <option value = "SWA">SHANTOU</option>
                <option value = "SZO">SHANZHOU</option>
                <option value = "HSC">SHAOGUAN</option>
                <option value = "SHS">SHASHI</option>
                <option value = "SHE">SHENYANG</option>
                <option value = "SZX">SHENZHEN</option>
                <option value = "SJW">SHIJIAZHUANG</option>
                <option value = "SYM">SIMAO</option>
                <option value = "SZV">SUZHOU</option>
                <option value = "TYN">TAIYUAN</option>
                <option value = "TSN">TIANJIN</option>
                <option value = "TGO">TONGLIAO</option>
                <option value = "TXN">TUNXI</option>
                <option value = "HLH">ULANHOT</option>
                <option value = "URC">URUMQI</option>
                <option value = "WXN">WANXIAN</option>
                <option value = "WNZ">WENZHOU</option>
                <option value = "WUH">WUHAN</option>
                <option value = "WUZ">WUZHOU CHANGZHOUD</option>
                <option value = "XIY">XI AN XIANYANG</option>
                <option value = "SIA">XI AN XIGUAN</option>
                <option value = "XMN">XIAMEN INT'L</option>
                <option value = "XFN">XIANGFAN</option>
                <option value = "XIC">XICHANG</option>
                <option value = "XIL">XILINHOT</option>
                <option value = "XEN">XINGCHENG</option>
                <option value = "XIN">XINGNING</option>
                <option value = "XNN">XINING</option>
                <option value = "XUZ">XUZHOU</option>
                <option value = "YNJ">YANJI</option>
                <option value = "YNT">YANTAI LAISHAN</option>
                <option value = "YBP">YIBIN</option>
                <option value = "YIH">YICHANG</option>
                <option value = "YLN">YILAN</option>
                <option value = "INC">YINCHUAN</option>
                <option value = "YIN">YINING</option>
                <option value = "YIW">YIWU</option>
                <option value = "YUA">YUANMOU</option>
                <option value = "UYN">YULIN</option>
                <option value = "ZHA">ZHANJIANG</option>
                <option value = "ZAT">ZHAOTONG</option>
                <option value = "ZUH">ZHUHAI</option>
                <option value = "ZYI">ZUNYI</option>
                

                </select>
                
            </div>
                      </li>
                      
                      <li class="selection-list list-select-01 clear">
                          <div class="object-list">
                              <p>G/W(무게)</p>
                          </div>
                          <div class="select-list">
                              <input class="input-product" name="weight" id = "product-weight" type="text">
                          </div>
                      </li>
                      
                      <li class="selection-list list-select-05 clear">
                          <div class="object-list object-list-checklist">
                              <p>체크리스트</p>
                          </div>
                             <div class="select-list select-list-checklist">
                              <select name="type" id = "major-category">
                                  <option value="화장품">화장품</option>
                              </select>
                              
                              <select name="category" id="category" onchange="ChangeProductList1()">
                                  <option>-------</option>
                                  <option>향수 및 화장수</option>
                                  <option>기초화장품,매니큐어</option>
                                  <option>두발용 제품</option>
                                  <option>면도용 제품</option>
                                  <option>목욕용 제품</option>
                                  <option>인체용 탈취 제품</option>
                                  <option>탈모제와 기타 제조 향료</option>
                                  <option>구분되어 있지 않은 화장품</option>
                                  <option>비누, 종이비누</option>
                              </select>
                              <select id = "category2" name="product" onchange="ChangeProductList2()"></select>
                              <select id = "category3" name="product_detail"></select>
                               <!--<select name="item list">
                                  <option value="품목">품목</option>
                                  <option value="00.1000">향수</option>
                                  <option value="000.2000">화장수</option>
                                  <option value="10">입술화장 제품류</option>
                                  <option value="20">눈화장 제품류</option>
                                  <option value="30">메니큐어 및 페디큐어</option>
                                  <option value="91">기타(분말 압축포함)</option>
                                  <option value="99">기타</option>
                                  <option value="">샴푸</option>
                                  <option value="90">기타</option>
                                  <option value="10">면도용제품류</option>
                                  <option value="30">목욕용제품류</option>
                                  <option value="20.000">인체탈취제 및 내발한제</option>
                                  <option value="">실내용 가향 또는 방취조제품(종교적물건포함)</option>
                                  <option value="90">기타</option>
                                  <option value="11">비누/종이비누 등</option>
                                  <option value="19">비누 유기계면 활성화 제품과 조제품</option>
                                  <option value="30">기타 형상의 비누</option>
                              </select>
                              
                               <select name="item detail">
                                  <option value="세부품목">세부품목</option>
                                  <option value="-">-</option>
                                  <option value="1000">립스틱</option>
                                  <option value="9000">입술화장용 기타</option>
                                  <option value="1000">아이섀도우</option>
                                  <option value="9000">눈화장용 기타</option>
                                  <option value="1000">네일에나멜</option>
                                  <option value="9000">네일 기타</option>
                                  <option value="1000">훼이스파우더</option>
                                  <option value="2000">베이비파우더(탈쿰 파우더 포함)</option>
                                  <option value="9000">기타</option>
                                  <option value="1000">기초화장용 제품류</option>
                                  <option value="2000">메이크업용 제품류</option>
                                  <option value="3000">어린이용 제품류</option>
                                  <option value="9000">기타</option>
                                  <option value="10.0000">샴푸</option>
                                  <option value="20.0000">펌용 제품</option>
                                  <option value="30.0000">헤어 래커</option>
                                  <option value="1000">헤어 린스</option>
                                  <option value="2000">헤어 크림</option>
                                  <option value="9000">기타</option>

                                  <option value="1000">에프터 셰이빙 로션</option>
                                  <option value="9000">기타</option>

                                  <option value="1000">가향한 목욕용 염</option>
                                  <option value="2000">기타 목욕용 제품류</option>

                                  <option value="41.0000">아가바티와 기타 분향</option>
                                  <option value="49.0000">기타</option>

                                  <option value="1000">탈모제</option>
                                  <option value="2000">향낭</option>

                                  <option value="3000">콘텍트렌즈의 액 또는 의안의 액</option>
                                  <option value="9000">기타</option>

                                  <option value="1000">약용비누</option>
                                  <option value="9000">기타</option>

                                  <option value="1010">세탁비누</option>
                                  <option value="1090">기타</option>

                                  <option value="19.2000">종이비누같은 제품군</option>
                                  <option value="30.0000">피부 세척용 제품과 조제품</option>
                              </select>-->
                          </div>
                      </li>
                  </ul>
              </div>
          
       </div> 
      
       </div> </form>
       
              
         
              
              
              
              
              
             
<!-- //selection box -->
        
         <div class="align-width-btn"><button id="btnDocument" class="btn-check-document btn-bottom-04-select" align="center" data-toggle="modal" data-target="#myModal" >수출서류 확인해보기</button></div>
<!--         modal(?)-->
         <!--<div id="modalDocument" class="modal-document-list">
            <div class="close-modal"><span>X</span></div>-->
<!--            이미지로 교체-->

                 <!-- The Modal -->
        <div class="modal fade" id="myModal">
          <div class="modal-dialog modal-md">
            <div class="modal-content">
            
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">수출서류 확인</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              
              <!-- Modal body -->
              <div class="modal-body">
                <ul class="document-list-wrap">
                 <li class="document-list clear">
                     <div class="article-list">
                         <p>제품명</p>
                     </div>
                     <div class="article-result-list">
                         <p class="product-name">미백 마스크</p>
                     </div>
                 </li>
                 
                 <li class="document-list clear">
                     <div class="article-list">
                         <p>HS-code</p>
                     </div>
                     <div class="article-result-list">
                         <p class="hs-code">1234.34.5678</p>
                     </div>
                 </li>
                 
                 <li class="document-list clear">
                     <div class="article-list">
                         <p>산출비용</p>
                     </div>
                     <div class="article-result-list">
                         <p class="costing">"1주내 메일로 보내드리겠습니다."</p>
                     </div>
                 </li>
                 
                 <li class="document-list clear docu-list-length">
                     <div class="article-list">
                         <p>필요서류</p>
                     </div>
                     <div class="article-result-list article-result-list-length">
                         <p class="nec-document">"1주내 메일로 보내드리겠습니다."<br><br><br></p>
                     </div>
                 </li>
             </ul>
              </div>
              
              <!-- Modal footer -->
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
              
            </div>
          </div>
        </div>


             <!--<ul class="document-list-wrap">
                 <li class="document-list clear">
                     <div class="article-list">
                         <p>제품명</p>
                     </div>
                     <div class="article-result-list">
                         <p class="product-name">미백 마스크</p>
                     </div>
                 </li>
                 
                 <li class="document-list clear">
                     <div class="article-list">
                         <p>HS-code</p>
                     </div>
                     <div class="article-result-list">
                         <p class="hs-code">1234.34.5678</p>
                     </div>
                 </li>
                 
                 <li class="document-list clear">
                     <div class="article-list">
                         <p>산출비용</p>
                     </div>
                     <div class="article-result-list">
                         <p class="costing">"1주내 메일로 보내드리겠습니다."</p>
                     </div>
                 </li>
                 
                 <li class="document-list clear docu-list-length">
                     <div class="article-list">
                         <p>필요서류</p>
                     </div>
                     <div class="article-result-list article-result-list-length">
                         <p class="nec-document">"1주내 메일로 보내드리겠습니다."<br><br><br></p>
                     </div>
                 </li>
             </ul>-->
         </div>
         
          </div>
      </div>
  </div>    
      
<!--  //wrapper -->

<!--footer 모든 메인페이지 -->
<jsp:include page="/WEB-INF/views/common/main-footer.jsp"></jsp:include>
  </body>
</html>