<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf"%>

<h2 style="font-size: 36px; color: #333; line-height: 36px; margin-bottom: 50px; font-family: 'NanumSquareB'; font-weight: normal;">${info.title}</h2>

<script type="text/javascript">
$(document).ready(function(){
	$('.inputType4').keyup(function (e){
		var content = $(this).val();
		//$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
		$('.max_counter').html(content.length + '/250');
		if(content.length == 250){
			alert('250자만 입력 가능합니다.');
		}
	});
	$('.max_counter').keyup();

	$("input[name='mainContType2']").attr('disabled', true);
	$("input[name='mainContType2']").attr('checked', false);
	$("select[name='prdctCd2']").change(function(){
		if($("select[name='prdctCd2']").val() != '') {
			$("input[name='mainContType2']").attr('disabled', false);
			if ($("input[name='mainContType2']:checked").val() == undefined || $("input[name='mainContType2']:checked").val() == "") {
				$("input:radio[name='mainContType2']:input[value='상조']").attr('checked', true);
			} 
		}
		else {
			$("input[name='mainContType2']").attr('disabled', true);
			$("input[name='mainContType2']").attr('checked', false);
		}
	});
});
</script>

	
<form name="frm" method="post">
	<input type="hidden" name="b2bStts" value="${info.b2bStts}" />
	<input type="hidden" name="b2bCd" value="${info.b2bCd}" class="notRequired" />
	<input type="hidden" name="b2bNm" value="${info.b2bNm}" class="notRequired" />
	<input type="hidden" name="checkAuth" id="checkAuth" value="N" />

	<div data-controller="CommonController OutsourcingController">
	<!-- 2019.06.27 웹 접수 페이지 문구 추가-->
	<font color="red"><b> ● 최초 1회에 한하여 판매사원 인증 필수. </b></font>
		<c:if test="${info.agentInfoYn eq 'Y'}">
			<p class="titTxt mt40">판매사 정보 입력</p>
			<div class="boardType2 mt15" >
				<table summary="">
					<caption></caption>
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tbody>


						<!-- 판매사원 성명 입력란 -->
						<c:if test="${info.agentEmpNmYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">판매사원 성명</span></th>
								<td>
									<input type="text" name="agentEmpNm" title="판매사원명" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>

						<!-- 판매자 연락처 입력란 -->
						<c:if test="${info.sllrCtelYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">판매자 연락처</span></th>
								<td>
									<input type="text" name="sllrCtel" title="판매자 연락처" class="inputType1 phoneChk" maxlength="13" />
								</td>
							</tr>
						</c:if>

						<!-- 판매자 생년월일 입력란 -->
						<c:if test="${info.birthDayYn eq 'Y'}">
							<tr>
								<th scope="row">
									<span class="essen" title="필수입력">생년월일</span>
								</th>
								<td>
									<input type="text" name="birthDay" id="birthDay" title="생년월일" class="inputType1 numberChk" maxlength="8" />
									<span class="red"> * 생년월일은 8자리로 입력해주세요. ex)19580101</span>
								</td>
							</tr>
						</c:if>

					</tbody>
				</table>

				<!-- 안내사항 표시란 -->
				<c:if test="${info.infoYn eq 'Y'}">
					<div id="info" style="white-space: pre-line">${info.info}</div>
				</c:if>

				<script>
										function layerPopOpen() {
											$(".accreditPop").css("display","table");
											
										}
										function layerPopClose() {
											$(".accreditPop").css("display","none");
										}
										</script>
				<div style="width: 100%; text-align: center;">
					<span class="whtBt3" onclick="goAuth();" style="margin: 20px auto 0; cursor: pointer" href="">확인</span>
				</div>
				<div class="accreditPop" style="display: none;">
					<div class="accreditCenter">
						<h3>
							<span>본인인증</span>
							<img src="/common/images/btn/popupClose_btn.png" onclick="layerPopClose();" />
						</h3>
						<div class="accreditDiv">
							<div class="accreditBts">
								<p class="mobile">
									<a href="#" class="whtBt" onclick="javascript:mobileAuth();">휴대폰 인증</a>
								</p>
								<p class="ipin">
									<a href="#" class="whtBt" onclick="javascript:ipinAuth();">아이핀 인증</a>
								</p>
								<p class="card">
									<a href="#" class="whtBt" onclick="javascript:cardAuth();">카드 인증</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>

			
		<c:if test="${info.customerInfoYn eq 'Y'}">
			<p class="titTxt mt40">고객 정보 입력</p>
			<div class="boardType2 mt15">
				<table summary="">
					<caption></caption>
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tbody>

					<!-- 상품1 선택란 -->
					<c:if test="${info.prdctNmYn eq 'Y'}">
						<tr>
							<th scope="row">
								<span class="essen" title="필수입력">상품 선택1</span>
							</th>
							<td>
								<select name="prdctCd" title="상품">
									<option value="">[상품선택]</option>
									<c:forEach var="list" items="${prdctList.product}">
										<option value="${list.cd}">${list.cdNm}</option>
									</c:forEach>
								</select>
									<%--								<font color="red"><b> ※ 현장즉시결제 장기할부 개월 수(24개월) 기재 필수. </b></font>--%>
							</td>
						</tr>
					</c:if>

					<!-- 상품1 주 계약 -->
					<c:if test="${info.mainContTypeYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="상품1 주 계약">상품1 주 계약</span></th>
							<td>
								<input type="radio" name="mainContType" value="상조" id="mainContType_1" title="상품1 주 계약" checked> <label for="mainContType_1" >상조</label>&nbsp;&nbsp;
								<input type="radio" name="mainContType" value="여행" id="mainContType_2" title="상품1 주 계약"> <label for="mainContType_2" >여행</label>&nbsp;&nbsp;
								<input type="radio" name="mainContType" value="크루즈" id="mainContType_3" title="상품1 주 계약"> <label for="mainContType_3">크루즈</label>&nbsp;&nbsp;
								<!--  <input type="radio" name="mainContType" value="골프" id="mainContType_4" title="상품1 주 계약"> <label for="mainContType_4" >골프</label> -->
							</td>
						</tr>
					</c:if>

					<!-- 대명 가입번호 입력란 -->
					<c:if test="${info.idNoYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">렌탈접수번호1</span></th>
							<td>
								<input type="text" name="idNo" value="${dmEntrNo}" title="렌탈접수번호1" class="inputType1 numberChk"  />
							</td>
						</tr>
					</c:if>

					<!-- 상품2 선택란 -->
					<c:if test="${info.prdctNm2Yn eq 'Y'}">
						<tr>
							<th scope="row">
								<span>상품 선택2</span>
							</th>
							<td>
								<select name="prdctCd2" title="상품" class="notRequired">
									<option value="">[상품선택]</option>
									<c:forEach var="list" items="${prdctList.product}">
										<option value="${list.cd}">${list.cdNm}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</c:if>

					<!-- 상품2 주 계약 -->
					<c:if test="${info.mainContTypeYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="notRequired" title="상품2 주 계약">상품2 주 계약</span></th>
							<td>
								<input type="radio" name="mainContType2" value="상조" id="mainContType2_1" title="상품2 주 계약" checked> <label for="mainContType2_1" >상조</label>&nbsp;&nbsp;
								<input type="radio" name="mainContType2" value="여행" id="mainContType2_2" title="상품2 주 계약"> <label for="mainContType2_2" >여행</label>&nbsp;&nbsp;
								<input type="radio" name="mainContType2" value="크루즈" id="mainContType2_3" title="상품2 주 계약"> <label for="mainContType2_3">크루즈</label>&nbsp;&nbsp;
								<!-- <input type="radio" name="mainContType2" value="골프" id="mainContType2_4" title="상품2 주 계약"> <label for="mainContType2_4" >골프</label> -->
							</td>
						</tr>
					</c:if>

					<!-- 대명 가입번호2 입력란 -->
					<c:if test="${info.idNoYn eq 'Y'}">
						<tr class="invisible1" >
							<th scope="row"><span class="" >렌탈접수번호2</span></th>
							<td>
								<input id="idNoInput2" type="text" name="idNo2" value="${dmEntrNo2}" title="렌탈접수번호2" class="inputType1 numberChk notRequired"   />
							</td>
						</tr>
					</c:if>

					<!-- 고객명 입력란 -->
					<c:if test="${info.nameYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">고객명</span></th>
							<td>
								<input type="text" name="name" title="고객명" class="inputType1" maxlength="20" />
							</td>
						</tr>
					</c:if>

					<!-- 고객 연락처(핸드폰) 입력란 -->
					<c:if test="${info.hpYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">고객 연락처(핸드폰)</span></th>
							<td>
								<c:if test="${info.telecomYn eq 'Y'}">
									<select name="telecom" class="inputType2" title="통신사">
										<option value="">선택하세요.</option>
										<option value="LGU">LGU+</option>
										<option value="SKT">SKT</option>
										<option value="KT">KT</option>
									</select>
								</c:if>
								<input type="text" name="hp" title="고객 연락처" class="inputType1 phoneChk" maxlength="13" />
							</td>
						</tr>
					</c:if>


					<!-- 상담 가능 시간대 입력란 -->
					<c:if test="${info.calltimeYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">상담 가능 시간대</span></th>
							<td>
								<select name="calltime" class="inputType1" title="상담 가능 시간대">
									<option value="">선택해 주세요</option>
									<option value="10:00 ~ 11:00">10:00 ~ 11:00</option>
									<option value="11:00 ~ 12:00">11:00 ~ 12:00</option>
									<option value="12:00 ~ 13:00">12:00 ~ 13:00</option>
									<option value="13:00 ~ 14:00">13:00 ~ 14:00</option>
									<option value="14:00 ~ 15:00">14:00 ~ 15:00</option>
									<option value="15:00 ~ 16:00">15:00 ~ 16:00</option>
									<option value="16:00 ~ 17:00">16:00 ~ 17:00</option>
									<option value="17:00 ~ 18:00">17:00 ~ 18:00</option>
								</select>
							</td>
							</td>
						</tr>
					</c:if>

						<!-- 멤버십 번호 입력란 -->
						<c:if test="${info.mbspNumYn eq 'Y'}">
							<tr>
								<th scope="row">
									<span class="essen" title="필수입력">멤버십 번호</span>
								</th>
								<td>
									<input type="text" name="mbspNum" title="멤버십 번호" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>

						<!-- 메모 입력란 -->
						<c:if test="${info.memoYn eq 'Y'}">
							<tr>
								<th scope="row">
									<span class="essen">메모</span>
									<span style="display: block;font-size: 12px;color: #b12b1d;padding-top: 8px;padding-left:20px;">※글자수 250자 제한</span>
								</th>
								<td>
									<textarea name="memo" title="메모" class="inputType4 notRequired" style="height: 60px;" maxlength="250"></textarea>
									<span class="max_counter">0/250</span>
								</td>
							</tr>
						</c:if>
					</tbody>
				</table>

				<!-- 고객정보 안내사항 표시란 -->
				<c:if test="${info.cinfoYn eq 'Y'}">
					<div id="cinfo" style="white-space: pre-line">${info.cinfo}</div>
				</c:if>
			</div>
		</c:if>

		<input type="hidden" name="funnel" value="3" />

			<!-- 개인 정보 활용 동의 표시란 -->
		<c:if test="${info.termsYn eq 'Y'}">
			<div class="termDiv mt40">
				<p class="tit">개인 정보 활용 동의</p>
				<button type="button" class="check checkBtn">
					<strong>동의합니다.</strong>
					<img src="/common/images/btn/check_bt.gif" alt="체크">
				</button>
				<input type="checkbox" name="agree" class="agree" style="display: none" />

				<div class="termBox">${info.terms}</div>
			</div>
		</c:if>

		<div class="termDiv mt40">
			<p class="tit">개인 정보의 제3자 제공 동의</p>
			<button type="button" class="check checkBtn">
				<strong>동의합니다.</strong>
				<img src="/common/images/btn/check_bt.gif" alt="체크">
			</button>
			<input type="checkbox" name="agree2" class="agree" style="display:none" />
			<div class="termBox">
				<p><b>[쿠쿠라이프 판매사 정보 확인 및 시책금 지급을 위한 개인정보 수집, 이용 및 제3자 제공 동의서]</b>
					<br><b>주식회사 대명스테이션은 쿠쿠라이프 상품과 관련하여 아래와 같이 개인정보를 수집, 이용 및 제3자 제공하고자 합니다.</b>
					<br>
					<br>1. 개인(신용)정보 수집, 이용 내역
					<br>(1) 수집/이용자 : 주식회사 대명스테이션
					<br>(2) 수집/이용 개인정보 항목 : 성명, 연락처(휴대전화번호), 생년월일, C.I값
					<br>(3) 수집/이용 목적 : 대명과 쿠쿠홈시스의 업무제휴에 따른 쿠쿠홈시스 영업사원 시책 대상자 검증 및 시책금 지급
					<br>(4) 보유기간 : 수집/이용 동의일로부터 30일 또는 수집/이용 목적 달성 시까지
					<br>* 고객님은 위의 개인정보 수집, 이용에 대한 동의를 거부하실 수 있습니다. 그러나 동의를 거부할 경우 시책금 지급에 제한 받을 수 있습니다.
					<br>
					<br>2. 개인(신용)정보 취급업무 제3자 제공 내역
					<br>(1) 수집/이용자 : 주식회사 대명스테이션
					<br>(2) 개인(신용)정보 제공 목적 : 대명과 쿠쿠홈시스의 업무제휴에 따른 쿠쿠홈시스 영업사원 시책 대상자 검증 및 시책금 지급
					<br>(3) 제공 대상 개인(신용)정보 : C.I값, 시책금, 대명관리일련번호
					<br>(4) 제공 받는 자의 개인(신용)정보 보유 및 이용기간 :
					<br>&nbsp;-C.I값 : 동의일(동의일 포함)로부터 시책금 지급 후 3개월까지
					<br>&nbsp;-시책금, 대명관리일련번호 : 동의일(동의일 포함)로부터 시책금 지급 후 5년까지
					<br>* 고객님은 위의 개인정보 취급업무 위탁에 대한 동의를 거부하실 수 있습니다. 그러나 동의를 거부할 경우 시책금 지급에 제한 받을 수 있습니다.
				</p>
			</div>
		</div>

		<div class="mt30 taC">
			<a href="javascript:goSave()" class="btnRed">신청</a>
		</div>
	</div>
</form>

<form name="form1" action="/outsourcing/phoneAuthSMART.do" method="post">
	<input type="hidden" name="rqst_caus_cd" value="00" />
	<input type="hidden" name="rMsg" value="/outsourcing/checkAuthSMART.do" />
</form>

<form name="form2" action="/outsourcing/ipinAuthSMART.do" method="post">
	<input type="hidden" name="rMsg" value="/outsourcing/checkAuthSMART.do" />
</form>
<form name="form3" action="/outsourcing/cardAuthSMART.do" method="post">
	<input type="hidden" name="CP_CD" maxlength="12" size="14" value="V18290000000">
	<input type="hidden" name="REQ_SITE_NM" maxlength="20" size="24" value="대명아임레디">
</form>


<!-- 본인확인 처리결과 정보 -->
<form name="kcbResultForm" id="kcbResultForm">
	<input type="hidden" name="result_cd" value="" />
	<input type="hidden" name="result_msg" value="" />
	<input type="hidden" name="di" value="" />
	<input type="hidden" name="ci" value="" />
	<input type="hidden" name="name" value="" />
	<input type="hidden" name="birthday" value="" />
	<input type="hidden" name="sex" value="" />
	<input type="hidden" name="tel_com_cd" value="" />
	<input type="hidden" name="tel_no" value="" />
	<input type="hidden" name="return_msg" value="" />
</form>
<!-- 본인확인(아이핀) 처리결과 정보 -->
<form name="kcbOutForm" id="kcbOutForm">
	<input type="hidden" name="dupinfo" />
	<input type="hidden" name="realname" />
	<input type="hidden" name="sex" />
	<input type="hidden" name="birthdate" />
	<input type="hidden" name="coinfo1" />
	<input type="hidden" name="coinfo2" />
	<input type="hidden" name="return_msg" />
</form>
<!-- 본인확인(카드) 처리결과 정보 -->
<form name="kcbCardForm" id="kcbCardForm" method="post" >
	<input type="hidden" name="CP_CD"       value="" />
	<input type="hidden" name="TX_SEQ_NO"   value="" />
	<input type="hidden" name="RSLT_CD"     value="" />
	<input type="hidden" name="RSLT_MSG"    value="" />
		
	<input type="hidden" name="CRD_CD"   	value="" />
	<input type="hidden" name="CI_RQST_DT_TM"   value="" />
		
	<input type="hidden" name="RSLT_NAME"   value="" />
	<input type="hidden" name="RSLT_BIRTHDAY"	value="" />
	<input type="hidden" name="RSLT_SEX_CD" 	value="" />
	<input type="hidden" name="RSLT_NTV_FRNR_CD"	value="" />
		
	<input type="hidden" name="DI"			value="" />
	<input type="hidden" name="CI"    		value="" />
	<input type="hidden" name="CI_UPDATE"   value="" />
	
	<input type="hidden" name="RETURN_MSG"   value="" />
</form>


<script type="text/javascript">
	$(".txt_open").click(function(){
		$(this).parent().parents(".termDiv").toggleClass("open");
	});
	function goAuth(){
		var frm = document.frm;
		
		var agentEmpNm = frm.agentEmpNm.value;
		var sllrCtel = frm.sllrCtel.value;
		var birthDay = frm.birthDay.value;
		
		if(agentEmpNm == ""){
			alert("판매사원 성명을 입력하세요.");
			frm.agentEmpNm.focus();
			return;
		}
		if(sllrCtel == ""){
			alert("판매자 연락처를 입력하세요.");
			frm.sllrCtel.focus();
			return;
		}
		if(birthDay == ""){
			alert("성년월일을 입력하세요.");
			frm.birthDay.focus();
			return;
		}
		
		if(!birthday_chk(birthDay)){
			frm.birthDay.focus();
			return;
		}
		<!-- END: 점코드 필수항목 -->
		
		jQuery.ajax({
			url : "/outsourcing/agentAuthCheck.ajax",
			type : "post",
			data : {
				"agentEmpNm" : agentEmpNm,
				"sllrCtel" : sllrCtel,
				"birthDay" : birthDay,
				"ci" : ''
			},
			success : function(r){
				if(r.status == "Y"){
					alert("판매자 정보가 확인 되었습니다.");
					$("#checkAuth").val("Y");
				} else {
					if(confirm("판매사원 인증이 필요합니다.\n인증하시겠습니까?")){
						layerPopOpen();
					} else {
						$("#checkAuth").val("N");
					}
				}
			}
		});
	}

	// 앞뒤 공백문자열을 제거
	function trimCustNm(str) 
	{
	  	return trim(str); 
	}

	// 생년월일 체크
	function birthday_chk(f)
	{
		if(f == '')
	 	{
		  	alert('생년월일을 작성해주세요.');
		  	return false;
		 }
		 else if(f.length != 8)
		 {
		  	alert('생년월일을 정확히 작성해 주세요.');
		  	return false;
		 }
		
		 //=== 확인 : 생년월일 형식 // 시작
		 var d = new Date();
		 var y = d.getFullYear();
		 var m = (d.getMonth() + 1);
		 var d = d.getDate();
		
		 // 날짜 포맷 맞추기
		 if(m < 10) m = '0' + m;
		 if(d < 10) d = '0' + d;
		
		 var birthday_y = parseInt(f.substr(0,4));
		 var birthday_m = f.substr(4,2);
		 var birthday_d = f.substr(6,2);
		 var birthday_md = f.substr(4,4);
		
		 if((parseInt(birthday_m) < 1 || parseInt(birthday_m) > 12) || (parseInt(birthday_d) < 1 || parseInt(birthday_d) > 31))
		 {
		  	alert('생년월일을 확인해 주세요.');
		  	return false;
		 }
		 //=== 확인 : 생년월일 형식 // 끝
		
		 return true;
	}

	function mobileAuth(){	// 모바일, 아이핀 인증 팝업
		var formObj = document.form1;
		window.open('', 'auth_popup', 'width=520, height=640');

		formObj.target = "auth_popup";
		formObj.submit();				
	};

	function ipinAuth(){	// 모바일, 아이핀 인증 팝업
		var formObj = document.form2;
		window.open('', 'auth_popup', 'width=520, height=640');

		formObj.target = "auth_popup";
		formObj.submit();				
	};
	
	function cardAuth(){	// 카드 인증 팝업
		var formObj = document.form3;
		window.open('', 'auth_popup', 'width=520, height=640');

		formObj.target = "auth_popup";
		formObj.submit();				
	};

	function returnMobileAuth(){
		$.ajax({
			type : 'POST',
			url : '/outsourcing/getPhoneAuthInfSMART.ajax',
			//data : $('#kcbResultForm').serialize(),
			success : function(r){
				if(r.authYn == "Y"){
					alert("판매자정보가 인증되었습니다.");
					$(".accreditPop").css("display","none");
					$("#checkAuth").val("Y");
					document.frm.name.focus;
				} else if (r.authYn == "R"){
					alert("동일한 CI값이 존재합니다. \n인증이 실패하였습니다.");
					$("#checkAuth").val("N");
					layerPopClose();
				} else if (r.authYn == "H"){
					alert("입력된 판매자 연락처와 인증된 연락처가 다릅니다. \n인증이 실패하였습니다.");
					$("#checkAuth").val("N");
					layerPopClose();
				}else {
					alert("판매자정보 인증이 실패하였습니다.");
					$("#checkAuth").val("N");
					layerPopClose();
				}
			},
			error : function(){
				$("#checkAuth").val("N");
				layerPopClose();
			}
		});
	}

	function returnIpinAuth(){
		$.ajax({
			type : 'POST',
			url : '/outsourcing/getIpinAuthInfSMART.ajax',
			//data : $('#kcbResultForm').serialize(),
			success : function(r){
				if(r.authYn == "Y"){
					alert("판매자정보가 인증되었습니다.");
					$(".accreditPop").css("display","none");
					$("#checkAuth").val("Y");
					document.frm.name.focus;
				} else if (r.authYn == "R"){
					alert("동일한 CI값이 존재합니다. \n인증이 실패하였습니다.");
					$("#checkAuth").val("N");
					layerPopClose();
				} else {
					alert("판매자정보 인증이 실패하였습니다.");
					$("#checkAuth").val("N");
					layerPopClose();
				}
			},
			error : function(){
				$("#checkAuth").val("N");
				layerPopClose();
			}
		});
	}
	
	function returnCardAuth(){
		$.ajax({
			type : 'POST',
			url : '/outsourcing/getCardAuthInfSMART.ajax',
			//data : $('#kcbResultForm').serialize(),
			success : function(r){
				if(r.authYn == "Y"){
					alert("판매자정보가 인증되었습니다.");
					$(".accreditPop").css("display","none");
					$("#checkAuth").val("Y");
					document.frm.name.focus;
				} else if (r.authYn == "R"){
					alert("동일한 CI값이 존재합니다. \n인증이 실패하였습니다.");
					$("#checkAuth").val("N");
					layerPopClose();
				} else {
					alert("판매자정보 인증이 실패하였습니다.");
					$("#checkAuth").val("N");
					layerPopClose();
				}
			},
			error : function(){
				$("#checkAuth").val("N");
				layerPopClose();
			}
		});
	}

	function goSave(){
		if($("#checkAuth").val()=="N"){
			alert("인증 확인처리가 완료 되지 않았습니다. 인증 후 처리해 주세요.");
			return;
		}

		var frm = document.frm;

		/*
		if(document.getElementById('checkAgentCd') != null){
			if(frm.agentCd.value == ""){
				alert("점코드를 입력하세요.");
				return;
			}else if($("#checkAgentCd").val() != frm.agentCd.value){
				alert("점코드 확인처리가 완료 되지 않았습니다. 점코드 확인 후 처리해주세요.");
				return;
			}
		}
		*/
		if(frm.prdctCd.value == ""){
			alert("상품 선택1을 선택하세요.");
			frm.prdctCd.focus();
			return;
		}

		if(frm.name.value == ""){
			alert("고객명을 입력하세요.");
			frm.name.focus();
			return;
		}

		if(frm.hp.value == ""){
			alert("고객 연락처(핸드폰)를 입력하세요.");
			frm.hp.focus();
			return;
		}

		if(frm.memo.value == ""){
			alert("메모를 입력하세요.");
			frm.memo.focus();
			return;
		}

		if (!frm.agree.checked) {
			alert("개인 정보 활용 동의에 체크해 주세요.");
			return;
		}

		if (!frm.agree2.checked) {
			alert("개인정보 제 3자 정보 제공 동의에 체크해 주세요.");
			return;
		}
		if(!confirm("진행하시겠습니까?"))
			return;

		var formObj = document.frm;
		formObj.action = "/outsourcing/insert.do";
		formObj.submit();
	}
</script>