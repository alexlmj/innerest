
$(function(){
  //모달을 전역변수로 선언
  var modalContents = $(".modal-contents");
  var modal = $("#defaultModal");
  var ok = false;
  
  $('.onlyAlphabetAndNumber').keyup(function(event){
                if (!(event.keyCode >=37 && event.keyCode<=40)) {
                    var inputVal = $(this).val();
                    $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
                }
            });
                 
                $(".onlyHangul").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
                    }
                });
             
                $(".onlyNumber").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[^0-9]/gi,''));
                    }
                });
                
                

 //------- validation 검사
 $( "#register-form" ).submit(function( event ) {
     
     //이용약관 동의
     if($('input:checkbox[id="policy-agree"]').is(":checked") == false){
        modalContents.text("이용약관에 동의해 주시기 바랍니다.");
         modal.modal('show');
          return false;
     }

     //개인정보 수집
     if($('input:checkbox[id="personal-data-agree"]').is(":checked") == false){
        modalContents.text("개인정보 수집 및 이용에 동의해 주시기 바랍니다.");
         modal.modal('show');
          return false;
     }

     //아이디 검사
     if($('#id').val()==""){
         modalContents.text("아이디를 입력하여 주시기 바랍니다.");
         modal.modal('show');
         $('#id').focus();
          return false;}
      
     if(ok == false) {
    	 modalContents.text("다른 아이디를 입력해주세요");
    	 modal.modal('show');
    	 $('#id').focus();
    	 return false;
     }
     
      //비밀번호 검사
      if($('#password').val()==""){
         modalContents.text("비밀번호를 입력하여 주시기 바랍니다.");
         modal.modal('show');
         $('#password').focus();
          return false;}

       //패스워드 비교
      if($('#password').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
          modalContents.text("패스워드가 일치하지 않습니다.");
          modal.modal('show');
          return false;}
      //이름 검사
      if($('#name').val()==""){
         modalContents.text("이름을 입력해 주시기 바랍니다.");
         modal.modal('show');
          return false;}
      //주소 검사
      if($('#zip').val()==""){
         modalContents.text("우편번호를 검색해 주시기 바랍니다.");
         modal.modal('show');
          return false;}
      //상세 주소
      if($('#detail-address').val()==""){
         modalContents.text("상세주소를 입력해 주시기 바랍니다.");
         modal.modal('show');
          return false;}
      //전화번호
      if($('#phoneNumber').val()==""){
         modalContents.text("전화번호를 입력해 주시기 바랍니다.");
         modal.modal('show');
          return false;}
      //이메일
      if($('#email').val()==""){
         modalContents.text("이메일을 입력해 주시기 바랍니다.");
         modal.modal('show');
          return false;}


 });


  });

