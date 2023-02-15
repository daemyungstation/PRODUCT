<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

<h2 style="font-size: 36px; color: #333; line-height: 36px; margin-bottom:20px; font-family: 'NanumSquareB'; font-weight: normal;">${info.title}</h2>
<p class="red">&lt; 본 접수 페이지는 모바일 전용 접수 페이지로 일반 가전제품 상품 구매 시에는 기존의 가전제품 전용 접수 페이지로 접속해주시기 바랍니다. &gt;</p>

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
});
</script>

<form name="frm" method="post">
	<input type="hidden" name="b2bStts" value="${info.b2bStts}" />
	<input type="hidden" name="b2bCd" value="${info.b2bCd}" class="notRequired" />
	<input type="hidden" name="b2bNm" value="${info.b2bNm}" class="notRequired" />
	<input type="hidden" name="checkAuth" id="checkAuth" value="N" />
	
	<div data-controller="CommonController OutsourcingController">
		<c:if test="${info.agentInfoYn eq 'Y'}">
			<p class="titTxt mt40">판매사 정보 입력</p>
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
						
						<!-- 판매사원 성명 입력란 -->
						<c:if test="${info.agentEmpNmYn eq 'Y'}">
							<tr>	
								<th scope="row"><span class="essen" title="필수입력">판매사원 성명</span></th>
								<td>
									<input type="text" name="agentEmpNm" title="판매사원명" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>
						
						<!-- 대명 가입번호 입력란 -->
						<c:if test="${info.idNoYn eq 'Y'}">
							<tr>	
								<th scope="row"><span class="essen" title="필수입력">대명 가입 번호</span></th>
								<td>
									<input type="text" name="idNo" value="${dmEntrNo}" title="대명 가입 번호" class="inputType1 numberChk" style="border:0;" readonly="readonly" />
								</td>
							</tr>
						</c:if>
						
						<!-- 대리점명 입력란 -->
						<c:if test="${info.agentNmYn eq 'Y'}">
							<tr>	
								<th scope="row"><span class="essen" title="필수입력">대리점명</span></th>
								<td>
									<input type="text" name="agentNm" title="대리점명" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>
						
						<!-- 담당자 연락처 입력란 -->
						<c:if test="${info.agentEmpTelYn eq 'Y'}">
							<tr>	
								<th scope="row"><span class="essen" title="필수입력">담당자 연락처</span></th>
								<td>
									<input type="text" name="agentEmpTel" title="담당자 연락처" class="inputType1 phoneChk" maxlength="13" />
								</td>
							</tr>
						</c:if>										

						<!-- 가입회사명 입력란 -->
						<c:if test="${info.companyNmYn eq 'Y'}">
							<tr>	
								<th scope="row"><span class="essen" title="필수입력">가입회사명</span></th>
								<td>
									<input type="text" name="companyNm" title="가입회사명" class="inputType1" maxlength="50" />
								</td>
							</tr>
						</c:if>
						
						<!-- 담당자명 입력란 -->
						<c:if test="${info.b2bEmpCdYn eq 'Y'}">
							<tr>	
								<th scope="row"><span class="essen" title="필수입력">담당자명</span></th>
								<td>
									<input type="text" name="b2bEmpCd" title="담당자명" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>

						<!-- 영업채널1 입력란 -->
						<c:if test="${info.code1Yn eq 'Y'}">
							<tr>	
								<th scope="row"><span class="essen" title="필수입력">영업채널1</span></th>
								<td>
									<select name="code1"  class="inputType1" title="영업채널1">
										<option value="">[영업채널1 선택]</option>
										<c:forEach var="list" items="${prdctList.channel}">
											<option value="${list.cd}">${list.cdNm}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</c:if>
						
						<!-- 영업채널2 입력란 -->
						<c:if test="${info.code3Yn eq 'Y'}">
							<tr>	
								<th scope="row"><span class="essen" title="필수입력">영업채널2</span></th>
								<td>
									<input type="text" name="code3" title="영업채널2" class="inputType1" maxlength="20" />&nbsp;&nbsp;
									<span class="red"> * 세부 채널명을 입력해주세요. 예시) 강남점 / 제1국 등</span>
								</td>
							</tr>
						</c:if>										

						<!-- 판매사코드/사번 입력란 -->
						<c:if test="${info.code2Yn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">판매사코드 / 사번입력</span></th>
								<td>
									<input type="text" name="code2" title="판매사코드 / 사번입력" class="inputType1" maxlength="20" />&nbsp;&nbsp;
									<span class="red"> * 정확히 입력되었는지 다시 한 번 확인해주세요!</span>
								</td>
							</tr>
						</c:if>
						
						<!-- 코드(국문) 입력란 -->
						<c:if test="${info.agentCodeKrYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">코드</span></th>
								<td>
									<input type="text" name="agentCode1" title="코드" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>
						
						<!-- 주문번호 입력란 -->
						<c:if test="${info.orderNumYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">주문번호</span></th>
								<td>
									<input type="text" name="orderNum" title="주문번호" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>
						
						<!-- 판매사원 사번 입력란 -->
						<c:if test="${info.agentEmpNumYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">판매사원 사번</span></th>
								<td>
									<input type="text" name="agentEmpNum" title="판매사원 사번" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>
						
						<!-- NUMBER 입력란 -->
						<c:if test="${info.agentNumYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">NUMBER</span></th>
								<td>
									<input type="text" name="agentNum" title="NUMBER" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>
						
						<!-- 코드(영문) 입력란 -->
						<c:if test="${info.agentCodeEnYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">CODE</span></th>
								<td>
									<input type="text" name="agentCode2" title="CODE" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>
						
						<!-- 기타 입력란 -->
						<c:if test="${info.agentEtcYn eq 'Y'}">
							<tr>
								<th scope="row"><span>기타</span></th>
								<td>
									<textarea name="agentEtc" title="기타" class="inputType4 notRequired" style="height:60px;" maxlength="2000"></textarea>
								</td>
							</tr>
						</c:if>
						
						<!-- 고유번호 입력란 -->
						<c:if test="${info.agentUnqNumYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">고유번호</span></th>
								<td>
									<input type="text" name="agentUnqNum" title="고유번호" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>
						
						<!-- 판매자 번호 입력란 -->
						<c:if test="${info.sllrNumYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">판매자 번호</span></th>
								<td>
									<input type="text" name="sllrNum" title="판매자 번호" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>
						
						<!-- 판매자 소속 입력란 -->
						<c:if test="${info.sllrPartYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">판매자 소속</span></th>
								<td>
									<input type="text" name="sllrPart" title="판매자 소속" class="inputType1" maxlength="50" />
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
						
						<!-- 생년월일 입력란 -->
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
												
						<!-- 매장코드 입력란 -->
						<c:if test="${info.agentCdYn eq 'Y'}">
							<tr>
								<th scope="row">
									<span class="essen" title="필수입력">점코드</span>
								</th>
								<td>
									<input type="text" name="agentCd" title="점코드" class="inputType1" maxlength="8" />
									&nbsp;&nbsp;
									<span class="whtBt3" onclick="goCheckAgentCd();" style="margin: 0; cursor: pointer" href="">매장명 확인</span>
									&nbsp;&nbsp;
									<span class="red" id="resultCheckAgent">※ 매장 코드 형식(삼성판매 : Z*** / SDP : D***)</span>
									<input type="hidden" name="checkAgentCd" id="checkAgentCd" value="" />
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
									<a href="javascript:ipinAuth();" class="whtBt">아이핀 인증</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>






			<!-- 대명스테이션 동의  -->
			<%--<div class="wrap_agreement">
				<div class="allTerm mt40">
					<p>시책금 지급을 위한 개인정보 활용 동의(대명스테이션)</p>
					<button type="button" class="check checkBtn" id="daeMyungAllAgree">
						<strong>전체 동의합니다.</strong>
						<img src="/common/images/btn/check_bt.gif" alt="체크">
					</button>
					<input type="checkbox" style="display:none" id="chkDaeMyungAllAgree" />
				</div>

				<div class="termDiv mt40">
					<button type="button" class="check checkBtn">
						<strong>동의합니다.</strong>
						<img src="/common/images/btn/check_bt.gif" alt="체크">
					</button>
					<input type="checkbox" class="agree" style="display:none" name="daeMyungAgree" />
					<p class="tit agreement_tit">개인(신용)정보 필수 수집/이용에 관한 동의<em>[필수사항]</em>
						<a class="txt_open">
							<i></i>
						</a>
					</p>


					<div class="termBox">
						<p class="tit">개인(신용)정보 필수 수집/이용에 관한 동의[필수사항]</p>
						<p class="txt">주식회사 대명스테이션은 대명스마트라이프상품과 관련하여 아래와 같이 개인정보를 수집, 이용 및 위탁하고자 합니다.</p>
						<p class="txt">1. 개인정보 수집, 이용 내역(필수 사항)수집/이용자 : 주식회사 대명스테이션</p>
					</div>
				</div>
				<div class="termDiv mt40">
					<button type="button" class="check checkBtn">
						<strong>동의합니다.</strong>
						<img src="/common/images/btn/check_bt.gif" alt="체크">
					</button>
					<input type="checkbox" class="agree" style="display:none" name="daeMyungAgree" />
					<p class="tit agreement_tit">본인 고유식별 정보처리에 대한 동의<em>[필수사항]</em>
						<a class="txt_open">
							<i></i>
						</a>
					</p>

					<div class="termBox">
						<p class="tit">개인(신용)정보 필수 수집/이용에 관한 동의[필수사항]</p>
						<p class="txt">주식회사 대명스테이션은 대명스마트라이프상품과 관련하여 아래와 같이 개인정보를 수집, 이용 및 위탁하고자 합니다.</p>
						<p class="txt">1. 개인정보 수집, 이용 내역(필수 사항)수집/이용자 : 주식회사 대명스테이션</p>
					</div>
				</div>
				<div class="termDiv mt40">
					<button type="button" class="check checkBtn">
						<strong>동의합니다.</strong>
						<img src="/common/images/btn/check_bt.gif" alt="체크">
					</button>
					<input type="checkbox" class="agree" style="display:none" name="daeMyungAgree" />
					<p class="tit agreement_tit">개인(신용)정보 필수 제공에 관한 동의<em>[필수사항]</em>
						<a class="txt_open">
							<i></i>
						</a>
					</p>
					<div class="termBox">
						<p class="tit">개인(신용)정보 필수 수집/이용에 관한 동의[필수사항]</p>
						<p class="txt">주식회사 대명스테이션은 대명스마트라이프상품과 관련하여 아래와 같이 개인정보를 수집, 이용 및 위탁하고자 합니다.</p>
						<p class="txt">1. 개인정보 수집, 이용 내역(필수 사항)수집/이용자 : 주식회사 대명스테이션</p>
					</div>
				</div>
				<div class="termDiv mt40">
					<button type="button" class="check checkBtn">
						<strong>동의합니다.</strong>
						<img src="/common/images/btn/check_bt.gif" alt="체크">
					</button>
					<input type="checkbox" class="agree" style="display:none" name="daeMyungAgree" />
					<p class="tit agreement_tit">본인 고유식별 정보처리에 대한 동의<em>[필수사항]</em>
						<a class="txt_open">
							<i></i>
						</a>
					</p>
					<div class="termBox">
						<p class="tit">개인(신용)정보 필수 수집/이용에 관한 동의[필수사항]</p>
						<p class="txt">주식회사 대명스테이션은 대명스마트라이프상품과 관련하여 아래와 같이 개인정보를 수집, 이용 및 위탁하고자 합니다.</p>
						<p class="txt">1. 개인정보 수집, 이용 내역(필수 사항)수집/이용자 : 주식회사 대명스테이션</p>
					</div>
				</div>

				<!-- 삼성카드 동의  -->
				<div class="allTerm mt40">
					<p>시책금 지급을 위한 개인정보 활용 동의(삼성카드)</p>
					<button type="button" class="check checkBtn" id="samsungAllAgree">
						<strong>전체 동의합니다.</strong>
						<img src="/common/images/btn/check_bt.gif" alt="체크">
					</button>
					<input type="checkbox" style="display:none" id="chkSamsungAllAgree" />
				</div>

				<div class="termDiv mt40">
					<button type="button" class="check checkBtn">
						<strong>동의합니다.</strong>
						<img src="/common/images/btn/check_bt.gif" alt="체크">
					</button>
					<input type="checkbox" class="agree" style="display:none"  name="samsungAgree" />
					<p class="tit agreement_tit">
						개인(신용)정보 필수 수집/이용에 관한 동의<em>[필수사항]</em>
						<a class="txt_open">
							<i></i>
						</a>
					</p>
					<div class="termBox">
						<p class="tit">개인(신용)정보 필수 수집/이용에 관한 동의[필수사항]</p>
						<p class="txt">주식회사 대명스테이션은 대명스마트라이프상품과 관련하여 아래와 같이 개인정보를 수집, 이용 및 위탁하고자 합니다.</p>
						<p class="txt">1. 개인정보 수집, 이용 내역(필수 사항)수집/이용자 : 주식회사 대명스테이션</p>
					</div>
				</div>
				<div class="termDiv mt40">
					<button type="button" class="check checkBtn">
						<strong>동의합니다.</strong>
						<img src="/common/images/btn/check_bt.gif" alt="체크">
					</button>
					<input type="checkbox" class="agree" style="display:none" name="samsungAgree" />
					<p class="tit agreement_tit">본인 고유식별 정보처리에 대한 동의<em>[필수사항]</em>
						<a class="txt_open">
							<i></i>
						</a>
					</p>

					<div class="termBox">
						<p class="tit">개인(신용)정보 필수 수집/이용에 관한 동의[필수사항]</p>
						<p class="txt">주식회사 대명스테이션은 대명스마트라이프상품과 관련하여 아래와 같이 개인정보를 수집, 이용 및 위탁하고자 합니다.</p>
						<p class="txt">1. 개인정보 수집, 이용 내역(필수 사항)수집/이용자 : 주식회사 대명스테이션</p>
					</div>
				</div>
				<div class="termDiv mt40">
					<button type="button" class="check checkBtn">
						<strong>동의합니다.</strong>
						<img src="/common/images/btn/check_bt.gif" alt="체크">
					</button>
					<input type="checkbox" class="agree" style="display:none" name="samsungAgree" />
					<p class="tit agreement_tit">개인(신용)정보 필수 제공에 관한 동의<em>[필수사항]</em>
						<a class="txt_open">
							<i></i>
						</a>
					</p>
					<div class="termBox">
						<p class="tit">개인(신용)정보 필수 수집/이용에 관한 동의[필수사항]</p>
						<p class="txt">주식회사 대명스테이션은 대명스마트라이프상품과 관련하여 아래와 같이 개인정보를 수집, 이용 및 위탁하고자 합니다.</p>
						<p class="txt">1. 개인정보 수집, 이용 내역(필수 사항)수집/이용자 : 주식회사 대명스테이션</p>
					</div>
				</div>
				<div class="termDiv mt40">
					<button type="button" class="check checkBtn">
						<strong>동의합니다.</strong>
						<img src="/common/images/btn/check_bt.gif" alt="체크">
					</button>
					<input type="checkbox" class="agree" style="display:none" name="samsungAgree" />
					<p class="tit agreement_tit">본인 고유식별 정보처리에 대한 동의<em>[필수사항]</em>
						<a class="txt_open">
							<i></i>
						</a>
					</p>
					<div class="termBox">
						<p class="tit">개인(신용)정보 필수 수집/이용에 관한 동의[필수사항]</p>
						<p class="txt">주식회사 대명스테이션은 대명스마트라이프상품과 관련하여 아래와 같이 개인정보를 수집, 이용 및 위탁하고자 합니다.</p>
						<p class="txt">1. 개인정보 수집, 이용 내역(필수 사항)수집/이용자 : 주식회사 대명스테이션</p>
					</div>
				</div>
				<div class="termDiv mt40">
					<button type="button" class="check checkBtn">
						<strong>동의합니다.</strong>
						<img src="/common/images/btn/check_bt.gif" alt="체크">
					</button>
					<input type="checkbox" class="agree" style="display:none" name="samsungAgree" />
					<p class="tit agreement_tit">개인(신용)정보 필수 제공에 관한 동의<em>[필수사항]</em>
						<a class="txt_open">
							<i></i>
						</a>
					</p>
					<div class="termBox">
						<p class="tit">개인(신용)정보 필수 수집/이용에 관한 동의[필수사항]</p>
						<p class="txt">주식회사 대명스테이션은 대명스마트라이프상품과 관련하여 아래와 같이 개인정보를 수집, 이용 및 위탁하고자 합니다.</p>
						<p class="txt">1. 개인정보 수집, 이용 내역(필수 사항)수집/이용자 : 주식회사 대명스테이션</p>
					</div>
					<div class="termDiv mt40">
						<button type="button" class="check checkBtn">
							<strong>동의합니다.</strong>
							<img src="/common/images/btn/check_bt.gif" alt="체크">
						</button>
						<input type="checkbox" class="agree" style="display:none" name="samsungAgree" />
						<p class="tit agreement_tit">본인 고유식별 정보처리에 대한 동의<em>[필수사항]</em>
							<a class="txt_open">
								<i></i>
							</a>
						</p>
						<div class="termBox">
							<p class="tit">개인(신용)정보 필수 수집/이용에 관한 동의[필수사항]</p>
							<p class="txt">주식회사 대명스테이션은 대명스마트라이프상품과 관련하여 아래와 같이 개인정보를 수집, 이용 및 위탁하고자 합니다.</p>
							<p class="txt">1. 개인정보 수집, 이용 내역(필수 사항)수집/이용자 : 주식회사 대명스테이션</p>
						</div>
					</div>
				</div>--%>









	
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
								<th scope="row"><span class="essen" title="필수입력">상품 선택1</span></th>
								<td>
									<select name="prdctCd" title="상품">
										<option value="">[상품선택]</option>
										<c:forEach var="list" items="${prdctList.product}">
											<option value="${list.cd}">${list.cdNm}</option>
										</c:forEach>
									</select>
									<font color="red"><b> ※ 현장즉시결제 장기할부 개월 수(24/36개월) 기재 필수. </b></font>
								</td>
							</tr>
						</c:if>	
						
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
						
						<!-- 상품3 선택란 -->
						<c:if test="${info.prdctNm3Yn eq 'Y'}">
							<tr>
								<th scope="row"><span>상품 선택3</span></th>
								<td>
									<select name="prdctCd3" title="상품" class="notRequired">
										<option value="">[상품선택]</option>
										<c:forEach var="list" items="${prdctList.product}">
											<option value="${list.cd}">${list.cdNm}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</c:if>
						
						<!-- 결합 상품 선택란 -->
						<c:if test="${info.fusionPrdctYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">결합상품 선택</span></th>
								<td>
									<select name="fusionPrdctCd" title="결합상품">
										<option value="">[상품선택]</option>
										<c:forEach var="list" items="${prdctList.goods}">
											<option value="${list.cd}">${list.cdNm}</option>
										</c:forEach>
									</select>
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
						
						<!-- 점포명 입력란 -->
						<c:if test="${info.storeNmYn eq 'Y'}">
							<tr>	
								<th scope="row"><span class="essen" title="필수입력">점포명(GS수퍼)</span></th>
								<td>
									<input type="text" name="storeNm" title="점포명" class="inputType1" maxlength="50" />
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
						
						<!-- 고객 연락처(유선전화) 입력란 -->
						<c:if test="${info.telYn eq 'Y'}">
							<tr>	
								<th scope="row">고객 연락처(유선전화)</th>
								<td>
									<input type="text" name="tel" title="고객 연락처" class="inputType1 phoneChk notRequired" maxlength="13" />
								</td>
							</tr>
						</c:if>
						
						<!-- 이메일 입력란 -->
						<c:if test="${info.emailYn eq 'Y'}">
							<tr>	
								<th scope="row"><span class="essen" title="필수입력">이메일</span></th>
								<td>
									<input type="text" name="email" title="이메일" class="inputType1 emailChk" maxlength="30" />
								</td>
							</tr>
						</c:if>
						
						<!-- 주소 입력란 -->
						<c:if test="${info.addressYn eq 'Y'}">
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
							</tr>
						</c:if>
						
						<!-- SKB 가입상태 선택란 -->
						<c:if test="${info.skbJoinYn eq 'Y'}">
							<tr>	
								<th scope="row"><span class="essen" title="필수입력">SKB 가입상태</span></th>
								<td>
									<select name="skbJoin" title="SKB 가입상태">
										<option value="">[SKB 가입상태]</option>
										<option value="가입완료">가입완료</option>
										<option value="가입보류">가입보류</option>
									</select>
								</td>
							</tr>
						</c:if>
						
						<!-- 롯데카드번호 입력란 -->
						<c:if test="${info.lotCardNumYn eq 'Y'}">
							<tr>	
								<th scope="row"><span class="essen" title="필수입력">롯데카드번호</span></th>
								<td>
									<input type="text" name="lotCardNum" title="롯데카드번호" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>
						
						<!-- 코드(국문) 입력란 -->
						<c:if test="${info.cstmrCodeKrYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">코드</span></th>
								<td>
									<input type="text" name="cstmrCode1" title="코드" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>
						
						<!-- 고객 고유번호 입력란 -->
						<c:if test="${info.cstmrUnqNumYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">고객 고유번호</span></th>
								<td>
									<input type="text" name="cstmrUnqNum" title="고객 고유번호" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>
						
						<!-- 카드번호 입력란 -->
						<c:if test="${info.cardNumYn eq 'Y'}">
							<tr>
								<th scope="row"><span>카드번호</span></th>
								<td>
									<input type="text" name="cardNum" title="카드번호" class="inputType1 notRequired" maxlength="20" />
								</td>
							</tr>
						</c:if>
						
						<!-- NUMBER 입력란 -->
						<c:if test="${info.cstmrNumYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">NUMBER</span></th>
								<td>
									<input type="text" name="cstmrNum" title="NUMBER" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>
						
						<!-- 코드(영문) 입력란 -->
						<c:if test="${info.cstmrCodeEnYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">CODE</span></th>
								<td>
									<input type="text" name="cstmrCode2" title="CODE" class="inputType1" maxlength="20" />
								</td>
							</tr>
						</c:if>
						
						<!-- 기타 입력란 -->
						<c:if test="${info.cstmrEtcYn eq 'Y'}">
							<tr>
								<th scope="row"><span>기타</span></th>
								<td>
									<textarea name="cstmrEtc" title="기타" class="inputType4 notRequired" style="height:60px;" maxlength="2000"></textarea>
								</td>
							</tr>
						</c:if>
						
						<!-- 한샘 통합 멤버십 입력란 -->
						<c:if test="${info.hanssMbspNumYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">한샘 통합 멤버십</span></th>
								<td>
									<input type="text" name="hanssMbspNum" title="한샘 통합 멤버십" class="inputType1" maxlength="9" />&nbsp;&nbsp;
									<span class="red"> * 상담을 위해서 한샘 통합 멤버십 고객 번호가 반드시 필요합니다. (9자리)</span>
								</td>
							</tr>
						</c:if>
						
						<!-- 멤버십 번호 입력란 -->
						<c:if test="${info.mbspNumYn eq 'Y'}">
							<tr>
								<th scope="row"><span class="essen" title="필수입력">멤버십 번호</span></th>
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
									<textarea name="memo" title="메모" class="inputType4 notRequired" style="height:60px;" maxlength="250"></textarea>
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
		

		
				
		 <input type="hidden" name="funnel" value="4" />
		<!-- 개인 정보 활용 동의 표시란 -->
		<c:if test="${info.termsYn eq 'Y'}">
			<div class="termDiv mt40">
				<p class="tit">개인 정보 활용 동의</p>
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
<script type="text/javascript">
$(".txt_open").click(function(){
	$(this).parent().parents(".termDiv").toggleClass("open")
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
	
	// 점코드 확인
	function goCheckAgentCd(){
		var frm = document.frm;
		var agentCd = frm.agentCd.value.toUpperCase();
		var resultAgentCheck = document.getElementById("resultCheckAgent");
		
		if(agentCd == ""){
			resultAgentCheck.innerHTML = "점코드를 입력해 주세요.";
			return;
		}
			
		jQuery.ajax({
			url : "/outsourcing/agentCdCheck.ajax",
			type : "post",
			data : {
				"agentCd" : agentCd
			},
			success : function(data){
				if(data.agentNm != null){
					resultAgentCheck.innerHTML = "*&nbsp;" + data.agentNm;
					frm.agentCd.value = agentCd;
					$("#checkAgentCd").val(agentCd);
				}else{
					resultAgentCheck.innerHTML = "매장 정보가 없습니다. 다시 확인 부탁 드립니다.";
					$("#checkAgentCd").val("");
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

	function goSave(){
		console.log($("#checkAuth").val());
		if($("#checkAuth").val()=="N"){
			alert("인증 확인처리가 완료 되지 않았습니다. 인증 후 처리해 주세요.");
			return;
		}

		var frm = document.frm;

		if(document.getElementById('checkAgentCd') != null){
			if(frm.agentCd.value == ""){
				alert("점코드를 입력하세요.");
				return;
			}else if($("#checkAgentCd").val() != frm.agentCd.value){
				alert("점코드 확인처리가 완료 되지 않았습니다. 점코드 확인 후 처리해주세요.");
				return;
			}
		}

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

        // for (var i = 0; i < frm.samsungAgree.length; i++) {
        //     if (!frm.samsungAgree[i].checked) {
        //         alert("개인 정보 활용 동의에 체크해 주세요.");
        //         return;
        //     }
        // }
        // for (var i = 0; i < frm.daeMyungAgree; i++) {
        //     if (!frm.daeMyungAgree[i].checked) {
        //         alert("개인 정보 활용 동의에 체크해 주세요.");
        //         return;
        //     }
        // }

		if(!confirm("진행하시겠습니까?"))
			return;

		var formObj = document.frm;
		formObj.action = "/outsourcing/insert.do";
		formObj.submit();	
	}


	window.onload = function() {
		document.getElementById('daeMyungAllAgree').addEventListener('click', function(e) {
			if (!document.getElementById('chkDaeMyungAllAgree').checked) {
				for (var i = 0; i < frm.daeMyungAgree.length; i++) {
					frm.daeMyungAgree[i].checked = true;
					document.getElementsByName('daeMyungAgree')[i].closest('div').getElementsByTagName('img')[0].src = '/common/images/btn/check_bt_on.gif';
				}
			} else {
				for (var i = 0; i < frm.daeMyungAgree.length; i++) {
					frm.daeMyungAgree[i].checked = false;
					document.getElementsByName('daeMyungAgree')[i].closest('div').getElementsByTagName('img')[0].src = '/common/images/btn/check_bt.gif';
				}
			}
		});

		document.getElementById('samsungAllAgree').addEventListener('click', function(e) {
			if (!document.getElementById('chkSamsungAllAgree').checked) {
				for (var i = 0; i < frm.samsungAgree.length; i++) {
					frm.samsungAgree[i].checked = true;
					document.getElementsByName('samsungAgree')[i].closest('div').getElementsByTagName('img')[0].src = '/common/images/btn/check_bt_on.gif';
				}
			} else {
				for (var i = 0; i < frm.samsungAgree.length; i++) {
					frm.samsungAgree[i].checked = false;
					document.getElementsByName('samsungAgree')[i].closest('div').getElementsByTagName('img')[0].src = '/common/images/btn/check_bt.gif';
				}
			}
		});
	}
</script>