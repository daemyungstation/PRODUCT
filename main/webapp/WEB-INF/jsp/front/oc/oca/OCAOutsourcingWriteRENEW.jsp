<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

<h2 style="font-size: 36px; color: #333; line-height: 36px; margin-bottom: 50px; font-family: 'NanumSquareB'; font-weight: normal;">${info.title}</h2>
<form name="insertForm" method="post" action="/EXPIRATION/insert.do">
	<input type="hidden" name="b2bStts" value="EXPIRATION" />
	<input type="hidden" name="expireRenewAccntName" id="chkProductName" />
	<input type="hidden" name="name" id="frmName" />
	<input type="hidden" name="birth" id="frmBirth" />
	<input type="hidden" name="hp" id="frmHp" />
	<input type="hidden" name="sex" id="frmSex" />

	<input type="hidden" name="expireRenewGiftNo" id="frmExpireRenewGiftNo" />
	<input type="hidden" name="expireRenewAccntNo" id="frmExpireRenewAccntNo" />
	<input type="hidden" name="zipcd" id="frmZipcd" />
	<input type="hidden" name="adr" id="frmAdr" />
	<input type="hidden" name="adrDtl" id="frmAdrDtl" />
	<input type="hidden" name="memNo" />
	<input type="hidden" name="trueCnt" />
	<!--
	<input type="hidden" name="expireRenewInflowroute" id="frmExpireRenewInflowroute" />
	<input type="hidden" name="cardName" id="frmCardName" />
	<input type="hidden" name="cardOwner" id="frmCardOwner" />
	<input type="hidden" name="cardNum" id="frmCardNum" />
	<input type="hidden" name="cardExpireYear" id="frmCardExpireYear" />
	<input type="hidden" name="cardExpireMonth" id="frmCardExpireMonth" />
	-->
</form>
	
	<div data-controller="CommonController OutsourcingController" id="divStep1">
	${step}
		<form name="step1">
		
			<p class="titTxt mt40">가입상품 확인하기</p>
			<div class="boardType2 mt15">
				<table summary="">
					<caption></caption>
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tbody>
					
						<tr>	
							<th scope="row"><span class="essen" title="필수입력">이름</span></th>
							<td>
								<input type="text" name="name" title="이름" placeholder="이름을 입력해주세요." class="inputType1" maxlength="10" />
							</td>
						</tr>
						<tr>	
							<th scope="row"><span class="essen" title="필수입력">휴대폰 번호</span></th>
							<td>
								<input type="text" name="tel" title="휴대폰 번호" placeholder="'-' 없이 입력하세요." class="inputType1 phoneChk" maxlength="13" />
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="essen" title="필수입력">생년월일</span></th>
							<td>
								<input type="text" name="birth" title="생년월일" class="inputType1 numberChk" placeholder="'-' 없이 입력하세요." maxlength="8" />
								&nbsp;&nbsp;
								<span class="red"> *생년월일 8자리(예시 : 19851119)</span>
							</td>
						</tr>
						<tr>	
							<th scope="row"><span class="essen" title="필수입력">성별</span></th>
							<td class="checkbox_list">
								<span class="list">
								  	<input type="radio" class="checkbox" name="genderTemp" value="0001" id="male" title="남성" checked="checked" onclick="javascript:document.getElementsByName('gender')[0].value = this.value;"><label for="male" >남</label>&nbsp;&nbsp;
							 	 </span>
							 	 <span class="list">
								  	<input type="radio" class="checkbox" name="genderTemp" value="0002" id="female" title="여성" onclick="javascript:document.getElementsByName('gender')[0].value = this.value;"><label for="female">여</label>
								</span>
							</td>
							<input type="hidden" name="gender" value="0001"/>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="mt30 taC">
				<a href="javascript:" class="btnRed" id="btnSearchUser" onClick="searchUserInfo();">검색</a>
				<input type="submit" style="display:none" />
			</div>
			
		</form>
		
		
		
		<div id="productsDiv">
		</div>
			
	</div>
	
	<form name="step3" method="post" action="" style="display:none;">
		
		<div data-controller="CommonController OutsourcingController" class="wrap_renew_write">
		
			<p class="titTxt mt40">선물 선택하기</p>
			<div class="boardType2 board_product_select mt15">
				<table summary="">
					<caption></caption>
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tbody>
						<tr>	
							<th scope="row"><span class="essen" title="필수입력">선물</span></th>
							<td>
								<select name="freeGift" class="inputType1" title="구매상품">
									<option value="0">상품을 선택해주세요.</option>
									<option value="2001">2년 : 모던하임 에어프라이어(3.5L)</option>
									<option value="2006">2년 : 쌤소나이트 DELAENO 백팩(그레이)</option>
									<option value="2002">2년 : 26형 캐리어(프레시민트)</option>
									<option value="2003">2년 : 26형 캐리어(콜드그레이)</option>
									<option value="2004">2년 : 26형 캐리어(스위트옐로우)</option>
									<option value="2007">2년 : 스위스몽크로스 가습기(4L)</option>
									<option value="2008">2년 : 스위스 몽크로스 미러오븐기(12L)</option>
									<option value="2005">2년 : 바디휴 무선 어깨 안마기</option>
									<option value="2009">2년 : HAZZYS 프라하 슬링백</option>
									<option value="2010">2년 : 기펠 프리마 인덕션</option>
									<option value="2011">2년 : 정관장 홍삼지감/정화액SET</option>
									<option value="1004">1년 : 퀸메이드 씨에로 32P 홈세트</option>
									<option value="1005">1년 : 황제황진환 골드</option>
									<option value="1006">1년 : FULL HD 방수 액션캠</option>
									<option value="1002">1년 : 세탁가능 전기요(더블)</option>
									<option value="1007">1년 : 한경희 스팀다리미</option>
									<option value="1008">1년 : 차량겸용 공기청정기(블랙)</option>
									<option value="1011">1년 : 차량겸용 공기청정기(화이트)</option>
									<option value="1009">1년 : 온풍기 팬히터</option>
									<option value="1010">1년 : 메모리폼 경추베개</option>
									<option value="1003">1년 : 일렉트로룩스 커피메이커</option>
									
								</select>
								<!-- <p class="product_price">가격 : <span id="giftPrice">0</span>원</p> -->
							</td>
						</tr>
						<!-- <tr>	
							<th scope="row"><span class="essen" title="필수입력">유입경로</span></th>
							<td>
								<select name="inflowRoute"  class="inputType1" title="유입경로">
									<option value="0">유입경로를 선택해주세요.</option>
									<option value="KAKAO">카카오페이지</option>
									<option value="HOMEPAGE">홈페이지</option>
									<option value="MMS">MMS(문자메세지)</option>
								</select>
							</td>
						</tr> -->
						
					</tbody>
				</table>
			</div>
			
			<p class="titTxt mt40">배송지 입력</p>
			<div class="boardType2 mt15">
				<table summary="">
					<caption></caption>
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tbody>
						<tr>	
							<th scope="row"><span class="essen" title="필수입력">주소</span></th>
							<td>
								<div>
									<input type="text" id="zipcd" name="zipcd" class="inputType3 add1 notRequired" maxlength="7" readonly="readonly" />
									<input type="text" name="adr" class="inputType5" maxlength="100" readonly="readonly" />
									<a href="javascript:" class="btn333" id="zipcode">우편번호 찾기</a>
								</div>
								<p class="mt10"><input type="text" name="adr_dtl" title="상세주소" class="inputType4" maxlength="100" placeholder="상세주소" /></p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<!-- <p class="titTxt mt40">결제정보 입력</p>
			<div class="boardType2 mt15">
				<table summary="">
					<caption></caption>
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tbody>
						<tr>	
							<th scope="row"><span class="essen" title="필수입력">카드</span></th>
							<td>
								
								  <input type="radio" name="gender" value="1" id="male" title="남성" checked="checked">
								  <span class="list checkbox_list">
								  <label for="male" >카드</label>&nbsp;&nbsp;
								</span>
							</td>
							
						</tr>
						<tr>	
							<th scope="row"><span class="essen" title="필수입력">카드사 선택</span></th>
							<td>
								<select name="cardName"  class="inputType1" title="카드사 선택">
									<option value="0">카드를 선택해주세요.</option>
									<option value="BC">비씨카드</option>
									<option value="KB">국민카드</option>
									<option value="SAMSUNG">삼성카드</option>
									<option value="HANA">하나카드</option>
									<option value="SHINHAN">신한카드</option>
									<option value="LOTTE">롯데카드</option>
									<option value="HYUNDAE">현대카드</option>
									<option value="NH">NH농협카드</option>
								</select>
							</td>
						</tr>
						<tr>	
							<th scope="row"><span class="essen" title="필수입력">명의자 이름</span></th>
							<td>
								<input type="text" id="cardOwner" name="cardOwner" class="inputType1 "/>
							</td>
						</tr>
						<tr>	
							<th scope="row"><span class="essen" title="필수입력">카드번호</span></th>
							<td>
								<input type="text" id="cardNum1" name="cardNum" class="inputType3 add1 numberChk" maxlength="4" />&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" id="cardNum2" name="cardNum" class="inputType3 add1 numberChk" maxlength="4" />&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" id="cardNum3" name="cardNum" class="inputType3 add1 numberChk" maxlength="4" />&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" id="cardNum4" name="cardNum" class="inputType3 add1 numberChk" maxlength="4" />&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
						<tr>	
							<th scope="row"><span class="essen" title="필수입력">유효기간</span></th>
							<td>
								<input type="text" id="cardNumYear" name="cardNum" class="inputType3 add1 numberChk" maxlength="2" />&nbsp;&nbsp;년&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" id="cardNumMonth" name="cardNum" class="inputType3 add1 numberChk" maxlength="2" />&nbsp;&nbsp;월&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</tbody>
				</table>
			</div> -->
			<div class="termDiv mt40">
				<button type="button" class="check" style="position:relative" id="allAgree">
					<img src="/common/images/btn/check_bt.gif" alt="체크">
					<strong>전체동의

						</strong>
				</button>
				<input type="checkbox" style="display:none">
			</div>
			
			<div class="termDiv mt40">
				<button type="button" class="check checkBtn" style="position:relative">
					<img src="/common/images/btn/check_bt.gif" alt="체크">
					<strong>만기연장 신청 동의  <em>[필수]</em></strong>
				</button>
				<input type="checkbox" name="agree" class="agree" style="display:none">
				<div class="boardType2 mt15">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="" title="구분">구분</span></th>
								<th scope="row"><span class="" title="만기연장 신청 이동동의 사항">
										만기연장 신청 이용동의 사항
										</span>
								</th>
							</tr>
							<tr>
								<td>신청내용</td>
								<td>연장 기간 동안 추가 납입금 없이 가입하신 상조 상품의 만기 일자(회차)를 1년 또는 2년 연장합니다. 
									<p class="txt_blue">※만기 시에는 납입금의 100%를 환급해 드립니다.</p>
									※1년 연장 예시 : 기존 만기일 2030년 2월 1일 → 연장 만기일 2031년 2월 1일</td>
							</tr>
							<tr>
								<td>제공 혜택</td>
								<td>
									회원님께서 신청하신 상품을 별도 비용 없이 제공합니다.
								</td>
							</tr>
							<tr>
								<td>기존 계약</td>
								<td>만기 일자(회차) 연장 외에 기존 상조서비스에 관한 계약 조건은 동일합니다.</td>
							</tr>
							<tr>
								<td>만기 또는 중도해약</td>
								<td>
								<p class="txt_blue">만기 시에는 납입금의 100%를 환급 받으실 수 있습니다.</p>
								다만, 만기 일자(회차) 연장 기간 중 중도 해약 시에는 상조서비스 회원 약관 규정에 따라<br>
								실상조 납입금의 85%를 환급 받으실 수 있습니다.<br>
								환급금은 서류접수일로부터 3영업일 이내 수령 가능합니다. 
								</td>
							</tr>
							<tr>
								<td>청약철회</td>
								<td>청약철회는 만기연장 신청일로부터 14일 이내에 가능하며, 신청 상품 수령 후에는 손상 없는 상태로 상품을 반환(배송료 발생 시 고객 부담)하여야 합니다. 
								상조 계약 조건 및 기간은 만기 연장 서비스 신청 전과 동일하게 재변경되어 유지됩니다.
								신청 상품의 개봉, 설치, 멸실, 훼손, 제품 사용, 청약철회 기간 경과 후 단순 변심으로 인한 청약철회(계약 취소),
								교환 및 반품은 불가합니다. 
								단, 상품의 하자/불량으로 인한 청약철회(계약 취소), 교환 및 반품은 가능합니다. 

								</td>
							</tr>
							
						</tbody>
					</table>
					<!-- <div id="info" class="desc_import" style="white-space:pre-line">
						※ 연장기간 중, 중도 해지 시에는 공정거래위원회 선불식 할부계약의 해약환급금 산정기준 고시에 따라 고객님께서 실제 납부하신 실 상조 납입금의 85%를 환급해드립니다.
					</div> -->
				</div>
			</div>
		
			<!-- <div class="termDiv mt40">
				<button type="button" class="check checkBtn" style="position:relative">
					<img src="/common/images/btn/check_bt.gif" alt="체크">
					<strong>결제 및 배송 규정 동의  <em>[필수사항]</em></strong>
					
				</button>
				<input type="checkbox" name="agree" class="agree" style="display:none">
				<div class="boardType2 mt15">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="" title="구분">구분</span></th>
								<th scope="row"><span class="" title="만기 연장 서비스 사항">만기 연장 서비스 사항</span></th>
							</tr>
							<tr>
								<td>결제</td>
								<td>
									결제가 필요한 상품 선택 시 표기되는 해당 금액(부가가치세 포함)으로 구매 가능.<br>
									신청 완료 후 5 영업일 이내 카드 결제
								</td>
							</tr>
							<tr>
								<td>배송</td>
								<td>신청 완료 후 약 2~3주 소요</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="termDiv mt40">
				<button type="button" class="check checkBtn" style="position:relative">
					<img src="/common/images/btn/check_bt.gif" alt="체크">
					<strong>청약 철회 규정 동의  <em>[필수사항]</em></strong>
				</button>
				<input type="checkbox" name="agree" class="agree" style="display:none">
				<div class="boardType2 mt15">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="" title="구분">구분</span></th>
								<th scope="row"><span class="" title="만기 연장 서비스 사항">청약철회 내용(전자상거래법 제17조, 제18조)</span></th>
							</tr>
							<tr>
								<td>청약철회/반품</td>
								<td>
									상품의 하자/불량으로 인한 계약취소 및 반품 가능<br>
									단, (1)상품의 멸실, 훼손 (2)제품 사용 (3)청약철회 기간 경과한 경우, 계약 취소 및 반품 불가
								</td>
							</tr>
							<tr>
								<td>청약철회 가능기간</td>
								<td>상품 수령일로부터 14일 이내</td>
							</tr>
							<tr>
								<td>청약철회 시 규정</td>
								<td>
									배송 받은 상품은 손상 없는 상태로 반환 필수(반품 배송료 고객 부담)<br>
									기존 상조계약 조건 및 계약기간은 원복, 결제의 환불
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div> -->
		
			<div class="termDiv mt40">
				<button type="button" class="check checkBtn" style="position:relative">
					<img src="/common/images/btn/check_bt.gif" alt="체크">
					<strong>개인정보의 수집 및 이용동의<em> [필수]</em></strong>
					
				</button>
				<input type="checkbox" name="agree" class="agree" style="display:none">
				<div class="boardType2 mt15">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="" title="구분">구분</span></th>
								<th scope="row">
									<span class="" title="개인정보의 수집 및 이용동의 사항">개인정보의 수집 및 이용동의 사항
									</span>
								</th>
							</tr>
							<tr>
								<td>수집 항목</td>
								<td>
									성명, 생년월일, 성별, 연락처, 수령인 성명, 수령인 연락처, 배송지 주소

								</td>
							</tr>
							<tr>
								<td>수집 목적</td>
								<td>㈜대명스테이션 대명아임레디 상품 가입여부 확인, 본인인증, 만기 연장 서비스 신청에 따른 거래 관계 설정 및 유지, 신청 상품 제공, 상조 회원에 대한 공지사항 전달, 회원 민원 및 불편사항 처리, 기타 개인 맞춤서비스 제공을 위한 자료로 이용 
									</td>
							</tr>
							<tr>
								<td>이용기간</td>
								<td>개인정보 수집 및 이용목적 달성 시 또는 탈퇴 시까지<br>
									※ 탈퇴 시를 기점으로 충분한 법률적 근거가 있을 경우 관계 법령에 적시된 보존기간(5년)동안 보존
									</td>
							</tr>
						</tbody>
					</table>
					<div id="info" style="white-space:pre-line">
						※회원님께서는 개인정보의 수집 및 이용 동의를 거부하실 수 있으며, 거부하시는 경우 만기연장 신청이 불가합니다.

					</div>
				</div>
			</div>
		
			<div class="termDiv mt40">
				<button type="button" class="check checkBtn" style="position:relative">
					<img src="/common/images/btn/check_bt.gif" alt="체크">
					<strong>개인정보 처리 위탁 동의 <em>[필수]</em></strong>
				</button>
				<input type="checkbox" name="agree" class="agree" style="display:none">
				<div class="boardType2 mt15">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="" title="수탁자">수탁자</span></th>
								<th scope="row"><span class="" title="위탁업무의 목적(내용)">위탁업무의 목적(내용)</span></th>
							</tr>
							<tr>
								<td>협력사</td>
								<td>
									주문자 확인, 상품 발송 및 배송관리, 고객상담(AS, 민원) 등<br>
									<a href="https://imreadymall.com/company/seller_list.php" target="_blank" style="color:#bfbfbf;margin-top:7px;display: block;">
									[협력사 리스트]</a>
								</td>
							</tr>
							<tr>
								<td>택배사</td>
								<td>
									상품 배송 및 배송 정보 제공
								</td>
							</tr>
							<tr>
								<td>㈜포비즈코리아, ㈜코리아서버호스팅</td>
								<td>
									고객정보 DB시스템 위탁 운영(전산아웃소싱)
								</td>
							</tr>
							<!-- 
							<tr>
								<td>㈜포비즈코리아, ㈜코리아서버호스팅</td>
								<td>
									고객정보 DB시스템 위탁 운영(전산아웃소싱)
								</td>
							</tr> -->
							<tr>
								<td>㈜인포뱅크,<br> ㈜CJ올리브네트웍스</td>
								<td>
									문자 발송 관련
								</td>
							</tr>
							<tr class="td_col_1">
								<td colspan="2">
									보유기간 : 회원탈퇴시까지
								</td>
							</tr>
						</tbody>
					</table>
					<div id="info2" style="white-space:pre-line">
						※회원님께서는 개인정보 처리 위탁 동의를 거부하실 수 있으며, 거부하시는 경우 만기연장 신청이 불가합니다.

					</div>
					<div class="termDiv mt40">
						<strong class="tit"	>
						본인은 위 동의 내용에 따라 가입하신 상품의 만기 일자(회차) 연장을 신청하는데 동의합니다. 
						</strong>
					</div>
				</div>
			</div>
		
			
			
		</div>
		
		<div class="mt30 taC">
			<a href="javascript:" class="btnRed" id="btnEnd" onClick="register();">신청하기</a>
			<input type="button" style="display:none" />
		</div>
			
	</form>

<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
    if(!wcs_add) var wcs_add = {};
    wcs_add["wa"] = "129fa8e869128c";
    wcs_do();
</script>
	
	
<script type="text/javascript">

	window.onpopstate = function(e) {
	    console.log('onpopstate');
		document.getElementById('divStep1').style.display = '';
		document.forms['step3'].style.display = 'none';
		document.forms['step3'].reset();
		var agrees = document.getElementsByName('agree');
		var img = document.forms.step3.getElementsByTagName('img');
		for (var i = 0; i < agrees.length; i++) {
			agrees[i].checked = false;
			img[i].src = "/common/images/btn/check_bt.gif";
		}
	}

	window.onload = function() {
        // document.getElementById('allCheckBtn').addEventListener('click', function(e) {
        //     console.log('click2');
        //     if (!document.getElementById('chkAllAgree').checked) {
        //         for (var i = 0; i < document.step3.agree.length; i++) {
        //             document.step3.agree[i].checked = true;
        //             document.getElementsByName('agree')[i].closest('div').getElementsByTagName('img')[0].src = '/common/images/btn/check_bt_on.gif';
        //         }
        //     } else {
        //         for (var i = 0; i < document.step3.agree.length; i++) {
        //             document.step3.agree[i].checked = false;
        //             document.getElementsByName('agree')[i].closest('div').getElementsByTagName('img')[0].src = '/common/images/btn/check_bt.gif';
        //         }
        //     }
        // });
	};

	function searchUserInfo() {
		document.forms['step3'].style.display = 'none';
		document.forms['step3'].reset();
		var agrees = document.getElementsByName('agree');
		var img = document.forms.step3.getElementsByTagName('img');
		for (var i = 0; i < agrees.length; i++) {
			agrees[i].checked = false;
			img[i].src = "/common/images/btn/check_bt.gif";
		}
		
		var nameEl = document.forms['step1'].elements['name'];
		var telEl = document.forms['step1'].elements['tel'];
		var birthEl = document.forms['step1'].elements['birth'];
		var genderEl = document.getElementsByName('gender')[0].value;
		
		if (nameEl.value.trim() == "") {
			alert("성명을 입력하세요.");
			nameEl.focus();
			return;
		} else if (telEl.value.trim() == "") {
			alert("휴대폰 번호를 입력하세요.");
			telEl.focus();
			return;
		} else if (birthEl.value.trim() == "") {
			alert("생년월일을 입력하세요.");
			birthEl.focus();
			return;
		}
		
		jQuery.ajax({
			url : "/outsourcing/userCheck.ajax",
			type : "post",
			data : {
				"name": nameEl.value,
				"hp": telEl.value,
				"birth": birthEl.value,
				"gender": genderEl.value,
				"deleteFlag": 'N',
				"join": 'N'
			},
			success : function(r) {
				console.log(r);
				if (r.EXPIRE) {
					alert("우리 계속 친구해요 이벤트가 마감 되었습니다.");
				} else {
					document.getElementById('productsDiv').innerHTML = r;
				}
			},
			error : function(e) {
				console.log('fail :: ', e);
			}
		});
	}
	
	function selectProduct(e) {
		document.getElementById('chkProductName').value = jQuery(e).closest('tr').find('td')[1].innerText;
		document.forms['insertForm'].trueCnt.value = e.getAttribute('data-totalCnt');
		document.forms['insertForm'].expireRenewAccntNo.value = e.value;
    }
	
	function selectGoods() {
		if (document.querySelector('input[name="chkProducts"]:checked') != null) {
			document.forms['step3'].reset();
			var agrees = document.getElementsByName('agree');
			var img = document.forms.step3.getElementsByTagName('img');
			for (var i = 0; i < agrees.length; i++) {
				agrees[i].checked = false;
				img[i].src = "/common/images/btn/check_bt.gif";
			}
			document.getElementById('divStep1').style.display = 'none';
			document.forms['step3'].style.display = '';
			history.pushState(null, null, '/EXPIRATION/write.do?step=2');
			jQuery(window).scrollTop(0);
		} else {
			alert("가입 상품을 선택해주세요.");
		}
	}
	
	// function onChangeGift(e) {
	// 	if (e.value == 1) document.getElementById('giftPrice').innerText = "9,900";
	// 	else document.getElementById('giftPrice').innerText = "0";
	// }
	
	function register() {
		var nameEl = document.forms['step1'].elements['name'];
		var telEl = document.forms['step1'].elements['tel'];
		var birthEl = document.forms['step1'].elements['birth'];
		var genderEl = document.getElementsByName('gender')[0];
		var freeGift = document.forms['step3'].elements['freeGift'];
		// var inflowRoute = document.forms['step3'].elements['inflowRoute'];
		var zipcd = document.forms['step3'].elements['zipcd'];
		var adr = document.forms['step3'].elements['adr'];
		var adrDtl = document.forms['step3'].elements['adr_dtl'];
		// var cardName = document.forms['step3'].elements['cardName'];
		// var cardOwner = document.forms['step3'].elements['cardOwner'];
		// var cardNum1 = document.forms['step3'].elements['cardNum1'];
		// var cardNum2 = document.forms['step3'].elements['cardNum2'];
		// var cardNum3 = document.forms['step3'].elements['cardNum3'];
		// var cardNum4 = document.forms['step3'].elements['cardNum4'];
		// var cardNumYear = document.forms['step3'].elements['cardNumYear'];
		// var cardNumMonth = document.forms['step3'].elements['cardNumMonth'];
        // var accntNo = document.querySelector('input[name="chkProducts"]:checked');
        var agrees = document.forms['step3'].elements['agree'];
        var memNo = document.forms['step2'].elements['memNo'];

		if (freeGift.value == 0) {
			alert("구매상품을 선택해주세요.");
			freeGift.focus();
			return;
		}
		// if (inflowRoute.value == 0) {
		// 	alert("유입경로를 선택해주세요.");
		// 	inflowRoute.focus();
		// 	return;
		// }
		if (zipcd.value == "" || adr.value.trim() == "") {
			alert("주소를 입력해주세요.");
			adr.focus();
			return;
		}
		if (adrDtl.value.trim() == "") {
			alert("상세주소를 입력해주세요.");
			adrDtl.focus();
			return;
		}

		// if (cardName.value == 0) {
		// 	alert("카드를 선택해주세요.");
		// 	cardName.focus();
		// 	return;
		// }
		// if (cardOwner.value.trim() == "") {
		// 	alert("명의자를 입력해주세요.");
		// 	cardOwner.focus();
		// 	return;
		// }
		// if (cardNum1.value.trim() == "" || cardNum2.value.trim() == "" || cardNum3.value.trim() == "" || cardNum4.value.trim() == "") {
		// 	alert("카드번호를 입력해주세요.");
		// 	cardNum1.focus();
		// 	return;
		// }
		// if (cardNumYear.value.trim() == "" || cardNumMonth.value.trim() == "") {
		// 	alert("카드 유효기간을 입력해주세요.");
		// 	cardNumYear.focus();
		// 	return;
		// }

		for (var i = 0; i < agrees.length; i++) {
			if (!agrees[i].checked) {
				alert('필수사항을 체크하세요.');
				jQuery('.checkBtn')[i].focus();
				return;
			}
		}
		
		document.getElementById('frmName').value = nameEl.value;
		document.getElementById('frmBirth').value = birthEl.value;
		document.getElementById('frmHp').value = telEl.value;
		document.getElementById('frmSex').value = genderEl.value;
        // document.getElementById('frmExpireRenewAccntNo').value = accntNo.value;
        // document.getElementById('frmExpireRenewInflowroute').value = inflowRoute.value;
		document.getElementById('frmExpireRenewGiftNo').value = freeGift.value;
		document.getElementById('frmZipcd').value = zipcd.value;
		document.getElementById('frmAdr').value = adr.value;
		document.getElementById('frmAdrDtl').value = adrDtl.value;
        document.forms['insertForm'].memNo.value = memNo.value;
		// document.getElementById('frmCardName').value = cardName.value;
		// document.getElementById('frmCardOwner').value = cardOwner.value;
		// document.getElementById('frmCardNum').value = cardNum1.value + "" + cardNum2.value + "" + cardNum3.value + "" + cardNum4.value;
		// document.getElementById('frmCardExpireYear').value = cardNumYear.value;
		// document.getElementById('frmCardExpireMonth').value = cardNumMonth.value;
		console.log(document.forms['insertForm']);
		document.forms['insertForm'].submit();
	}
	
</script>
