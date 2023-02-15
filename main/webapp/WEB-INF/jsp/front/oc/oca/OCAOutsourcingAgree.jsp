<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

					<div data-controller="AgreeController" >
						<p class="joinTxt taC"><img src="/common/images/txt/outsourcing_terms_txt1.gif" alt="약관동의 및 본인인증 "></p>

						<div class="termDiv mt40">
							<p class="tit">이용약관 동의(필수) </p>
							
							<button type="button" class="check checkBtn">
								<strong>동의합니다.</strong>
								<img src="/common/images/btn/check_bt.gif" alt="체크">
							</button>
							<input type="checkbox" class="agree" style="display:none" />

							<div class="termBox">
								<p class="tit">제1조(목적 등)</p>
								<p class="txt">① 대명라이프웨이 (www.daemyunglifeway.com) 이용자 약관(이하 "본 약관"이라 합니다)은 이용자가 대명라이프웨이에서 제공하는 인터넷 관련 서비스 (이하 "서비스"라 합니다)를 이용함에 있어 이용자와 "대명라이프웨이"의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
								<p class="txt">② 이용자가 되고자 하는 자가 "대명라이프웨이"가 정한 소정의 절차를 거쳐서 "가입하기" 단추를 누르면 본 약관에 동의하는 것으로 간주합니다. 본 약관에 정하는 이외의 이용자와 "대명라이프웨이"의 권리, 의무 및 책임사항에 관해서는 대한민국의 관련 법령과 상관습에 의합니다. </p>
							</div>
						</div>

						<div class="termDiv mt60">
							<p class="tit">개인정보 수집 및 이용에 대한 안내(필수)</p>
							<button type="button" class="check checkBtn">								
								<strong>동의합니다.</strong>
								<img src="/common/images/btn/check_bt.gif" alt="체크">
							</button>
							<input type="checkbox" class="agree" style="display:none" />

							<div class="termBox">
								<p class="tit">제1조(목적 등)</p>
								<p class="txt">① 대명라이프웨이 (www.daemyunglifeway.com) 이용자 약관(이하 "본 약관"이라 합니다)은 이용자가 대명라이프웨이에서 제공하는 인터넷 관련 서비스 (이하 "서비스"라 합니다)를 이용함에 있어 이용자와 "대명라이프웨이"의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
								<p class="txt">② 이용자가 되고자 하는 자가 "대명라이프웨이"가 정한 소정의 절차를 거쳐서 "가입하기" 단추를 누르면 본 약관에 동의하는 것으로 간주합니다. 본 약관에 정하는 이외의 이용자와 "대명라이프웨이"의 권리, 의무 및 책임사항에 관해서는 대한민국의 관련 법령과 상관습에 의합니다. </p>
							</div>
						</div>

						<div class="accreditDiv">
							<div class="accreditBts">
								<p class="mobile">
									<a href="" class="whtBt" id="mobileAuth">휴대폰 인증</a>
								</p>
								<p class="ipin">
									<a href="" class="whtBt" id="ipinAuth">아이핀 인증</a>
								</p>
							</div>
						</div>
											
						<form name="form1" action="/auth/phoneAuth.do" method="post">
							<input type="hidden" name="rqst_caus_cd" value="00" />
							<input type="hidden" name="rMsg" value="/outsourcing/write.do" />
						</form>

						<form name="form2" action="/auth/ipinAuth.do" method="post">
							<input type="hidden" name="rMsg" value="/outsourcing/write.do" />
						</form>
											 
						<!-- 본인확인 처리결과 정보 -->
						<form name="kcbResultForm" method="post" action="/auth/getPhoneAuthInf.do">
							<input type="hidden" name="result_cd" 		value="" 	/>
							<input type="hidden" name="result_msg" 	value="" 	/>
							<input type="hidden" name="di" 				value="" 	/>
							<input type="hidden" name="ci" 				value="" 	/>
							<input type="hidden" name="name" 			value="" 	/>
							<input type="hidden" name="birthday" 		value="" 	/>
							<input type="hidden" name="sex" 				value="" 	/>
							<input type="hidden" name="tel_com_cd" 	value="" 	/>
							<input type="hidden" name="tel_no" 			value="" 	/>
							<input type="hidden" name="return_msg" 	value="" 	/>
						</form>
						<!-- 본인확인(아이핀) 처리결과 정보 -->
						<form name="kcbOutForm" method="post">
							<input type="hidden" name="dupinfo" />
							<input type="hidden" name="realname" />
							<input type="hidden" name="sex" />
							<input type="hidden" name="birthdate" />
							<input type="hidden" name="coinfo1" />
							<input type="hidden" name="coinfo2" />
							<input type="hidden" name="return_msg" />
						</form>
					</div>