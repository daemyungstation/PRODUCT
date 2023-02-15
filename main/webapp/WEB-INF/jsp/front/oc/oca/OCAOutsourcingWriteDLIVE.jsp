<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

<h2 style="font-size: 36px; color: #333; line-height: 36px; margin-bottom: 50px; font-family: 'NanumSquareB'; font-weight: normal;">${info.title}</h2>

<form name="frm" method="post" action="/outsourcing/insert.do">
	<input type="hidden" name="b2bStts" value="${info.b2bStts}" />
	<input type="hidden" name="b2bCd" value="${info.b2bCd}" class="notRequired" />
	<input type="hidden" name="b2bNm" value="${info.b2bNm}" class="notRequired" />

	<div data-controller="CommonController OutsourcingController">
		<c:if test="${info.agentInfoYn eq 'Y'}">
			<b style="color: red"> ● 유치자 사번, 성명, 연락처는 정확하게 입력해주세요. (정보 오류 시 수당 및 프로모션 혜택 지급이 불가합니다.) </b>
			<p class="titTxt mt40">유치자 정보 입력</p>
			<div class="boardType2 mt15">
				<table summary="">
					<caption></caption>
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tbody>
					<!-- 멤버십 블루 선불카드번호 입력란 -->
					<c:if test="${info.prepaidCardNumYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">멤버십 블루<br>선불카드번호</span></th>
							<td>
								<input type="text" name="prepaidCardNum" title="선불카드 번호" class="inputType1 numberChk" maxlength="8" />
								<span class="red">※ 뒤 8자리</span>
							</td>
						</tr>
					</c:if>

					<!-- 판매자 소속 입력란 -->
					<c:if test="${info.sllrPartYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">소속</span></th>
							<td>
								<input type="radio" name="sllrPart" value="딜라이브" id="sllrPart1" title="소속" checked> <label for="sllrPart1" >딜라이브</label>&nbsp;
								<input type="radio" name="sllrPart" value="사업단" id="sllrPart2" title="소속"> <label for="sllrPart2" >사업단</label>&nbsp;
								<input type="radio" name="sllrPart" value="CS센터" id="sllrPart3" title="소속"> <label for="sllrPart3" >CS센터</label>&nbsp;
								<input type="radio" name="sllrPart" value="콜센터" id="sllrPart4" title="소속"> <label for="sllrPart4" >콜센터</label>&nbsp;<br>
								<input type="radio" name="sllrPart" value="파트너사" id="sllrPart5" title="소속"> <label for="sllrPart5" >파트너사</label>&nbsp;
								<input type="radio" name="sllrPart" value="온라인" id="sllrPart6" title="소속"> <label for="sllrPart6" >온라인</label>&nbsp;
								<input type="radio" name="sllrPart" value="유통" id="sllrPart7" title="소속"> <label for="sllrPart7" >유통</label>&nbsp;
								<input type="radio" name="sllrPart" value="기타" id="sllrPart8" title="소속"> <label for="sllrPart8" >기타</label>&nbsp;
							</td>
						</tr>
					</c:if>

					<!-- 판매자 번호 입력란 -->
					<c:if test="${info.sllrNumYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">사번 or ID</span></th>
							<td>
								<input type="text" name="sllrNum" title="판매자 번호" class="inputType1" maxlength="20" />
							</td>
						</tr>
					</c:if>

					<!-- 대리점명 입력란 -->
					<c:if test="${info.agentNmYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">지점명</span></th>
							<td>
								<input type="hidden" name="agentNm" title="대리점명 0" class="inputType1" maxlength="20" />
								<input class="agentNmOptions agentNm_7 agentNmText notRequired" type="text" name="agentNmText" title="대리점명 1" class="inputType1" maxlength="20" style="display: none" />
								<select class="agentNmSelect notRequired" name="agentNmSelect"  class="inputType1" title="대리점명 2">
									<option class="" value="">선택하세요</option>
									<option class="agentNmOptions agentNm_0" value="딜라이브">딜라이브</option>
								</select>

							</td>
						</tr>
					</c:if>

					<!-- 판매사원 성명 입력란 -->
					<c:if test="${info.agentEmpNmYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">성명</span></th>
							<td>
								<input type="text" name="agentEmpNm" title="판매사원명" class="inputType1" maxlength="20" />
							</td>
						</tr>
					</c:if>

					<!-- 판매자 연락처 입력란 -->
					<c:if test="${info.sllrCtelYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">연락처</span></th>
							<td>
								<input type="text" name="sllrCtel" title="판매자 연락처" class="inputType1 phoneChk" maxlength="13" />
							</td>
						</tr>
					</c:if>
					</tbody>
				</table>

				<!-- 안내사항 표시란 -->
				<c:if test="${info.infoYn eq 'Y'}">
					<div id="info" style="white-space:pre-line">
							${info.info}
					</div>
				</c:if>
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


					<!-- 고객명 입력란 -->
					<c:if test="${info.nameYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">고객명</span></th>
							<td>
								<input type="text" name="name" title="고객명" class="inputType1" maxlength="20" />
								<span class="red" style="padding-left: 2em">  * 고객 정보 확인 후 정확하게 입력해주세요.</span>
							</td>
						</tr>
					</c:if>

					<!-- 고객 고유번호 입력란 -->
					<c:if test="${info.cstmrUnqNumYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">고객 고유번호</span></th>
							<td>
								<input type="text" name="cstmrUnqNum" title="고객 고유번호" class="inputType1 lengthChk" />
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
					<!-- 상품1 선택란 -->
					<c:if test="${info.prdctNmYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">상품회차 구분</span></th>
							<td>
								<c:forEach var="list" items="${prdctList.product}">
								<input type="radio" name="prdctCd" value="${list.cd}" id="prdctCd_${list.cd}" title="상품" ><label for="prdctCd_${list.cd}" >${list.cdNm}</label>&nbsp;
								</c:forEach>
							</td>
						</tr>
					</c:if>

					<!-- 가입 희망 구좌 -->
					<c:if test="${info.mainContTypeYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">주 계약</span></th>
							<td>
								<input type="radio" name="mainContType" value="여행" id="mainContType2" title="주 계약" checked> <label for="mainContType2" >여행</label>&nbsp;
								<input type="radio" name="mainContType" value="크루즈" id="mainContType3" title="주 계약"> <label for="mainContType3">크루즈</label>&nbsp;
								<input type="radio" name="mainContType" value="어학연수" id="mainContType5" title="주 계약"> <label for="mainContType5" >어학연수</label>&nbsp;
								<input type="radio" name="mainContType" value="골프" id="mainContType4" title="주 계약"> <label for="mainContType4" >골프</label>
								<input type="radio" name="mainContType" value="상조" id="mainContType1" title="주 계약" > <label for="mainContType1" >상조</label>&nbsp;
								<span class="red" style="padding-left: 2em">  * 고객이 상담 받길 희망하는 주 계약을 선택해주세요.</span>
							</td>

						</tr>
					</c:if>

					<!-- 가입구좌 입력란 -->
					<c:if test="${info.joinProdYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">가입구좌</span></th>
							<td>
								<input type="radio" name="joinProd" value="1구좌" id="joinProd1" title="가입구좌"> <label for="joinProd1" >1구좌</label>&nbsp;&nbsp;
								<input type="radio" name="joinProd" value="2구좌" id="joinProd2" title="가입구좌"> <label for="joinProd2">2구좌</label>
							</td>
						</tr>
					</c:if>

					<!-- 상담 가능 시간대 입력란 -->
					<c:if test="${info.calltimeYn eq 'Y'}">
						<tr>
							<th scope="row"><span class="essen" title="필수입력">상담 희망 시간대</span></th>
							<td>
								<select name="calltime" class="inputType1" title="상담 가능 시간대">
									<option value="빠른상담">빠른상담</option>
									<option value="10:00 ~ 12:00">10:00 ~ 12:00</option>
									<option value="12:00 ~ 14:00">12:00 ~ 14:00</option>
									<option value="14:00 ~ 16:00">14:00 ~ 16:00</option>
									<option value="16:00 ~ 18:30">16:00 ~ 18:30</option>
								</select>
							</td>
						</tr>
					</c:if>

					<!----------------------------------------------------------------------------------->

					<!-- 상품2 선택란 -->
					<c:if test="${info.prdctNm2Yn eq 'Y'}">
						<tr>
							<th scope="row"><span>상품 선택2</span></th>
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

					<!-- 메모 입력란 -->
					<c:if test="${info.memoYn eq 'Y'}">
						<tr>
							<th scope="row"><span style="padding-left:0;">메모</span><span style="display: block;font-size: 12px;color: #b12b1d;padding-top: 8px;padding-left:0;">※글자수 250자 제한</span></th>
							<td>
								<textarea name="memo" title="메모" class="inputType4 notRequired" style="height:60px;" maxlength="250" placeholder="특이사항 기재"></textarea>
								<span class="max_counter">0/250</span>
							</td>
						</tr>
					</c:if>
					</tbody>
				</table>

				<!-- 고객정보 안내사항 표시란 -->
				<c:if test="${info.cinfoYn eq 'Y'}">
					<div id="cinfo" style="white-space:pre-line">
							${info.cinfo}
					</div>
				</c:if>
			</div>
		</c:if>

		<!-- 개인 정보 활용 동의 표시란 -->
		<c:if test="${info.termsYn eq 'Y'}">
			<div class="termDiv mt40">
				<p class="tit">개인 정보 수집∙이용 동의 (필수)</p>
				<button type="button" class="check checkBtn">
					<strong>동의합니다.</strong>
					<img src="/common/images/btn/check_bt.gif" alt="체크">
				</button>
				<input type="checkbox" name="agree" class="agree" style="display:none" />

				<div class="termBox">
						${info.terms}
				</div>
			</div>
		</c:if>

		<div class="mt30 taC">
			<a href="javascript:" class="btnRed" id="submit">신청</a>
			<input type="submit" style="display:none" />
		</div>
	</div>
</form>

<script type="text/javascript">
	// var validator = $("input[name='frm']").validate({
	// 	rules: {
	// 		cstmrUnqNum: { required: true, minlength: 10, maxlength: 10}
	// 	},
	// 	messages: {
	// 		cstmrUnqNum: { required: "고객 고유번호는 필수값입니다."
	// 			, minlength: "고객 고유번호는 10자리입니다.\n다시 한번 확인해 주세요"
	// 			, maxlength: "고객 고유번호는 10자리입니다.\n다시 한번 확인해 주세요"
	// 		}
	// 	}
	// });
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

		$('input[name=sllrPart]').change( function(e) {
			$('input[name="agentNm"]').val('');
			$('input[name="agentNmText"]').val('');
			$('.agentNmSelect option:eq(0)').attr('selected', 'selected');
			if( e.target.value == "기타") {
				$('.agentNm_7').show();
				$('.agentNmSelect').hide();
				return;
			}
			$('.agentNmText').hide();
			$('.agentNmSelect').show();
			$('.agentNmSelect').html('');
			switch (e.target.value) {
				case "딜라이브":
					$('.agentNm_0').show();
					$('.agentNmSelect').append('<option class="" value="">선택하세요</option>'
							+ '<option class="agentNmOptions agentNm_0" value="딜라이브">딜라이브</option>');

					break;
				case "사업단":
					$('.agentNm_1').show();
					$('.agentNmSelect').append('<option class="" value="">선택하세요</option>'
					+ '<option class="agentNmOptions agentNm_1" value="강남/강동">강남/강동</option>'
					+ '<option class="agentNmOptions agentNm_1" value="강남/송파">강남/송파</option>'
					+ '<option class="agentNmOptions agentNm_1" value="강북/노원">강북/노원</option>'
					+ '<option class="agentNmOptions agentNm_1" value="강북/중랑">강북/중랑</option>'
					+ '<option class="agentNmOptions agentNm_1" value="강북/성북">강북/성북</option>'
					+ '<option class="agentNmOptions agentNm_1" value="강북/성동광진">강북/성동광진</option>'
					+ '<option class="agentNmOptions agentNm_1" value="중부/구로금천">중부/구로금천</option>'
					+ '<option class="agentNmOptions agentNm_1" value="중부/용산">중부/용산</option>'
					+ '<option class="agentNmOptions agentNm_1" value="중부/마포">중부/마포</option>'
					+ '<option class="agentNmOptions agentNm_1" value="중부/서대문">중부/서대문</option>'
					+ '<option class="agentNmOptions agentNm_1" value="중부/종로중구">중부/종로중구</option>'
					+ '<option class="agentNmOptions agentNm_1" value="동부/경동">동부/경동</option>'
					+ '<option class="agentNmOptions agentNm_1" value="북부/우리">북부/우리</option>'
					+ '<option class="agentNmOptions agentNm_1" value="서부/경기">서부/경기</option>'
					+ '<option class="agentNmOptions agentNm_1" value="신축">신축</option>');
					break;
				case "CS센터":
					$('.agentNm_2').show();
					$('.agentNmSelect').append('<option class="" value="">선택하세요</option>	<option class="agentNmOptions agentNm_2" value="강남CS/강남">강남CS/강남</option>'
							+ '<option class="agentNmOptions agentNm_2" value="강남CS/강동">강남CS/강동</option>'
					+ '<option class="agentNmOptions agentNm_2" value="강남CS/송파">강남CS/송파</option>'
					+ '<option class="agentNmOptions agentNm_2" value="강북CS/노원">강북CS/노원</option>'
					+ '<option class="agentNmOptions agentNm_2" value="강북CS/중랑">강북CS/중랑</option>'
					+ '<option class="agentNmOptions agentNm_2" value="강북CS/성북">강북CS/성북</option>'
					+ '<option class="agentNmOptions agentNm_2" value="강북CS/성동광진">강북CS/성동광진</option>'
					+ '<option class="agentNmOptions agentNm_2" value="중부CS/구로금천">중부CS/구로금천</option>'
					+ '<option class="agentNmOptions agentNm_2" value="중부CS/용산">중부CS/용산</option>'
					+ '<option class="agentNmOptions agentNm_2" value="중부CS/마포">중부CS/마포</option>'
					+ '<option class="agentNmOptions agentNm_2" value="중부CS/서대문">중부CS/서대문</option>'
					+ '<option class="agentNmOptions agentNm_2" value="중부CS/종로중구">중부CS/종로중구</option>'
					+ '<option class="agentNmOptions agentNm_2" value="동부CS/경동">동부CS/경동</option>'
					+ '<option class="agentNmOptions agentNm_2" value="북부CS/우리">북부CS/우리</option>'
					+ '<option class="agentNmOptions agentNm_2" value="동부CS/경기">동부CS/경기</option>');
					break;
				case "콜센터":
					$('.agentNm_3').show();
					$('.agentNmSelect').append('<option class="" value="">선택하세요</option> 				<option class="agentNmOptions agentNm_3" value="딜라이브텔레웍스">딜라이브텔레웍스</option>'
							+ '<option class="agentNmOptions agentNm_3" value="효성ITX">효성ITX</option>');
					break;
				case "파트너사":
					$('.agentNm_4').show();
					$('.agentNmSelect').append('<option class="" value="">선택하세요</option> <option class="agentNmOptions agentNm_4" value="마포/중앙케이블네트워크">마포/중앙케이블네트워크</option>'
							+ '<option class="agentNmOptions agentNm_4" value="경동/모아넷">경동/모아넷</option>'
					+ '<option class="agentNmOptions agentNm_4" value="우리/이엔에스네트워크">우리/이엔에스네트워크</option>'
					+ '<option class="agentNmOptions agentNm_4" value="경기/신호네트워크">경기/신호네트워크</option>');
					break;
				case "온라인":
					$('.agentNm_5').show();
					$('.agentNmSelect').append('<option class="" value="">선택하세요</option> 			<option class="agentNmOptions agentNm_5" value="넷코리아">넷코리아</option>'
							+ '<option class="agentNmOptions agentNm_5" value="상생방송">상생방송</option>'
							+ '<option class="agentNmOptions agentNm_5" value="한성FDS">한성FDS</option>');
					break;
				case "유통":
					$('.agentNm_6').show();
					$('.agentNmSelect').append('<option class="" value="">선택하세요</option> 	<option class="agentNmOptions agentNm_6" value="NJ컴퍼니">NJ컴퍼니</option>'
							+ '<option class="agentNmOptions agentNm_6" value="라인 네트워크">라인 네트워크</option>'
					+ '<option class="agentNmOptions agentNm_6" value="미리내 정보통신">미리내 정보통신</option>'
					+ '<option class="agentNmOptions agentNm_6" value="엔에스네트웍스">엔에스네트웍스</option>'
					+ '<option class="agentNmOptions agentNm_6" value="원네트워크">원네트워크</option>'
					+ '<option class="agentNmOptions agentNm_6" value="제이에이FD">제이에이FD</option>'
					+ '<option class="agentNmOptions agentNm_6" value="경성네트웍">경성네트웍</option>'
					+ '<option class="agentNmOptions agentNm_6" value="제이컴페니언">제이컴페니언</option>');
					break;
				case "기타":
					$('.agentNm_7').show();
					$('.agentNmSelect').hide();
					break;
			}
		});
		$('.agentNmSelect,  .agentNmText').change( function(e) {
			e.preventDefault();
			$('input[name="agentNm"]').val(e.target.value);
			$('input[name="agentNmText"]').val(e.target.value);
		});
		$('.agentNmText').hide();
	});
</script>