<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

<c:choose>
	<c:when test="${userCount > 1}">
		컨택센터를 통해 문의해주시기 바랍니다. 1588-8511
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${empty joinProducts or joinProducts eq null or empty joinProducts.joinPtcList}">
				가입된 상품이 없습니다.
			</c:when>

			<c:when test="${activeJoinPtc eq false}">
				상품을 해약하거나, 행사하신 경우 이벤트 대상이 아닙니다. 컨택센터 문의 1588-8511
			</c:when>

			<c:otherwise>
				<form name="step2">
					<input type="hidden" name="memNo" value="${user[0].memNo}">
					<p class="titTxt mt40">가입 상품 내역</p>
					<div class="boardType2 board_join_list mt15">
						<table summary="">
							<caption></caption>
							<colgroup>
								<col width="5%" />
								<col width="31.6%" />
								<col width="31.6%" />
								<col width="31.6%" />
							</colgroup>
							<tbody>
							<c:forEach var="ptcList" items="${joinProducts.joinPtcList}" varStatus="status">
								<c:if test="${ptcList.accStat eq '정상'}">
									<tr>
										<th scope="row" class="select_title"><span class="" title="">선택</span></th>
										<!-- <th scope="row"><span class="" title="">회원번호</span></th> -->
										<th scope="row"><span class="" title="">가입상품</span></th>
										<!-- <th scope="row"><span class="" title="">모델분류</span></th> -->
										<th scope="row"><span class="" title="">가입일자</span></th>
										<th scope="row"><span class="" title="">총상품금액</span></th>
									</tr>
									<tr>
										<td class="input_radio">
											<input type="radio" name="chkProducts" value="${ptcList.accntNo }" data-totalCnt="${ptcList.trueCnt}" onClick="selectProduct(this);">
										</td>
										<!-- <td>${ptcList.accntNo }</td> -->
										<td>${ptcList.prodNm }</td>
										<!-- <td>${ptcList.prodModel }</td> -->
										<td>${egov:convertDate(ptcList.joinDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</td>
										<td><fmt:formatNumber value="${ptcList.prodAmt}" type="number" maxFractionDigits="0" /></td>
									</tr>
								</c:if>
								<!--
								<tr>
								<th scope="row"><span class="" title="">만기회차</span></th>
								<th scope="row"><span class="" title="">특별할인회차</span></th>
								<th scope="row"><span class="" title="">가입상태</span></th>
								<th scope="row"><span class="" title="">해약처리</span></th>
								<th scope="row"><span class="" title="">행사일자</span></th>
								</tr>
								<tr>
								<td>${ptcList.exprNo}</td>
								<td>
								<c:choose>
									<c:when test="${ptcList.newChanGunsu gt 0}">
										${ptcList.newChanGunsu}회차
									</c:when>
									<c:otherwise>
										-
									</c:otherwise>
								</c:choose>
								</td>
								<td>${ptcList.accStat}</td>
								<td>
								<c:choose>
									<c:when test="${empty ptcList.resnCl}">
										-
									</c:when>
									<c:when test="${ptcList.resnCl eq '02'}">
										미대상
									</c:when>
									<c:when test="${ptcList.resnProcYn eq 'Y'}">
										처리
									</c:when>
									<c:otherwise>
										미처리
									</c:otherwise>
								</c:choose>
								</td>
								<td>${egov:nvl(ptcList.evntDay, '-')}</td>
								</tr>
								-->
							</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="mt30 taC">
						<a href="javascript:" class="btnRed" id="btn" onClick="selectGoods();">선물 선택</a>
						<input type="button" style="display:none" />
					</div>
				</form>
			</c:otherwise>
		</c:choose>

	</c:otherwise>
</c:choose>
