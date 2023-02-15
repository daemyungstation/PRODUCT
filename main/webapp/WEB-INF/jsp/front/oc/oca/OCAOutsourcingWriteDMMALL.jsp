<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

   						<h2 style="font-size: 36px; color: #333; line-height: 36px; margin-bottom: 50px; font-family: 'NanumSquareB'; font-weight: normal;">${info.title}</h2>
						
						<form name="frm" method="post" action="/outsourcing/insert.do">
							<input type="hidden" name="b2bStts" value="${info.b2bStts}" />
							<input type="hidden" name="b2bCd" value="${info.b2bCd}" class="notRequired" />
							<input type="hidden" name="b2bNm" value="${info.b2bNm}" class="notRequired" />
							
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
												
												<!-- 매장코드 입력란 -->
												<c:if test="${info.agentCdYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">매장 코드</span></th>
														<td>
															<input type="text" name="agentCd" title="매장코드 번호" class="inputType1" maxlength="8" />&nbsp;&nbsp;
															<span class="red">※ 매장 코드 형식 (삼판 : Z*** / 대리점 : D***)</span>
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
														<th scope="row"><span>메모</span></th>
														<td>
															<textarea name="memo" title="메모" class="inputType4 notRequired" style="height:60px;" maxlength="2000">*신청하실 검사명과 자녀나이를 반드시 입력해주세요. 서비스 신청 후 전화를 드립니다.

검사명 :
자녀 나이 :</textarea>
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
									
									<div class="termDiv mt40">
										<p class="tit">개인 정보의 제3자 제공 동의</p>
										<button type="button" class="check checkBtn">
											<strong>동의합니다.</strong>
											<img src="/common/images/btn/check_bt.gif" alt="체크">
										</button>
										<input type="checkbox" name="thrd_sppl_agree" class="agree" style="display:none" />
			
										<div class="termBox">
											<p><strong>■ 개인 정보의 제3자 제공 동의</strong></p>
											<p>- 제공받는자 : 주식회사 허그맘</p>
											<p>- 제공하는 개인정보 항목 : 성명, 연락처(휴대 전화번호), 이메일</p>
											<p>- 제공받는 자의 개인정보 이용 목적 : 신청 서비스 상담 및 컨텐츠 제공, 상담을 위한 일정 및 정보제공(전화, E-DM발송)</p>
											<p>- 보유기간 : 처리 종료 시</p>
											<p>※ 귀하께서는 개인정보제공 및 활용에 거부할 권리가 있습니다.</p>
											<p>&nbsp;&nbsp;&nbsp; 거부에 따른 불이익 : 위 제공사항은 대명라이프웨이 전환서비스 신청에 반드시 필요한 사항으로 거부할 경우 서비스 이용이 불가함을 알려드립니다.</p>
										</div>
									</div>
								</c:if>

								<div class="mt30 taC">
									<a href="javascript:" class="btnRed" id="submit">신청</a>
									<input type="submit" style="display:none" />
								</div>
							</div>
						</form>
