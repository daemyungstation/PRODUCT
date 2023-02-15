<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include
	file="/WEB-INF/jsp/include/el.jspf"%>
<script type="text/javascript">
	$(document) .ready( function() {

						var count1 = 0;
						var count2 = 0;
						var count3 = 0;

						$("#agentGubun").change(function() {
							if ($("#agentGubun").is(":checked")) {
								$("#agentGubun").val("Y");
							} else {
								$("#agentGubun").val("N");
							}
						});

						$('.inputType4').keyup(function(e) {
							var content = $(this).val();
							$('.max_counter').html(content.length + '/250');

							if (content.length == 250) {
								alert('250자만 입력 가능합니다.');
							}
						});
						/*도매점 판매구분에 따른 입력란 노출 및 활성화*/
						$("#salesType, #salesTypeEle")
								.change(
										function() {
											
											var val = $(this).val();
											if($(this).attr('id') == 'salesType') {
												$('#salesTypeEle').val($(this).val());
											}else{
												$('#salesType').val($(this).val());
											}
											
											if (val == '판매점 유치') {
												$(".wholesaleInput").show();
												$("input:text[name='whPosCd']").removeClass("notRequired");
												$(
														"input:text[name='whStoreNm']")
														.removeClass(
																"notRequired");
												
												$(".wholesaleInputEle").show();
												$("input:text[name='whPosCd']")
														.removeClass(
																"notRequired");
												$(
														"input:text[name='whStoreNm']")
														.removeClass(
																"notRequired")
											} else {
												$("input:text[name='whPosCd']")
														.addClass("notRequired");
												$(
														"input:text[name='whStoreNm']")
														.addClass("notRequired");
												$("input:text[name='whPosCd']")
														.val("");
												$(
														"input:text[name='whStoreNm']")
														.val("");
												$(".wholesaleInput").hide();
												
												$("input:text[name='whPosCd']")
														.addClass("notRequired");
												$(
														"input:text[name='whStoreNm']")
														.addClass("notRequired");
												$("input:text[name='whPosCd']")
														.val("");
												$(
														"input:text[name='whStoreNm']")
														.val("");
												$(".wholesaleInputEle").hide();
											}
										})

						//대명가입번호2 존재할때 입력란 노출 및 활성화
						if ($('#idNoInput2').val() != null
								&& $('#idNoInput2').val() != undefined
								&& $('#idNoInput2').val() != "") {
							$(".invisible1").show();
							$("input:text[name='prdctCd3']").removeClass(
									"notRequired");
						}
						if ($('#idNoInput2Ele').val() != null
								&& $('#idNoInput2Ele').val() != undefined
								&& $('#idNoInput2Ele').val() != "") {
							$(".invisible1Ele").show();
							$("input:text[name='prdctCd3']").removeClass(
									"notRequired");
						}
						//대명가입번호3 존재할때 입력란 노출 및 활성화
						if ($('#idNoInput3').val() != null
								&& $('#idNoInput3').val() != undefined
								&& $('#idNoInput3').val() != "") {
							$(".invisible2").show();
							$("input:text[name='prdctCd3']").removeClass(
									"notRequired");
						}
						if ($('#idNoInput3Ele').val() != null
								&& $('#idNoInput3Ele').val() != undefined
								&& $('#idNoInput3Ele').val() != "") {
							$(".invisible2Ele").show();
							$("input:text[name='prdctCd3']").removeClass(
									"notRequired");
						}
						/* 가입방법 선택*/
						$("input:radio[name='joinMethod']").change(function() {
							var val = $(this).val();
							//$(".wholesaleInput").hide();

							if (val === 'fixedLine') {
								$(".fixedLine").show();
								$(".electronicContract").hide();
							} else if (val === 'electronicContract') {
								alert("※ 외국인 전자계약 진행 불가\n※ 본인명의 핸드폰 미사용자 전자계약 진행 불가");
								$(".fixedLine").hide();
								$(".electronicContract").show();
							}
						});
						
						
						/*  통화요청 선택 */
						$("#callDate").attr('disabled', 'false');
						$("#callTime").attr('disabled', 'false');
						$("#callDateEle").attr('disabled', 'false');
						$("#callTimeEle").attr('disabled', 'false전자');
						$("input:radio[name='callType']").change(function() {
							var val = $(this).val();
							//$(".wholesaleInput").hide();

							if (val === 'quickTell') {
								$("#callDate").attr('disabled', 'false');
								$("#callTime").attr('disabled', 'false');
							} else if (val === 'chooseTell') {
								$("#callDate").removeAttr('disabled');
								$("#callTime").removeAttr('disabled');
							} 
						});
						$("input:radio[name='callTypeEle']").change(function() {
							var val = $(this).val();
							//$(".wholesaleInput").hide();

							if (val === 'quickTell') { 
								$("#callDateEle").attr('disabled', 'false');
								$("#callTimeEle").attr('disabled', 'false');
							} else if (val === 'chooseTell') {
								$("#callDateEle").removeAttr('disabled'); 
								$("#callTimeEle").removeAttr('disabled');
							}
						});


						/*상품선택1 모바일 요금 할인 선택시 할인받을 연락처 입력란 노출 및 활성화*/
						$("#prdctCd").change(
								function() {
									var val = $(this).val();
									var uEntrNo_tmp = $("#uEntrNo_tmp").text();

									if (val === 'LGU4') {
										$("#discount_ctn").show();
										$("input:text[name='discountCtn']");
										count1 = 1; //선 할인 상품
									} else if (val === 'LGU1') {
										$("#discount_ctn").hide();
										$("input:text[name='discountCtn']")
												.val("");
										$("input:text[name='discountCtn']")
												.addClass("notRequired");
										$("input:text[name='discountCtn']")
												.val("");
										count1 = 1; //선 할인 상품
									} else if (val === 'LGU9' ) {
										$("#discount_ctn").show();
										$("#discount_ctn_10").hide();
										$("input:text[name='discountCtn']");
										count1 = 0;
									} else if (val === 'LGU10') {
										$("#discount_ctn").hide();
										$("#discount_ctn_10").show();
										$("input:text[name='discountCtn_10']").val("");
										count1 = 0;
									} else if( val === 'LGU11') {
										alert("※ 선택하신 상품은 “유샵” 라이브 전용 상품입니다.\n"
												+ "※ 대리점(매장) 고객이 해당 상품으로 가입 진행 시,\n"
												+ "수수료가 지급되지 않습니다.")
										$("#discount_ctn").show();
										$("#discount_ctn_10").hide();
										$("input:text[name='discountCtn']").val("");
										count1 = 0;
									} else if ( val === 'LGU12' || val === 'LGU13') {
										//alert("※ 선택하신 상품은 “헬로비전 렌탈” 계약 고객 전용 상품입니다.");
										$("#discount_ctn").hide();
										$("#discount_ctn_10").hide();
										$("input:text[name='discountCtn']").val("");
										count1 = 0;
									} else {
										$("#discount_ctn").hide();
										$("input:text[name='discountCtn']")
												.val("");
										$("input:text[name='discountCtn']")
												.addClass("notRequired");
										$("input:text[name='discountCtn']")
												.val("");
										count1 = 0;
									}
								});
						$("#prdctCdEle").change(
								function() {
									var val = $(this).val();
									var uEntrNo_tmp = $("#uEntrNo_tmpEle").text();

									if (val === 'LGU4') {
										$("#discount_ctn_ele").show();
										$("input:text[name='discountCtn']").val("");
										count1 = 1; //선 할인 상품
									} else if (val === 'LGU1') {
										$("#discount_ctn_ele").hide();
										$("input:text[name='discountCtn']")
												.val("");
										$("input:text[name='discountCtn']")
												.addClass("notRequired");
										$("input:text[name='discountCtn']")
												.val("");
										count1 = 1; //선 할인 상품
									} else if (val === 'LGU9' ) {
										$("#discount_ctn_ele").show();
										$("#discount_ctn_10_ele").hide();
										$("input:text[name='discountCtn']").val("");
										count1 = 0;
									} else if (val === 'LGU10' ) {
										$("#discount_ctn_ele").hide();
										$("#discount_ctn_10_ele").show();
										$("input:text[name='discountCtn_10']").val("");
										count1 = 0;
									} else if (val === 'LGU11') {
                                        alert("※ 선택하신 상품은 “유샵” 라이브 전용 상품입니다.\n"
                                            + "※ 대리점(매장) 고객이 해당 상품으로 가입 진행 시,\n"
                                            + "수수료가 지급되지 않습니다.")
                                        $("#discount_ctn_ele").show();
                                        $("#discount_ctn_10_ele").hide();
                                        $("input:text[name='discountCtn']").val("");
                                        count1 = 0;
									} else if ( val === 'LGU12' || val === 'LGU13') {
										//alert("※ 선택하신 상품은 “헬로비전 렌탈” 계약 고객 전용 상품입니다.");
										$("#discount_ctn_ele").hide();
										$("#discount_ctn_10_ele").hide();
										$("input:text[name='discountCtn']").val("");
										count1 = 0;
                                    } else {
										$("#discount_ctn_ele").hide();
										$("input:text[name='discountCtn']")
												.val("");
										$("input:text[name='discountCtn']")
												.addClass("notRequired");
										$("input:text[name='discountCtn']")
												.val("");
										count1 = 0;
									}
								});
						/*상품선택2 모바일 요금 할인 선택시 할인받을 연락처 입력란 노출 및 활성화*/
						$("#prdctCd2")
								.change(
										function() {
											var val = $(this).val();
											var uEntrNo_tmp = $("#uEntrNo_tmp")
													.text();

											if (val === 'LGU4') {
												$("#discount_ctn2").show();
												$("input:text[name='discountCtn2']");
												count2 = 1; //선 할인 상품
											} else if (val === 'LGU1') {
												$("#discount_ctn2").hide();
												$(
														"input:text[name='discountCtn2']")
														.val("");
												$(
														"input:text[name='discountCtn2']")
														.addClass("notRequired");
												$(
														"input:text[name='discountCtn2']")
														.val("");
												count2 = 1; //선 할인 상품
											} else if (val === 'LGU9' ) {
												$("#discount_ctn2").show();
												$("#discount_ctn2_10").hide();
												$("input:text[name='discountCtn2']").val("");
												count2 = 0;
											} else if (val === 'LGU10') {
												$("#discount_ctn2").hide();
												$("#discount_ctn2_10").show();
												$("input:text[name='discountCtn2_10']").val("");
												count2 = 0;
											} else if( val === 'LGU11') {
												alert("※ 선택하신 상품은 “유샵” 라이브 전용 상품입니다.\n"
														+ "※ 대리점(매장) 고객이 해당 상품으로 가입 진행 시,\n"
														+ "수수료가 지급되지 않습니다.")
												$("#discount_ctn2").show();
												$("#discount_ctn2_10").hide();
												$("input:text[name='discountCtn2']").val("");
												count2 = 0;
											} else if ( val === 'LGU12'|| val === 'LGU13') {
												//alert("※ 선택하신 상품은 “헬로비전 렌탈” 계약 고객 전용 상품입니다.");
												$("#discount_ctn2").hide();
												$("#discount_ctn2_10").hide();
												$("input:text[name='discountCtn2']").val("");
												count1 = 0;
											} else {
												$("#discount_ctn2").hide();
												$(
														"input:text[name='discountCtn2']")
														.val("");
												$(
														"input:text[name='discountCtn2']")
														.addClass("notRequired");
												$(
														"input:text[name='discountCtn2']")
														.val("");
												count2 = 0;
											}
										});
						$("#prdctCd2Ele")
						.change(
								function() {
									var val = $(this).val();
									var uEntrNo_tmp = $("#uEntrNo_tmpEle")
											.text();

									if (val === 'LGU4') {
										$("#discount_ctn2_ele").show();
										$("input:text[name='discountCtn2']").val("");
										count2 = 1; //선 할인 상품
									} else if (val === 'LGU1') {
										$("#discount_ctn2_ele").hide();
										$(
												"input:text[name='discountCtn2']")
												.val("");
										$(
												"input:text[name='discountCtn2']")
												.addClass("notRequired");
										$(
												"input:text[name='discountCtn2']")
												.val("");
										count2 = 1; //선 할인 상품
									} else if (val === 'LGU9') {
										$("#discount_ctn2_ele").show();
										$("#discount_ctn2_10_ele").hide();
										$("input:text[name='discountCtn2']").val("");
										count2 = 0;
									} else if (val === 'LGU10') {
										$("#discount_ctn2_ele").hide();
										$("#discount_ctn2_10_ele").show();
										$("input:text[name='discountCtn2_10']").val("");
										count2 = 0;
									} else if (val === 'LGU11') {
                                        alert("※ 선택하신 상품은 “유샵” 라이브 전용 상품입니다.\n"
                                            + "※ 대리점(매장) 고객이 해당 상품으로 가입 진행 시,\n"
                                            + "수수료가 지급되지 않습니다.");
                                        $("#discount_ctn2_ele").show();
                                        $("#discount_ctn2_10_ele").hide();
                                        $("input:text[name='discountCtn2']").val("");
                                        count2 = 0;
									} else if ( val === 'LGU12'|| val === 'LGU13') {
										//alert("※ 선택하신 상품은 “헬로비전 렌탈” 계약 고객 전용 상품입니다.");
										$("#discount_ctn2_ele").hide();
										$("#discount_ctn2_10_ele").hide();
										$("input:text[name='discountCtn2']").val("");
										count1 = 0;
                                    } else {
										$("#discount_ctn2_ele").hide();
										$(
												"input:text[name='discountCtn2']")
												.val("");
										$(
												"input:text[name='discountCtn2']")
												.addClass("notRequired");
										$(
												"input:text[name='discountCtn2']")
												.val("");
										count2 = 0;
									}
								});
						/*상품선택3 모바일 요금 할인 선택시 할인받을 연락처 입력란 노출 및 활성화*/
						$("#prdctCd3")
								.change(
										function() {
											var val = $(this).val();
											var uEntrNo_tmp = $("#uEntrNo_tmp")
													.text();

											if (val === 'LGU4') {
												$("#discount_ctn3").show();
												$("input:text[name='discountCtn3']").val("");
												count3 = 1; //선 할인 상품
											} else if (val === 'LGU1') {
												$("#discount_ctn3").hide();
												$(
														"input:text[name='discountCtn3']")
														.val("");
												$(
														"input:text[name='discountCtn3']")
														.addClass("notRequired");
												$(
														"input:text[name='discountCtn3']")
														.val("");
												count3 = 1; //선 할인 상품
											} else if (val === 'LGU9') {
												$("#discount_ctn3").show();
												$("#discount_ctn3_10").hide();
												$("input:text[name='discountCtn3']").val("");
												count3 = 0;
											} else if (val === 'LGU10') {
												$("#discount_ctn3").hide();
												$("#discount_ctn3_10").show();
												$("input:text[name='discountCtn3_10']").val("");
												count2 = 0;
											} else if (val === 'LGU11') {
                                                alert("※ 선택하신 상품은 “유샵” 라이브 전용 상품입니다.\n"
                                                    + "※ 대리점(매장) 고객이 해당 상품으로 가입 진행 시,\n"
                                                    + "수수료가 지급되지 않습니다.")
                                                $("#discount_ctn3").show();
                                                $("#discount_ctn3_10").hide();
                                                $("input:text[name='discountCtn3']").val("");
                                                count3 = 0;
											} else if ( val === 'LGU12'|| val === 'LGU13') {
												//alert("※ 선택하신 상품은 “헬로비전 렌탈” 계약 고객 전용 상품입니다.");
												$("#discount_ctn3").hide();
												$("#discount_ctn3_10").hide();
												$("input:text[name='discountCtn3']").val("");
												count1 = 0;
                                            } else {
												$("#discount_ctn3").hide();
												$(
														"input:text[name='discountCtn3']")
														.val("");
												$(
														"input:text[name='discountCtn3']")
														.addClass("notRequired");
												$(
														"input:text[name='discountCtn3']")
														.val("");
												count3 = 0;
											}
										});
						$("#prdctCd3")
						.change(
								function() {
									var val = $(this).val();
									var uEntrNo_tmp = $("#uEntrNo_tmpEle")
											.text();

									if (val === 'LGU4') {
										$("#discount_ctn3_ele").show();
										$("input:text[name='discountCtn3']").val("");
										count3 = 1; //선 할인 상품
									} else if (val === 'LGU1') {
										$("#discount_ctn3_ele").hide();
										$(
												"input:text[name='discountCtn3']")
												.val("");
										$(
												"input:text[name='discountCtn3']")
												.addClass("notRequired");
										$(
												"input:text[name='discountCtn3']")
												.val("");
										count3 = 1; //선 할인 상품
									} else if (val === 'LGU9') {
										$("#discount_ctn3_ele").show();
										$("#discount_ctn3_10_ele").hide();
										$("input:text[name='discountCtn3']").val("");
										count3 = 0;
									} else if (val === 'LGU10') {
										$("#discount_ctn3_ele").hide();
										$("#discount_ctn3_10_ele").show();
										$("input:text[name='discountCtn3_10']").val("");
										count2 = 0;
                                    } else if (val === 'LGU11') {
                                        alert("※ 선택하신 상품은 “유샵” 라이브 전용 상품입니다.\n"
                                            + "※ 대리점(매장) 고객이 해당 상품으로 가입 진행 시,\n"
                                            + "수수료가 지급되지 않습니다.");
                                        $("#discount_ctn3_ele").show();
                                        $("#discount_ctn3_10_ele").hide();
                                        $("input:text[name='discountCtn3']").val("");
                                        count3 = 0;
									} else if ( val === 'LGU12'|| val === 'LGU13') {
										//alert("※ 선택하신 상품은 “헬로비전 렌탈” 계약 고객 전용 상품입니다.");
										$("#discount_ctn3_ele").hide();
										$("#discount_ctn3_10_ele").hide();
										$("input:text[name='discountCtn3']").val("");
										count1 = 0;
                                    } else {
										$("#discount_ctn3").hide();
										$(
												"input:text[name='discountCtn3']")
												.val("");
										$(
												"input:text[name='discountCtn3']")
												.addClass("notRequired");
										$(
												"input:text[name='discountCtn3']")
												.val("");
										count3 = 0;
									}
								});

						/*선 할인 상품 2구좌 제한*/
						$("#prdctCd").change(function() {
							var temp = 0;
							temp += (count1 + count2 + count3);
							if (temp > 2) {
								alert("선할인 상품은 2구좌까지 선택이 가능합니다.");
								$('#prdctCd').prop('selectedIndex', 0);
								$("#discount_ctn").hide();
							}
						})
						$("#prdctCdEle").change(function() {
							var temp = 0;
							temp += (count1 + count2 + count3);
							if (temp > 2) {
								alert("선할인 상품은 2구좌까지 선택이 가능합니다.");
								$('#prdctCdEle').prop('selectedIndex', 0);
								$("#discount_ctn_ele").hide();
							}
						})
						/*선 할인 상품 2구좌 제한*/
						$("#prdctCd2").change(function() {
							var temp = 0;
							temp += (count1 + count2 + count3);
							if (temp > 2) {
								alert("선할인 상품은 2구좌까지 선택이 가능합니다.");
								$('#prdctCd2').prop('selectedIndex', 0);
								$("#discount_ctn2").hide();
							}
						})
						$("#prdctCd2Ele").change(function() {
							var temp = 0;
							temp += (count1 + count2 + count3);
							if (temp > 2) {
								alert("선할인 상품은 2구좌까지 선택이 가능합니다.");
								$('#prdctCd2Ele').prop('selectedIndex', 0);
								$("#discount_ctn2_ele").hide();
							}
						})
						/*선 할인 상품 2구좌 제한*/
						$("#prdctCd3").change(function() {
							var temp = 0;
							temp += (count1 + count2 + count3);
							if (temp > 2) {
								alert("선할인 상품은 2구좌까지 선택이 가능합니다.");
								$('#prdctCd3').prop('selectedIndex', 0);
								$("#discount_ctn3").hide();
							}
						})
						$("#prdctCd3Ele").change(function() {
							var temp = 0;
							temp += (count1 + count2 + count3);
							if (temp > 2) {
								alert("선할인 상품은 2구좌까지 선택이 가능합니다.");
								$('#prdctCd3Ele').prop('selectedIndex', 0);
								$("#discount_ctn3_ele").hide();
							}
						})

						$("input:text[name='homePrdNum']").keyup(function(e) {
							var content = $(this).val();

							if (content.length > 12) {
								alert('12자만 입력 가능합니다.');
							}
						});
						$('.max_counter').keyup();

						var submitTM_check = false;
						$("#submitTM").click(function() {
							
							var salesType = $("#salesType").find("option:selected").val();
							var agree = $("input:checkbox[name='agree1']").prop("checked");
							var prdctCd = $("#prdctCd").find("option:selected").val();
							var callDate = $('#callDate').val();
							var callType = $("input:radio[name='callType']:checked").val();
							if (callType === 'chooseTell') {
								if(callDate == null || callDate == ""){
									alert("통화 날짜를 선택하여 주세요");
									return
								}
							} 
							if($('#agentEmpNm').val() == null || $('#agentEmpNm').val() == ""){
								alert("실제 판매자 성명을 입력하여 주세요");
								return
							}
							if($('#agentEmpTel').val() == null || $('#agentEmpTel').val() == ""){
								alert("실제 판매자 연락처를 입력하여 주세요");
								return
							}
							if(salesType == '판매점 유치'){
								if ($('#whPosCd').val() == "") {
									alert("도매 판매점 POS코드를 입력하여 주세요");
									return;
								} 
								if ($('#whStoreNm').val() == "") {
									alert("도매 판매점을 입력하여 주세요");
									return;
								}
							}
							if(prdctCd == ""){
								alert("상품을 선택해 주세요");
								return;
							} 
							if($('#nameB').val() == ""){
								alert("고객명을 입력해주세요");
								return;
							}
							if($('#hpB').val() == ""){
								alert("고객연락처를 입력해주세요");
								return;
							} 
							if(agree == false){
								alert("개인 정보 활용 동의를 체크해주세요")
								return;
							} 
							
							
							
							var formObj = document.frm;
							formObj.action = "/LGUElectronic/insert.do";
							formObj.submit(); 
						});

						var submitEletronic_check = false;
						$("#submitEletronic").click(function() {
							
							var agree = $("input:checkbox[name='agree2']").prop("checked");
							var salesTypeEle = $("#salesTypeEle").find("option:selected").val();
							var pay = $("#pay").find("option:selected").val();
							var prdctCdEle = $("#prdctCdEle").find("option:selected").val();
							var callDateEle = $('#callDateEle').val();
							var callTypeEle = $("input:radio[name='callTypeEle']:checked").val();
							

							if (callTypeEle === 'chooseTell') {
								if(callDateEle == null || callDateEle == ""){
									alert("통화 날짜를 선택하여 주세요");
									return
								}
							}
							if($('#agentEmpNmEle').val() == null || $('#agentEmpNmEle').val() == ""){
								alert("실제 판매자 성명을 입력하여 주세요");
								return
							} 
							if($('#agentEmpTelEle').val() == null || $('#agentEmpTelEle').val() == ""){
								alert("실제 판매자 연락처를 입력하여 주세요");
								return
							} 
							if(salesTypeEle == '판매점 유치'){
								if ($('#whPosCdEle').val() == "") {
									alert("도매 판매점 POS코드를 입력하여 주세요");
									return;
								} 
								if ($('#whStoreNmEle').val() == "") {
									alert("도매 판매점을 입력하여 주세요");
									return;
								}
							} 
							if(prdctCdEle == ""){
								alert("상품을 선택해 주세요");
								return;
							} 
							if($("#checkAuth").val() != 'Y'){
								alert("휴대폰 인증을 해주세요");
								return;
							} 
							if($('#zipcd').val() == ""){
								alert("주소를 입력해주세요");
								return;
							}  
							if(pay == ""){
								alert("납입방법을 선택해 주세요");
								return;
							} 
							if(agree == false){
								alert("개인 정보 활용 동의를 체크해주세요")
								return;
							} 
							if (pay == 'card') {
								if($('#resultCode').val() != '00'){
									alert("카드 인증을 해주세요");
									return;
								}
							} 
							
							if(pay == 'cms') {
								if($('#isSuccess').val() != '200'){
									alert("계좌 인증을 해주세요");
									return;
								} 
							}
							
							var formObj = document.kcbResultForm;
							formObj.action = "/LGUElectronic/insert.do";
							formObj.submit();
						});
						
						$("#pay").change(function() {
							var val = $(this).val();

							if (val === 'card') {
								$('#cardNum').val("");
								$('#infoCardCom').val("");
								$('#cardMon').val("");
								$('#cardYear').val("");
								$('#cardNum').removeAttr('readonly');
								$('#cardMon').removeAttr('readonly');
								$('#cardYear').removeAttr('readonly');
								$(".accountPay").find("select[name='rdpMstBnkCd']").val("");
								$("#accountNum").val("");
								$(".cardPay").show();
								$(".accountPay").hide();
							} else if (val === 'cms') {
								$('#cardNum').val(""); 
								$('#infoCardCom').val("");
								$('#cardMon').val("");
								$('#cardYear').val("");
								$('#cardNum').removeAttr('readonly');
								$('#cardMon').removeAttr('readonly');
								$('#cardYear').removeAttr('readonly');
								$(".accountPay").find("select[name='rdpMstBnkCd']").val("");
								$("#accountNum").val("");
								$('.accountPay').val("");
								$(".cardPay").hide();
								$(".accountPay").show();
							}
						});
						$.datepicker.setDefaults({
					        dateFormat: 'yy-mm-dd',
					        prevText: '이전 달',
					        nextText: '다음 달',
					        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
					        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
					        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
					        showMonthAfterYear: true,
					        yearSuffix: '년'
					    });

					    $(function() {
					        $("#callDateEle").datepicker({minDate : 0});
					        $("#callDate").datepicker({minDate : 0});
					    });
					});  
	
	function mobileAuth() { // 모바일, 아이핀 인증 팝업
		var formObj = document.form1;
		window.open('', 'auth_popup', 'width=520, height=640');

		formObj.target = "auth_popup";
		formObj.submit();
	};

	function returnMobileAuth() {
		var f = document.kcbResultForm;
		if(f.ci.value != "") {
			//alert("휴대폰정보가 인증되었습니다.");
			var name = $('#name').val();
			var hp = $('#hp').val();
			$("#info").html(name + " / " + hp);
			$("#checkAuth").val("Y");
		}else {
			//alert("휴대폰정보 인증이 실패하였습니다.");
			$("#info").html("휴대폰정보 인증이 실패하였습니다.");
			$("#checkAuth").val("N");
		}
		
	}
	
	var doubleClickCheck = false;
	function doubleClick(){
		if (doubleClickCheck){
			alert("인증이 진행중입니다. 잠시만 기다려 주세요.");
			return doubleClickCheck;
		}else{
			
			doubleClickCheck = true;
			return false;
		}
	}

	
	function cardAuth() {
		//if(doubleClick()) return;
		var ci = $.trim($('#ci').val());		
		if (ci == ''){
			alert("휴대폰인증을 먼저 진행해 주세요");
			return $('#homeTel').focus();
		} 
		$.ajax({
			type : 'POST',
			url : '/outsourcing/cardAuthLGU.ajax',
			data : {
				buyerName : $('#name').val(),
				hp : $('#hp').val(),
				cardNum : $('#cardNum').val(),
				cardMon : $('#cardMon').val(),
				cardYear : $('#cardYear').val(),
				birthday : $('#birthday').val(),
				sex : $('#sex').val()
			},
			
			success : function(data) {				
				if (data.resultCode == "00") {
					var cardCode = data.cardCode;
					/* $('#cardCom').value(data.cardCode); */
					$("#infoCardCom").val(cardCode);
					$('#cardNum').attr("readonly", true);
					$('#cardMon').attr("readonly", true);
					$('#cardYear').attr("readonly", true);
					$("#resultCode").val("00");
					alert("카드정보가 인증되었습니다.");
				} else {
					alert("카드정보 인증이 실패하였습니다.");
				}
			},
			error : function() {
				console.log(data);				
			}
		});
	}

	function accountAuth_2022() {
		//if(doubleClick()) return;
		var bankCode = $(".accountPay").find("select[name='rdpMstBnkCd']").find("option:selected").data("cmn_com_etc1");
		var bankNm = $(".accountPay").find("select[name='rdpMstBnkCd']").find("option:selected").val();
		var accountNum = $("#accountNum").val();
		var ci = $.trim($('#ci').val());
		if (ci == ''){
			alert("휴대폰인증을 먼저 진행해 주세요");
			return $('#homeTel').focus();
		}
		$.ajax({
			type : 'POST',
			url : '/outsourcing/bankAccount2022.ajax',
			data: {
				bankCode: bankCode,
				accountNum: accountNum
			},
			error: function (data){
			},
			success : function(data) {
				if (data.isSuccess) {
					$(".accountPay").find("input[name='RDP_MST_BNK_ACT_CHECK']").val("Y");
					$(".accountPay").find("select[name='rdpMstBnkCd']").attr("disabled", true);
					$('#accountNum').attr("readonly", true);
					$('#rdpMstBnkCd').val(bankNm);
					$("#isSuccess").val("200");
					alert("계좌정보가 인증되었습니다.");
				} else {
					alert("계좌정보가 인증이 실패하였습니다. : " + data.message); // 오류 메세지
					$(".accountPay").find("input[name='RDP_MST_BNK_ACT_CHECK']").val("");
				}

			}
		});
	}

	function accountAuth() {
		//if(doubleClick()) return;  
		var bankCode = $(".accountPay").find("select[name='rdpMstBnkCd']").find("option:selected").data("cmn_com_etc1");
		var bankNm = $(".accountPay").find("select[name='rdpMstBnkCd']").find("option:selected").val();
		var accountNum = $("#accountNum").val();
		var ci = $.trim($('#ci').val());		
		if (ci == ''){
			alert("휴대폰인증을 먼저 진행해 주세요");
			return $('#homeTel').focus();
		}
		$.ajax({
			type : 'POST',
			url : '/outsourcing/bankAccount.ajax',
			data: {
				bankCode: bankCode,
				accountNum: accountNum
			},
			error: function (data){
			},
			success : function(data) {
				if (data.isSuccess) {
	                $(".accountPay").find("input[name='RDP_MST_BNK_ACT_CHECK']").val("Y");
	                $(".accountPay").find("select[name='rdpMstBnkCd']").attr("disabled", true);
					$('#accountNum').attr("readonly", true);
					$('#rdpMstBnkCd').val(bankNm);
					$("#isSuccess").val("200");
	                alert("계좌정보가 인증되었습니다.");
	            } else {
	                alert("계좌정보가 인증이 실패하였습니다. : " + data.message); // 오류 메세지
	                $(".accountPay").find("input[name='RDP_MST_BNK_ACT_CHECK']").val("");
	            }
	            
			}
		});
	}
	function ipTVClick() {
		alert("※ 혜택 번호 입력 주의\n※ IPTV 가입번호만 입력 가능\n※ IPTV 미 이용 시, 가입 불가"); 
	}
</script>
<!-- EOD : 2020.02.28 팝업  -->

<form name="form1" action="/outsourcing/phoneAuthLGU.do" method="post">   
	<input type="hidden" name="rqst_caus_cd" value="00" /> 
	<input type="hidden" name="rMsg" value="/outsourcing/checkAuthSMART.do" />
</form>

<div data-controller="CommonController OutsourcingController">
	<div class="col-12">
        <div class="page-title-box">
            <h2 class="page-title">${info.title}</h2>
        </div>
    </div>
</div>

<!--  유선계약 -->
<form name="frm" method="post" action="/LGUElectronic/insert.do" class="fixedLine">
	<input type="hidden" name="b2bStts" value="${info.b2bStts}" />
	<input type="hidden" name="b2bCd" value="${info.b2bCd}" class="notRequired" />
	<input type="hidden" name="b2bNm" value="${info.b2bNm}" class="notRequired" />

	<div data-controller="CommonController OutsourcingController">
		
		<c:if test="${info.agentInfoYn eq 'Y'}">
			<div class="col-12">
				<div class="card-box">
			        <ul class="nav nav-tabs">
			            <li class="nav-item">
			                <a class="nav-link active">
			                    <span class="d-none d-sm-block"><b>판매사 정보 입력</b></span>            
			                </a>
			            </li>
			        </ul>
			        
			        <div class="tab-content">
			            <div class="tab-pane fade show active">
			            	<!-- 멤버십 블루 선불카드번호 입력란 -->
			            	<c:if test="${info.prepaidCardNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 멤버십 블루<br>선불카드번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="prepaidCardNum" title="선불카드 번호" class="form-control numberChk" maxlength="8" />
								        <span class="red">※ 뒤 8자리</span>
								    </div>
								</div>
							</c:if>
							
							<!-- 대리점/직영점 코드 -->
							<c:if test="${info.uDlrCdYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>대리점/직영점 코드</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uDlrCd" value="${uDlrCd}" title="대명 가입 번호" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 유치대리점명 입력란 -->
							<c:if test="${info.uDlrNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>유치대리점명</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uDlrNm" value="${uDlrNm}" title="유치대리점명" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 유치조직코드 입력란 -->
							<c:if test="${info.uCmmnCdYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>채널유형코드</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uCmmnCd" value="${uCmmnCd}" title="채널유형코드" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 유치조직명 입력란 -->
							<c:if test="${info.uCmmnCdNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>채널유형코드명</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uCmmnCdNm" value="${uCmmnCdNm}" title="채널유형코드명" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 상담등록자 사번 -->
							<c:if test="${info.uIndcEmpnoYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>상담등록자 사번</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uIndcEmpno" value="${uIndcEmpno}" title="상담등록자 사번" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 상담등록자 마당 ID -->
							<c:if test="${info.uIntgUserIdYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>상담등록자 마당 ID</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uIntgUserId" value="${uIntgUserId}" title="상담등록자 마당 ID" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 판매사원 성명 입력란 -->
							<c:if test="${info.agentEmpNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 실제 판매자 성명</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentEmpNm" title="판매사원명" class="form-control" maxlength="20" id="agentEmpNm" onblur="javascript:kcbResultForm.agentEmpNm.value=this.value;"/>
								    </div>
								</div>
							</c:if>
							
							<!-- 매장코드 입력란 -->
							<c:if test="${info.agentCdYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 매장 코드</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentCd" title="매장코드 번호" class="form-control" maxlength="8" id="agentCd"/>
										<span class="red">※ 매장 코드 형식 (삼판 : Z*** / 대리점 : D***)</span>
								    </div>
								</div>
							</c:if>
							
							<!-- 대리점명 입력란 -->
							<c:if test="${info.agentNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 대리점명</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentNm" title="대리점명" class="form-control" maxlength="20" />
										<span class="red">* 판매점 직접 유치 건이면, 판매점명 입력.</span>
								    </div>
								</div>
							</c:if>
							
							<!-- 실제 판매자 연락처 입력란 -->
							<c:if test="${info.agentEmpTelYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 실제 판매자 연락처</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentEmpTel" title="담당자 연락처" class="form-control phoneChk" maxlength="13" id="agentEmpTel" onblur="javascript:kcbResultForm.agentEmpTel.value=this.value;"/>
								    </div>
								</div>
							</c:if>
							
							<!-- 도매직영점 판매구분 입력란 -->
							<c:if test="${info.salesTypeYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>도매직영점 판매구분</b></label>
								    <div class="col-md-10">
								        <select id="salesType" name="salesType" title="도매직영점 판매구분" class="form-control notRequired">
											<option value="">선택하세요.</option>
											<option value="판매점 유치">판매점 유치</option>
											<option value="점장/FM 유치">점장/FM 유치</option>
										</select>
										<span class="red">* 도매직영점인 경우 반드시 선택.</span>
								    </div>
								</div>
							</c:if>
							
							<!-- 도매 판매점 POS코드 입력란 -->
							<c:if test="${info.whPosCdYn eq 'Y'}">
								<div class="wholesaleInput" style="display:none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>* 도매 판매점 POS코드</b></label>
									    <div class="col-md-10">
									        <input type="text" name="whPosCd" title="도매 판매점 POS코드" class="form-control notRequired" maxlength="20" id="whPosCd" onblur="javascript:kcbResultForm.whPosCd.value=this.value;"/>
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 도매 판매점명 입력란 -->
							<c:if test="${info.whStoreNmYn eq 'Y'}">
								<div class="wholesaleInput" style="display:none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>* 도매 판매점명</b></label>
									    <div class="col-md-10">
									        <input type="text" name="whStoreNm" title="도매 판매점명" class="form-control notRequired" maxlength="20"  id="whStoreNm" onblur="javascript:kcbResultForm.whStoreNm.value=this.value;"/>
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 가입회사명 입력란 -->
							<c:if test="${info.companyNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 가입회사명</b></label>
								    <div class="col-md-10">
								        <input type="text" name="companyNm" title="가입회사명" class="form-control" maxlength="50" />
								    </div>
								</div>
							</c:if>
							
							<!-- 담당자명 입력란 -->
							<c:if test="${info.b2bEmpCdYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 담당자명</b></label>
								    <div class="col-md-10">
								        <input type="text" name="b2bEmpCd" title="담당자명" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 영업채널1 입력란 -->
							<c:if test="${info.code1Yn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 영업채널1</b></label>
								    <div class="col-md-10">
								        <select name="code1"  class="form-control" title="영업채널1">
											<option value="">[영업채널1 선택]</option>
											<c:forEach var="list" items="${prdctList.channel}">
												<option value="${list.cd}">${list.cdNm}</option>
											</c:forEach>
										</select>
								    </div>
								</div>
							</c:if>
							
							<!-- 영업채널2 입력란 -->
							<c:if test="${info.code3Yn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 영업채널2</b></label>
								    <div class="col-md-10">
								        <input type="text" name="code3" title="영업채널2" class="form-control" maxlength="20" />
										<span class="red"> * 세부 채널명을 입력해주세요. 예시) 강남점 / 제1국 등</span>
								    </div>
								</div>
							</c:if>
							
							<!-- 판매사코드/사번 입력란 -->
							<c:if test="${info.code2Yn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 코드</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentCode1" title="코드" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 주문번호 입력란 -->
							<c:if test="${info.orderNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 주문번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="orderNum" title="주문번호" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 판매사원 사번 입력란 -->
							<c:if test="${info.agentEmpNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 판매사원 사번</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentEmpNum" title="판매사원 사번" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
									
							<!-- NUMBER 입력란 -->
							<c:if test="${info.agentNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* NUMBER</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentNum" title="NUMBER" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
									
							<!-- 코드(영문) 입력란 -->
							<c:if test="${info.agentCodeEnYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* CODE</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentCode2" title="CODE" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
									
							<!-- 기타 입력란 -->
							<c:if test="${info.agentEtcYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>기타</b></label>
								    <div class="col-md-10">
								        <textarea name="agentEtc" title="기타" class="form-control notRequired" style="height:60px;" maxlength="2000"></textarea>
								    </div>
								</div>
							</c:if>
									
							<!-- 고유번호 입력란 -->
							<c:if test="${info.agentUnqNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 고유번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentUnqNum" title="고유번호" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
									
							<!-- 판매자 번호 입력란 -->
							<c:if test="${info.sllrNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 판매자 번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="sllrNum" title="판매자 번호" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
									
							<!-- 판매자 소속 입력란 -->
							<c:if test="${info.sllrPartYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 판매자 소속</b></label>
								    <div class="col-md-10">
								        <input type="text" name="sllrPart" title="판매자 소속" class="form-control" maxlength="50" />
								    </div>
								</div>
							</c:if>
									
							<!-- 판매자 연락처 입력란 -->
							<c:if test="${info.sllrCtelYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 판매자 연락처</b></label>
								    <div class="col-md-10">
								        <input type="text" name="sllrCtel" title="판매자 연락처" class="form-control phoneChk" maxlength="13" />
								    </div>
								</div>
							</c:if>
			            </div>
			        </div>
			    </div>
		    </div>
	    </c:if>
	    
	    <c:if test="${info.customerInfoYn eq 'Y'}">
			<div class="col-12">
				<div class="card-box">
			        <ul class="nav nav-tabs">
			            <li class="nav-item">
			                <a class="nav-link active">
			                    <span class="d-none d-sm-block"><b>고객 정보 입력</b>&nbsp;&nbsp;<span class="red">※ 기존 접수 고객 중복 접수 시,가입 처리가 더욱 지연됩니다.</span></span>         
			                </a>
			            </li>
			        </ul>
			
			        <div class="tab-content">
			            <div class="tab-pane fade show active">
			            	<div class="form-group row d-flex flex-wrap-wrap">
							<label class="col-md-2 col-form-label" for=""><b>* 가입 방법 선택</b></label>
								<div class="col-md-10">
								<div class="custom-control custom-radio d-inline-block">
									<input type="radio" name="joinMethod" value="fixedLine" data-con="fixedLine" id="joinMethodTM" title="joinMethod" checked class="custom-control-input"> 
									<label for="joinMethodTM" class="custom-control-label">유선계약(TM녹취)</label>&nbsp;&nbsp;
								</div>
								<div class="custom-control custom-radio d-inline-block"> 
									<input type="radio" name="joinMethod" value="electronicContract" data-con="electronicContract" id="joinMethodEle"  title="joinMethod" class="custom-control-input">
									<label for="joinMethodEle" class="custom-control-label">전자계약</label>&nbsp;&nbsp;※ 미성년자 가입 불가 
								</div>
								</div>																		
							</div>
			            	<!-- 상품1 선택란 -->
							<c:if test="${info.prdctNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 상품 선택1</b></label>
								    <div class="col-md-10">
								        <select id="prdctCd" name="prdctCd" title="상품" class="form-control">
											<option value="">[상품선택]</option>
											<c:forEach var="list" items="${prdctList.product}">
												<c:if test="${list.cd eq 'LGU9' || list.cd eq 'LGU10' || list.cd eq 'LGU11' || list.cd eq 'LGU12' || list.cd eq 'LGU13' }">
													<option value="${list.cd}">${list.cdNm}</option>
												</c:if>
											</c:forEach>
										</select>
								    </div>
								</div>
							</c:if>
							
							<!-- 할인받을 연락처 입력란 -->
							<c:if test="${info.discountCtnYn eq 'Y'}">
								<div id="discount_ctn" style="display: none;" >
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>할인 받을 연락처(CTN)</b></label>
									    <div class="col-md-10">
									        <input type="text" name="discountCtn" title="할인 받을 연락처" class="form-control phoneChk notRequired" maxlength="13"/>
									        <span class="red">※ 실제 혜택이 적용될 U+ CTN 정확히 기재</span><br>
									        <span class="red">※ 미 기재 시, U-Cube 상담 등록 시, 가입번호로 혜택 적용</span>
									    </div>
									</div>
								</div>
								
								<div id="discount_ctn_10" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>혜택 받을 IPTV 가입번호</b></label>
									    <div class="col-md-10">
									        <input type="text" name="discountCtn_10" onclick="ipTVClick();" title="혜택 받을 IPTV 가입번호" class="form-control notRequired"/>
									        <span class="red">※ 인터넷 가입번호 입력 불가</span><br>
											<span class="red">※ 핸드폰 번호 입력 불가</span>
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 가입 희망 구좌 -->
							<c:if test="${info.mainContTypeYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 주 계약1</b></label>
								    <div class="col-md-10">
								    	<div class="custom-control custom-radio d-inline-block">
									        <input type="radio" name="mainContType" value="여행" id="mainContType2" title="주 계약" checked class="custom-control-input"> 
									        <label for="mainContType2" class="custom-control-label">여행</label>&nbsp;&nbsp;
								        </div>
								        <div class="custom-control custom-radio d-inline-block"> 
									        <input type="radio" name="mainContType" value="크루즈" id="mainContType3" title="주 계약" class="custom-control-input">
											<label for="mainContType3" class="custom-control-label">크루즈</label>&nbsp;&nbsp;
										</div>
										<div class="custom-control custom-radio d-inline-block"> 
											<input type="radio" name="mainContType" value="어학연수" id="mainContType5" title="주 계약" class="custom-control-input"> 
											<label for="mainContType5" class="custom-control-label">어학연수</label>&nbsp;&nbsp;
										</div>
										<div class="custom-control custom-radio d-inline-block"> 
											<input type="radio" name="mainContType" value="골프" id="mainContType4" title="주 계약" class="custom-control-input">
											<label for="mainContType4" class="custom-control-label">골프</label>&nbsp;&nbsp;
										</div>
										<div class="custom-control custom-radio d-inline-block"> 
											<input type="radio" name="mainContType" value="상조" id="mainContType1" title="주 계약" class="custom-control-input">
											<label for="mainContType1" class="custom-control-label">상조</label>&nbsp;&nbsp;
										</div>
								    </div>
								</div>
							</c:if>
							
							<!-- 대명 가입번호 입력란 -->
							<c:if test="${info.idNoYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>대명 가입 번호1</b></label>
								    <div class="col-md-10">
								        <input type="text" name="idNo" value="${dmEntrNo}" title="대명 가입 번호" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 상품2 선택란 -->
							<c:if test="${info.prdctNm2Yn eq 'Y'}">
								<div class="invisible1" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>상품 선택2</b></label>
									    <div class="col-md-10">
									        <select id="prdctCd2" name="prdctCd2" title="상품" class="form-control notRequired">
												<option value="">[상품선택]</option>
												<c:forEach var="list" items="${prdctList.product}">
													<c:if test="${list.cd eq 'LGU9' || list.cd eq 'LGU10' || list.cd eq 'LGU11' || list.cd eq 'LGU12' || list.cd eq 'LGU13'}">
														<option value="${list.cd}">${list.cdNm}</option>
													</c:if>
												</c:forEach>
											</select>
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 할인받을 연락처 입력란 -->
							<c:if test="${info.discountCtnYn eq 'Y'}">
								<div id="discount_ctn2" style="display: none;" >
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>할인 받을 연락처(CTN)</b></label>
									    <div class="col-md-10">
									        <input type="text" name="discountCtn2" title="할인 받을 연락처" class="form-control phoneChk notRequired" maxlength="13" />
									        <span class="red">※ 실제 혜택이 적용될 U+ CTN 정확히 기재</span><br> 
									        <span class="red">※ 미 기재 시, U-Cube 상담 등록 시, 가입번호로 혜택 적용</span>
									    </div>
									</div>
								</div>
								
								<div id="discount_ctn2_10" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>혜택 받을 IPTV 가입번호</b></label>
									    <div class="col-md-10">
									        <input type="text" name="discountCtn2_10" onclick="ipTVClick();" title="혜택 받을 IPTV 가입번호" class="form-control notRequired"/>
									        <span class="red">※ 인터넷 가입번호 입력 불가</span><br>
											<span class="red">※ 핸드폰 번호 입력 불가</span>
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 가입 희망 구좌 -->
							<c:if test="${info.mainContTypeYn eq 'Y'}">
								<div class="invisible1" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>* 주 계약2</b></label>
									    <div class="col-md-10">
											<div class="custom-control custom-radio d-inline-block">
												<input type="radio" name="mainContType2" value="여행" id="secondContType2" title="주 계약" checked class="custom-control-input"> 
												<label for="secondContType2" class="custom-control-label">여행</label>&nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block"> 
												<input type="radio" name="mainContType2" value="크루즈" id="secondContType3" title="주 계약" class="custom-control-input"> 
												<label for="secondContType3" class="custom-control-label">크루즈</label>&nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block"> 
												<input type="radio" name="mainContType2" value="어학연수" id="secondContType5" title="주 계약" class="custom-control-input"> 
												<label for="secondContType5" class="custom-control-label">어학연수</label>&nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block"> 
												<input type="radio" name="mainContType2" value="골프" id="secondContType4" title="주 계약" class="custom-control-input"> 
												<label for="secondContType4" class="custom-control-label">골프</label> &nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block">
												<input type="radio" name="mainContType2" value="상조" id="secondContType1" title="주 계약" class="custom-control-input"> 
												<label for="secondContType1" class="custom-control-label">상조</label>	&nbsp;&nbsp;
											</div>									
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 대명 가입번호2 입력란 -->
							<c:if test="${info.idNoYn eq 'Y'}">
								<div class="invisible1" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>대명 가입 번호2</b></label>
									    <div class="col-md-10">
									        <input id="idNoInput2" type="text" name="idNo2" value="${dmEntrNo2}" title="대명 가입 번호" class="form-control" readonly="readonly" />
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 상품3 선택란 -->
							<c:if test="${info.prdctNm3Yn eq 'Y'}">
								<div class="invisible2" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>상품 선택3</b></label>
									    <div class="col-md-10">
									        <select id="prdctCd3" name="prdctCd3" title="상품" class="form-control notRequired">
												<option value="">[상품선택]</option>
												<c:forEach var="list" items="${prdctList.product}">
													<c:if test="${list.cd eq 'LGU9' || list.cd eq 'LGU10' || list.cd eq 'LGU11' || list.cd eq 'LGU12' || list.cd eq 'LGU13'}">
														<option value="${list.cd}">${list.cdNm}</option>
													</c:if>
												</c:forEach>
											</select>
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 할인받을 연락처 입력란 -->
							<c:if test="${info.discountCtnYn eq 'Y'}">
								<div id="discount_ctn3" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>할인 받을 연락처(CTN)</b></label>
									    <div class="col-md-10">
									        <input type="text" name="discountCtn3" title="할인 받을 연락처" class="form-control phoneChk notRequired" maxlength="13"/>
									        <span class="red">※ 실제 혜택이 적용될 U+ CTN 정확히 기재</span><br> 
									        <span class="red">※ 미 기재 시, U-Cube 상담 등록 시, 가입번호로 혜택 적용</span>
									    </div>
									</div>
								</div>
								<div id="discount_ctn3_10" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>혜택 받을 IPTV 가입번호</b></label>
									    <div class="col-md-10">
									        <input type="text" name="discountCtn3_10" onclick="ipTVClick();" title="혜택 받을 IPTV 가입번호" class="form-control notRequired"/>
									        <span class="red">※ 인터넷 가입번호 입력 불가</span><br>
											<span class="red">※ 핸드폰 번호 입력 불가</span>
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 가입 희망 구좌 -->
							<c:if test="${info.mainContTypeYn eq 'Y'}">
								<div class="invisible2" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>* 주 계약3</b></label>
									    <div class="col-md-10">
											<div class="custom-control custom-radio d-inline-block">
												<input type="radio" name="mainContType3" value="여행" id="thirdContType2" title="주 계약" checked class="custom-control-input"> 
												<label for="thirdContType2" class="custom-control-label">여행</label>&nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block"> 
												<input type="radio" name="mainContType3" value="크루즈" id="thirdContType3" title="주 계약" class="custom-control-input"> 
												<label for="thirdContType3" class="custom-control-label">크루즈</label>&nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block"> 
												<input type="radio" name="mainContType3" value="어학연수" id="thirdContType5" title="주 계약" class="custom-control-input"> 
												<label for="thirdContType5" class="custom-control-label">어학연수</label>&nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block"> 
												<input type="radio" name="mainContType3" value="골프" id="thirdContType4" title="주 계약" class="custom-control-input"> 
												<label for="thirdContType4" class="custom-control-label">골프</label>&nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block">  
												<input type="radio" name="mainContType3" value="상조" id="thirdContType1" title="주 계약" class="custom-control-input"> 
												<label for="thirdContType1" class="custom-control-label">상조</label>&nbsp;&nbsp;
											</div>
										</div>
									</div>
								</div>
							</c:if>
							
							<!-- 대명 가입번호3 입력란 -->
							<c:if test="${info.idNoYn eq 'Y'}">
								<div class="invisible2" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>대명 가입 번호3</b></label>
									    <div class="col-md-10">
									        <input id="idNoInput3" type="text" name="idNo3" value="${dmEntrNo3}" title="대명 가입 번호" class="form-control"readonly="readonly" />
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- U+ 서비스명, 상품번호 -->
							<c:if test="${info.uProdNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>U+ 서비스명</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uProdNm" value="${uProdNm}" title="U+ 서비스명" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							<c:if test="${info.uProdNoYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>U+ 상품번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uProdNo" value="${uProdNo}" title="U+ 상품번호" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 결합 상품 선택란 -->
							<c:if test="${info.fusionPrdctYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>결합상품 선택</b></label>
								    <div class="col-md-10">
								        <select name="fusionPrdctCd" title="결합상품" class="form-control" >
											<option value="">[상품선택]</option>
											<c:forEach var="list" items="${prdctList.goods}">
												<option value="${list.cd}">${list.cdNm}</option>
											</c:forEach>
										</select>
								    </div>
								</div>
							</c:if>
							
							<!-- U+ 가입번호 입력란 -->
							<c:if test="${info.homePrdNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>U+ 가입번호</b></label>
								    <div class="col-md-10">
								        <p id="uEntrNo_tmp" style="display: none;">${uEntrNo }</p> 
								        <input type="text" name="homePrdNum" value="${uEntrNo }" title="U+홈상품 가입번호" class="form-control notRequired numberChk" maxlength="12" readonly="readonly"/> 
								        <span class="prdComment hidden" style="color: red;"> ※ 홈상품 가입번호가 맞는지 확인 바랍니다. </span>
								    </div>
								</div>
							</c:if>
							
							<!-- 고객명 입력란 -->
							<c:if test="${info.nameYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 고객명</b></label>
								    <div class="col-md-10">
								        <input type="text" name="name" title="고객명" id="nameB" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 점포명 입력란 -->
							<c:if test="${info.storeNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 점포명(GS수퍼)</b></label>
								    <div class="col-md-10">
								        <input type="text" name="storeNm" title="점포명" class="form-control" maxlength="50" />
								    </div>
								</div>
							</c:if>
							
							<!-- 고객 연락처(핸드폰) 입력란 -->
							<c:if test="${info.hpYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 고객 연락처(핸드폰)</b></label>
								    <div class="col-md-10">
								        <c:if test="${info.telecomYn eq 'Y'}">
											<select name="telecom" class="form-control" title="통신사">
												<option value="">선택하세요.</option>
												<option value="LGU">LGU+</option>
												<option value="SKT">SKT</option>
												<option value="KT">KT</option>
											</select>
										</c:if>
										<input type="text" name="hp" title="고객 연락처" id="hpB" class="form-control phoneChk" maxlength="13" />
								    </div>
								</div>
							</c:if>
							
							
							<!-- 이메일 입력란 -->
							<c:if test="${info.emailYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 이메일</b></label>
								    <div class="col-md-10">
								        <input type="text" name="email" title="이메일" class="form-control emailChk" maxlength="30" />
								    </div>
								</div>
							</c:if>
							
							<!-- 주소 입력란 -->
							<c:if test="${info.addressYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 주소</b></label>
								    <div class="col-md-10">
								        <div class="input-group">
                                              <input type="text" id="zipcd" name="zipcd" class="form-control add1 notRequired" maxlength="7"  /> <!-- maxlength="7" readonly="readonly" />-->
                                              <div class="input-group-append">
                                                  <button class="btn btn-dark waves-effect waves-light" type="button" id="zipcodeDaum">우편번호 찾기</button>
                                              </div>
                                          </div>
                                          <input type="text" name="adr" class="form-control" maxlength="100"  /> <!-- maxlength="100" readonly="readonly" />-->
                                          <input type="text" name="adr_dtl" title="상세주소" class="form-control" maxlength="100" placeholder="상세주소" />
								    </div>
								</div>
							</c:if>
							
							<!-- 상담 가능 시간대 입력란 -->
							<c:if test="${info.calltimeYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 상담 가능 시간대</b></label>
								    <div class="col-md-10">
								        <select name="calltime" class="form-control" title="상담 가능 시간대">
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
								    </div>
								</div>
							</c:if>
							
							<!-- SKB 가입상태 선택란 -->
							<c:if test="${info.skbJoinYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* SKB 가입상태</b></label>
								    <div class="col-md-10">
								        <select name="skbJoin" title="SKB 가입상태" class="form-control">
											<option value="">[SKB 가입상태]</option>
											<option value="가입완료">가입완료</option>
											<option value="가입보류">가입보류</option>
										</select>
								    </div>
								</div>
							</c:if>
							
							<!-- 롯데카드번호 입력란 -->
							<c:if test="${info.lotCardNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 롯데카드번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="lotCardNum" title="롯데카드번호" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 코드(국문) 입력란 -->
							<c:if test="${info.cstmrCodeKrYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 코드</b></label>
								    <div class="col-md-10">
								        <input type="text" name="cstmrCode1" title="코드" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 고객 고유번호 입력란 -->
							<c:if test="${info.cstmrUnqNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 고객 고유번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="cstmrUnqNum" title="고객 고유번호" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 카드번호 입력란 -->
							<c:if test="${info.cardNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>카드번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="cardNum" title="카드번호" class="form-control notRequired" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- NUMBER 입력란 -->
							<c:if test="${info.cstmrNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* NUMBER</b></label>
								    <div class="col-md-10">
								        <input type="text" name="cstmrNum" title="NUMBER" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 코드(영문) 입력란 -->
							<c:if test="${info.cstmrCodeEnYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* CODE</b></label>
								    <div class="col-md-10">
								        <input type="text" name="cstmrCode2" title="CODE" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 기타 입력란 -->
							<c:if test="${info.cstmrEtcYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>기타</b></label>
								    <div class="col-md-10">
								        <textarea name="cstmrEtc" title="기타" class="form-control notRequired" style="height: 60px;" maxlength="2000"></textarea>
								    </div>
								</div>
							</c:if>
							
							<!-- 한샘 통합 멤버십 입력란 -->
							<c:if test="${info.hanssMbspNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 한샘 통합 멤버십</b></label>
								    <div class="col-md-10">
								        <input type="text" name="hanssMbspNum" title="한샘 통합 멤버십" class="form-control" maxlength="9" />
								        <span class="red"> * 상담을 위해서 한샘 통합 멤버십 고객 번호가 반드시 필요합니다. (9자리)</span>
								    </div>
								</div>
							</c:if>
							
							<!-- 멤버십 번호 입력란 -->
							<c:if test="${info.mbspNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 멤버십 번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="mbspNum" title="멤버십 번호" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							
							<div class="form-group row d-flex flex-wrap-wrap">
							    <label class="col-md-2 col-form-label" for=""><b>* 통화 요청 시간</b></label>
							    <div class="custom-control custom-radio d-inline-block">
									<input type="radio" name="callType" value="quickTell" id="quickTell" title="빠른 통화" checked class="custom-control-input"> 
									<label for="quickTell" class="custom-control-label">빠른 통화</label>&nbsp;&nbsp;
								</div>
								<div class="custom-control custom-radio d-inline-block">
									<input type="radio" name="callType" value="chooseTell" id="chooseTell" title="희망 통화 시간" class="custom-control-input"> 
									<label for="chooseTell" class="custom-control-label">희망 통화 시간</label>&nbsp;&nbsp;
								</div>
								<div class="col-md-2" >
                                    <input class="form-control" name="callDate" type="text" id="callDate">
                                </div>
								<div class="custom-control custom-radio d-inline-block" >
							        <select name="callTime" class="form-control" title="상담 가능 시간대" id="callTime">
											<option value="">선택해 주세요</option>
											<option value="시간 상관 없음">시간 상관 없음</option>
											<option value="10:00 ~ 10:30">10:00 ~ 10:30</option>
											<option value="10:30 ~ 11:00">10:30 ~ 11:00</option>
											<option value="11:00 ~ 11:30">11:00 ~ 11:30</option>
											<option value="11:30 ~ 12:00">11:30 ~ 12:00</option>
											<option value="12:00 ~ 12:30">12:00 ~ 12:30</option>
											<option value="12:30 ~ 13:00">12:30 ~ 13:00</option>
											<option value="13:00 ~ 13:30">13:00 ~ 13:30</option>
											<option value="13:30 ~ 14:00">13:30 ~ 14:00</option>
											<option value="14:00 ~ 14:30">14:00 ~ 14:30</option>
											<option value="14:30 ~ 15:00">14:30 ~ 15:00</option>
											<option value="15:00 ~ 15:30">15:00 ~ 15:30</option>
											<option value="15:30 ~ 16:00">15:30 ~ 16:00</option>
											<option value="16:00 ~ 16:30">16:00 ~ 16:30</option>
											<option value="16:30 ~ 17:00">16:30 ~ 17:00</option>
											<option value="17:00 ~ 17:30">17:00 ~ 17:30</option>
											<option value="17:30 ~ 18:00">17:30 ~ 18:00</option>
											<option value="18:00 ~ 18:30">18:00 ~ 18:30</option>
											<option value="18:30 ~ 19:00">18:30 ~ 19:00</option>
											<option value="19:00 ~ 19:30">19:00 ~ 19:30</option>
											<option value="19:30 ~ 20:00">19:30 ~ 20:00</option>
									</select>
								</div>
							</div>
							<div class="form-group row d-flex flex-wrap-wrap">
								<label class="col-md-2 col-form-label" for=""></label>
								<span class="red"> &nbsp;※ 가입센터 운영 시간 : 월~금요일 (10시~20시) / 토요일 (10시~19시)</span><br>
							</div>
			            </div>
			        </div>
			    </div>
			</div>
			<%-- <!-- 고객정보 안내사항 표시란 -->
			<c:if test="${info.cinfoYn eq 'Y'}">
				<div class="col-12">
					<div class="card-box">
						<div id="cinfo" style="white-space: pre-line">${info.cinfo}</div>
					</div>
				</div>
			</c:if> --%>
		</c:if>
		<!-- 개인 정보 활용 동의 표시란 -->
		<div class="col-12">
			<div class="card-box">
				<c:if test="${info.termsYn eq 'Y'}">
					<div class="termDiv mt40">
						<p class="tit">개인 정보 활용 동의</p>
						<button type="button" class="check checkBtn">
							<strong>동의합니다.</strong> <img src="/common/images/btn/check_bt.gif" alt="체크">
						</button>
						<input type="checkbox" name="agree1" class="agree" style="display: none" />
						<div class="termBox">${info.terms}</div>
					</div>
				</c:if>
	
				<div class="mt30 taC">
					<a href="javascript:" class="btnRed" id="submitTM">신청</a> 
				</div>
			</div>
		</div>
	</div>
</form>

<!--  전자계약 -->

<form name="kcbResultForm" id="kcbResultForm" method="post" action="/LGUElectronic/insert.do" class="electronicContract" style="display: none;">
	<input type="hidden" name="b2bStts" value="${info.b2bStts}" /> 
	<input type="hidden" name="b2bCd" value="${info.b2bCd}" />
	<input type="hidden" name="b2bNm" value="${info.b2bNm}" />
	
	<input type="hidden" name="result_cd" value="" /> 
	<input type="hidden" name="result_msg" value="" /> 
	<input type="hidden" name="authYn" id="authYn" value="" /> 
	<input type="hidden" name="di" value="" />
	<input type="hidden" name="ci" value="" id="ci"/> 
	<input type="hidden" name="name"  id="name" value="" /> 
	<input type="hidden" name="birthday" id="birthday" value="" />
	<input type="hidden" name="birth" id="birth" value="" />
	<input type="hidden" name="sex" id="sex" value="" /> 
	<input type="hidden" name="tel_com_cd" value="" /> 
	<input type="hidden" name="tel_no"  id="hp" class="form-control phoneChk" maxlength="13"  value="" /> 
	<input type="hidden" name="return_msg" value="" />
	<input type="hidden" name="resultCode" id="resultCode" value="" />
	<input type="hidden" name="isSuccess" id="isSuccess" value="" />
	<input type="hidden" name="checkAuth" id="checkAuth" value="" />
	<input type="hidden" name="rdpMstBnkCd" id="rdpMstBnkCd" value="" />
		
	<div data-controller="CommonController OutsourcingController">
		<c:if test="${info.agentInfoYn eq 'Y'}">
			<div class="col-12">
				<div class="card-box">
			        <ul class="nav nav-tabs">
			            <li class="nav-item">
			                <a class="nav-link active">
			                    <span class="d-none d-sm-block"><b>판매사 정보 입력</b></span>            
			                </a>
			            </li>
			        </ul>
			
			        <div class="tab-content">
			            <div class="tab-pane fade show active">
			            
			            	<!-- 멤버십 블루 선불카드번호 입력란 -->
			            	<c:if test="${info.prepaidCardNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 멤버십 블루<br>선불카드번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="prepaidCardNum" title="선불카드 번호" class="form-control numberChk" maxlength="8" />
								        <span class="red">※ 뒤 8자리</span>
								    </div>
								</div>
							</c:if>
							
							<!-- 대리점/직영점 코드 -->
							<c:if test="${info.uDlrCdYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>대리점/직영점 코드</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uDlrCd" value="${uDlrCd}" title="대명 가입 번호" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 유치대리점명 입력란 -->
							<c:if test="${info.uDlrNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>유치대리점명</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uDlrNm" value="${uDlrNm}" title="유치대리점명" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 유치조직코드 입력란 -->
							<c:if test="${info.uCmmnCdYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>채널유형코드</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uCmmnCd" value="${uCmmnCd}" title="채널유형코드" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 유치조직명 입력란 -->
							<c:if test="${info.uCmmnCdNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>채널유형코드명</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uCmmnCdNm" value="${uCmmnCdNm}" title="채널유형코드명" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 상담등록자 사번 -->
							<c:if test="${info.uIndcEmpnoYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>상담등록자 사번</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uIndcEmpno" value="${uIndcEmpno}" title="상담등록자 사번" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 상담등록자 마당 ID -->
							<c:if test="${info.uIntgUserIdYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>상담등록자 마당 ID</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uIntgUserId" value="${uIntgUserId}" title="상담등록자 마당 ID" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 판매사원 성명 입력란 -->
							<c:if test="${info.agentEmpNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 실제 판매자 성명</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentEmpNm" title="판매사원명" class="form-control" maxlength="20" id="agentEmpNmEle" onblur="javascript:frm.agentEmpNm.value=this.value;"/>
								    </div>
								</div>
							</c:if>
							
							<!-- 매장코드 입력란 -->
							<c:if test="${info.agentCdYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 매장 코드</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentCd" title="매장코드 번호" class="form-control" maxlength="8" id="agentCdEle"/>
										<span class="red">※ 매장 코드 형식 (삼판 : Z*** / 대리점 : D***)</span>
								    </div>
								</div>
							</c:if>
							
							<!-- 대리점명 입력란 -->
							<c:if test="${info.agentNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 대리점명</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentNm" title="대리점명" class="form-control" maxlength="20" />
										<span class="red">* 판매점 직접 유치 건이면, 판매점명 입력.</span>
								    </div>
								</div>
							</c:if>
							
							<!-- 실제 판매자 연락처 입력란 -->
							<c:if test="${info.agentEmpTelYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 실제 판매자 연락처</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentEmpTel" title="담당자 연락처" class="form-control phoneChk" maxlength="13" id="agentEmpTelEle" onblur="javascript:frm.agentEmpTel.value=this.value;"/>
								    </div>
								</div>
							</c:if>
							
							<!-- 도매직영점 판매구분 입력란 -->
							<c:if test="${info.salesTypeYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>도매직영점 판매구분</b></label>
								    <div class="col-md-10">
								        <select id="salesTypeEle" name="salesType" title="도매직영점 판매구분" class="form-control notRequired">
											<option value="">선택하세요.</option>
											<option value="판매점 유치">판매점 유치</option>
											<option value="점장/FM 유치">점장/FM 유치</option>
										</select>
										<span class="red">* 도매직영점인 경우 반드시 선택.</span>
								    </div>
								</div>
							</c:if>
							
							<!-- 도매 판매점 POS코드 입력란 -->
							<c:if test="${info.whPosCdYn eq 'Y'}">
								<div class="wholesaleInputEle" style="display:none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>* 도매 판매점 POS코드</b></label>
									    <div class="col-md-10">
									        <input type="text" name="whPosCd" title="도매 판매점 POS코드" class="form-control notRequired" maxlength="20" id="whPosCdEle" onblur="javascript:frm.whPosCd.value=this.value;"/>
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 도매 판매점명 입력란 -->
							<c:if test="${info.whStoreNmYn eq 'Y'}">
								<div class="wholesaleInputEle" style="display:none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>* 도매 판매점명</b></label>
									    <div class="col-md-10">
									        <input type="text" name="whStoreNm" title="도매 판매점명" class="form-control notRequired" maxlength="20"  id="whStoreNmEle" onblur="javascript:frm.whStoreNm.value=this.value;"/>
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 가입회사명 입력란 -->
							<c:if test="${info.companyNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 가입회사명</b></label>
								    <div class="col-md-10">
								        <input type="text" name="companyNm" title="가입회사명" class="form-control" maxlength="50" />
								    </div>
								</div>
							</c:if>
							
							<!-- 담당자명 입력란 -->
							<c:if test="${info.b2bEmpCdYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 담당자명</b></label>
								    <div class="col-md-10">
								        <input type="text" name="b2bEmpCd" title="담당자명" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 영업채널1 입력란 -->
							<c:if test="${info.code1Yn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 영업채널1</b></label>
								    <div class="col-md-10">
								        <select name="code1"  class="form-control" title="영업채널1">
											<option value="">[영업채널1 선택]</option>
											<c:forEach var="list" items="${prdctList.channel}">
												<option value="${list.cd}">${list.cdNm}</option>
											</c:forEach>
										</select>
								    </div>
								</div>
							</c:if>
							
							<!-- 영업채널2 입력란 -->
							<c:if test="${info.code3Yn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 영업채널2</b></label>
								    <div class="col-md-10">
								        <input type="text" name="code3" title="영업채널2" class="form-control" maxlength="20" />
										<span class="red"> * 세부 채널명을 입력해주세요. 예시) 강남점 / 제1국 등</span>
								    </div>
								</div>
							</c:if>
							
							<!-- 판매사코드/사번 입력란 -->
							<c:if test="${info.code2Yn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 코드</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentCode1" title="코드" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 주문번호 입력란 -->
							<c:if test="${info.orderNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 주문번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="orderNum" title="주문번호" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 판매사원 사번 입력란 -->
							<c:if test="${info.agentEmpNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 판매사원 사번</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentEmpNum" title="판매사원 사번" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
									
							<!-- NUMBER 입력란 -->
							<c:if test="${info.agentNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* NUMBER</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentNum" title="NUMBER" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
									
							<!-- 코드(영문) 입력란 -->
							<c:if test="${info.agentCodeEnYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* CODE</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentCode2" title="CODE" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
									
							<!-- 기타 입력란 -->
							<c:if test="${info.agentEtcYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>기타</b></label>
								    <div class="col-md-10">
								        <textarea name="agentEtc" title="기타" class="form-control notRequired" style="height:60px;" maxlength="2000"></textarea>
								    </div>
								</div>
							</c:if>
									
							<!-- 고유번호 입력란 -->
							<c:if test="${info.agentUnqNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 고유번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="agentUnqNum" title="고유번호" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
									
							<!-- 판매자 번호 입력란 -->
							<c:if test="${info.sllrNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 판매자 번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="sllrNum" title="판매자 번호" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
									
							<!-- 판매자 소속 입력란 -->
							<c:if test="${info.sllrPartYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 판매자 소속</b></label>
								    <div class="col-md-10">
								        <input type="text" name="sllrPart" title="판매자 소속" class="form-control" maxlength="50" />
								    </div>
								</div>
							</c:if>
									
							<!-- 판매자 연락처 입력란 -->
							<c:if test="${info.sllrCtelYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 판매자 연락처</b></label>
								    <div class="col-md-10">
								        <input type="text" name="sllrCtel" title="판매자 연락처" class="form-control phoneChk" maxlength="13" />
								    </div>
								</div>
							</c:if>
			            </div>
			        </div>
			    </div>
		    </div>
	    </c:if>
	    
	    <c:if test="${info.customerInfoYn eq 'Y'}">
			<div class="col-12">
				<div class="card-box">
			        <ul class="nav nav-tabs">
			            <li class="nav-item">
			                <a class="nav-link active">
			                    <span class="d-none d-sm-block"><b>고객 정보 입력</b>&nbsp;&nbsp;<span class="red">※ 기존 접수 고객 중복 접수 시,가입 처리가 더욱 지연됩니다.</span></span>           
			                </a>
			            </li>
			        </ul>
			
			        <div class="tab-content">
			            <div class="tab-pane fade show active">
			            	<div class="form-group row d-flex flex-wrap-wrap">
							<label class="col-md-2 col-form-label" for=""><b>* 가입 방법 선택</b></label>
								<div class="col-md-10">
								<div class="custom-control custom-radio d-inline-block">
									<input type="radio" name="joinMethod" value="fixedLine" data-con="fixedLine"id="joinMethodTM" title="joinMethod"  class="custom-control-input"> 
									<label for="joinMethodTM" class="custom-control-label">유선계약(TM녹취)</label>&nbsp;&nbsp;
								</div>
								<div class="custom-control custom-radio d-inline-block"> 
									<input type="radio" name="joinMethod" value="electronicContract" data-con="electronicContract" id="joinMethodEle" checked title="joinMethod" class="custom-control-input">
									<label for="joinMethodEle" class="custom-control-label">전자계약</label>&nbsp;&nbsp; 
								</div>
								<span class="red">※ 미성년자 가입 불가</span><br>
								</div>																		
							</div>
			            	<!-- 상품1 선택란 -->
							<c:if test="${info.prdctNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 상품 선택1</b></label>
								    <div class="col-md-10">
								        <select id="prdctCdEle" name="prdctCd" title="상품" class="form-control">
											<option value="">[상품선택]</option>
											<c:forEach var="list" items="${prdctList.product}">
												<c:if test="${list.cd eq 'LGU9' || list.cd eq 'LGU10' || list.cd eq 'LGU11' || list.cd eq 'LGU12' || list.cd eq 'LGU13'}">
													<option value="${list.cd}">${list.cdNm}</option>
												</c:if>
											</c:forEach>
										</select>
								    </div>
								</div>
							</c:if>
							
							<!-- 할인받을 연락처 입력란 -->
							<c:if test="${info.discountCtnYn eq 'Y'}">
								<div id="discount_ctn_ele" style="display: none;" >
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>할인 받을 연락처(CTN)</b></label>
									    <div class="col-md-10">
									        <input type="text" name="discountCtn" title="할인 받을 연락처" class="form-control phoneChk notRequired" maxlength="13"/>
									        <span class="red">※ 실제 혜택이 적용될 U+ CTN 정확히 기재</span><br>
									        <span class="red">※ 미 기재 시, U-Cube 상담 등록 시, 가입번호로 혜택 적용</span>
									    </div>
									</div>
								</div>
								
								<div id="discount_ctn_10_ele" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>* 혜택 받을 IPTV 가입번호</b></label>
									    <div class="col-md-10">
									        <input type="text" name="discountCtn_10" onclick="ipTVClick();" title="혜택 받을 IPTV 홈상품 번호" class="form-control notRequired"/>
									        <span class="red">※ 인터넷 가입번호 입력 불가</span><br>
											<span class="red">※ 핸드폰 번호 입력 불가</span>
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 가입 희망 구좌 -->
							<c:if test="${info.mainContTypeYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 주 계약1</b></label>
								    <div class="col-md-10">
								    	<div class="custom-control custom-radio d-inline-block">
									        <input type="radio" name="mainContType" value="여행" id="mainContType2Ele" title="주 계약" checked class="custom-control-input"> 
									        <label for="mainContType2Ele" class="custom-control-label">여행</label>&nbsp;&nbsp;
								        </div>
								        <div class="custom-control custom-radio d-inline-block"> 
									        <input type="radio" name="mainContType" value="크루즈" id="mainContType3Ele" title="주 계약" class="custom-control-input">
											<label for="mainContType3Ele" class="custom-control-label">크루즈</label>&nbsp;&nbsp;
										</div>
										<div class="custom-control custom-radio d-inline-block"> 
											<input type="radio" name="mainContType" value="어학연수" id="mainContType5Ele" title="주 계약" class="custom-control-input"> 
											<label for="mainContType5Ele" class="custom-control-label">어학연수</label>&nbsp;&nbsp;
										</div>
										<div class="custom-control custom-radio d-inline-block"> 
											<input type="radio" name="mainContType" value="골프" id="mainContType4Ele" title="주 계약" class="custom-control-input">
											<label for="mainContType4Ele" class="custom-control-label">골프</label>&nbsp;&nbsp;
										</div>
										<div class="custom-control custom-radio d-inline-block"> 
											<input type="radio" name="mainContType" value="상조" id="mainContType1Ele" title="주 계약" class="custom-control-input">
											<label for="mainContType1Ele" class="custom-control-label">상조</label>&nbsp;&nbsp;
										</div>
								    </div>
								</div>
							</c:if>
							
							<!-- 대명 가입번호 입력란 -->
							<c:if test="${info.idNoYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>대명 가입 번호1</b></label>
								    <div class="col-md-10">
								        <input type="text" name="idNo" value="${dmEntrNo}" title="대명 가입 번호" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 상품2 선택란 -->
							<c:if test="${info.prdctNm2Yn eq 'Y'}">
								<div class="invisible1Ele" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>상품 선택2</b></label>
									    <div class="col-md-10">
									        <select id="prdctCd2Ele" name="prdctCd2" title="상품" class="form-control notRequired">
												<option value="">[상품선택]</option>
												<c:forEach var="list" items="${prdctList.product}">
													<c:if test="${list.cd eq 'LGU9' || list.cd eq 'LGU10' || list.cd eq 'LGU11' || list.cd eq 'LGU12'}">
														<option value="${list.cd}">${list.cdNm}</option>
													</c:if>
												</c:forEach>
											</select>
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 할인받을 연락처 입력란 -->
							<c:if test="${info.discountCtnYn eq 'Y'}">
								<div id="discount_ctn2_ele" style="display: none;" >
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>할인 받을 연락처(CTN)</b></label>
									    <div class="col-md-10">
									        <input type="text" name="discountCtn2" title="할인 받을 연락처" class="form-control phoneChk notRequired" maxlength="13" />
									        <span class="red">※ 실제 혜택이 적용될 U+ CTN 정확히 기재</span><br> 
									        <span class="red">※ 미 기재 시, U-Cube 상담 등록 시, 가입번호로 혜택 적용</span>
									    </div>
									</div>
								</div>
								
								<div id="discount_ctn2_10_ele" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>혜택 받을 IPTV 가입번호</b></label>
									    <div class="col-md-10">
									        <input type="text" name="discountCtn2_10" onclick="ipTVClick();" title="혜택 받을 IPTV 가입번호" class="form-control notRequired"/>
									        <span class="red">※ 인터넷 가입번호 입력 불가</span><br>
											<span class="red">※ 핸드폰 번호 입력 불가</span>
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 가입 희망 구좌 -->
							<c:if test="${info.mainContTypeYn eq 'Y'}">
								<div class="invisible1Ele" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>* 주 계약2</b></label>
									    <div class="col-md-10">
											<div class="custom-control custom-radio d-inline-block">
												<input type="radio" name="mainContType2" value="여행" id="secondContType2Ele" title="주 계약" checked class="custom-control-input"> 
												<label for="secondContType2Ele" class="custom-control-label">여행</label>&nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block"> 
												<input type="radio" name="mainContType2" value="크루즈" id="secondContType3Ele" title="주 계약" class="custom-control-input"> 
												<label for="secondContType3Ele" class="custom-control-label">크루즈</label>&nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block"> 
												<input type="radio" name="mainContType2" value="어학연수" id="secondContType5Ele" title="주 계약" class="custom-control-input"> 
												<label for="secondContType5Ele" class="custom-control-label">어학연수</label>&nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block"> 
												<input type="radio" name="mainContType2" value="골프" id="secondContType4Ele" title="주 계약" class="custom-control-input"> 
												<label for="secondContType4Ele" class="custom-control-label">골프</label> &nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block">
												<input type="radio" name="mainContType2" value="상조" id="secondContType1Ele" title="주 계약" class="custom-control-input"> 
												<label for="secondContType1Ele" class="custom-control-label">상조</label>	&nbsp;&nbsp;
											</div>									
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 대명 가입번호2 입력란 -->
							<c:if test="${info.idNoYn eq 'Y'}">
								<div class="invisible1Ele" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>대명 가입 번호2</b></label>
									    <div class="col-md-10">
									        <input id="idNoInput2Ele" type="text" name="idNo2" value="${dmEntrNo2}" title="대명 가입 번호" class="form-control" readonly="readonly" />
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 상품3 선택란 -->
							<c:if test="${info.prdctNm3Yn eq 'Y'}">
								<div class="invisible2Ele" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>상품 선택3</b></label>
									    <div class="col-md-10">
									        <select id="prdctCd3Ele" name="prdctCd3" title="상품" class="form-control notRequired">
												<option value="">[상품선택]</option>
												<c:forEach var="list" items="${prdctList.product}">
													<c:if test="${list.cd eq 'LGU9' || list.cd eq 'LGU10' || list.cd eq 'LGU11' || list.cd eq 'LGU12'}">
														<option value="${list.cd}">${list.cdNm}</option>
													</c:if>
												</c:forEach>
											</select>
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 할인받을 연락처 입력란 -->
							<c:if test="${info.discountCtnYn eq 'Y'}">
								<div id="discount_ctn3_ele" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>할인 받을 연락처(CTN)</b></label>
									    <div class="col-md-10">
									        <input type="text" name="discountCtn3" title="할인 받을 연락처" class="form-control phoneChk notRequired" maxlength="13"/>
									        <span class="red">※ 실제 혜택이 적용될 U+ CTN 정확히 기재</span><br> 
									        <span class="red">※ 미 기재 시, U-Cube 상담 등록 시, 가입번호로 혜택 적용</span>
									    </div>
									</div>
								</div>
								<div id="discount_ctn3_10_ele" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>혜택 받을 IPTV 가입번호</b></label>
									    <div class="col-md-10">
									        <input type="text" name="discountCtn3_10" onclick="ipTVClick();" title="혜택 받을 IPTV 가입번호" class="form-control notRequired"/>
									        <span class="red">※ 인터넷 가입번호 입력 불가</span><br>
											<span class="red">※ 핸드폰 번호 입력 불가</span>
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- 가입 희망 구좌 -->
							<c:if test="${info.mainContTypeYn eq 'Y'}">
								<div class="invisible2Ele" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>* 주 계약3</b></label>
									    <div class="col-md-10">
											<div class="custom-control custom-radio d-inline-block">
												<input type="radio" name="mainContType3" value="여행" id="thirdContType2Ele" title="주 계약" checked class="custom-control-input"> 
												<label for="thirdContType2Ele" class="custom-control-label">여행</label>&nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block"> 
												<input type="radio" name="mainContType3" value="크루즈" id="thirdContType3Ele" title="주 계약" class="custom-control-input"> 
												<label for="thirdContType3Ele" class="custom-control-label">크루즈</label>&nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block"> 
												<input type="radio" name="mainContType3" value="어학연수" id="thirdContType5Ele" title="주 계약" class="custom-control-input"> 
												<label for="thirdContType5Ele" class="custom-control-label">어학연수</label>&nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block"> 
												<input type="radio" name="mainContType3" value="골프" id="thirdContType4Ele" title="주 계약" class="custom-control-input"> 
												<label for="thirdContType4Ele" class="custom-control-label">골프</label>&nbsp;&nbsp;
											</div>
											<div class="custom-control custom-radio d-inline-block">  
												<input type="radio" name="mainContType3" value="상조" id="thirdContType1Ele" title="주 계약" class="custom-control-input"> 
												<label for="thirdContType1Ele" class="custom-control-label">상조</label>&nbsp;&nbsp;
											</div>
										</div>
									</div>
								</div>
							</c:if>
							
							<!-- 대명 가입번호3 입력란 -->
							<c:if test="${info.idNoYn eq 'Y'}">
								<div class="invisible2Ele" style="display: none;">
									<div class="form-group row d-flex flex-wrap-wrap">
									    <label class="col-md-2 col-form-label" for=""><b>대명 가입 번호3</b></label>
									    <div class="col-md-10">
									        <input id="idNoInput3Ele" type="text" name="idNo3" value="${dmEntrNo3}" title="대명 가입 번호" class="form-control"readonly="readonly" />
									    </div>
									</div>
								</div>
							</c:if>
							
							<!-- U+ 서비스명, 상품번호 -->
							<c:if test="${info.uProdNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>U+ 서비스명</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uProdNm" value="${uProdNm}" title="U+ 서비스명" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							<c:if test="${info.uProdNoYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>U+ 상품번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="uProdNo" value="${uProdNo}" title="U+ 상품번호" class="form-control" readonly="readonly" />
								    </div>
								</div>
							</c:if>
							
							<!-- 결합 상품 선택란 -->
							<c:if test="${info.fusionPrdctYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>결합상품 선택</b></label>
								    <div class="col-md-10">
								        <select name="fusionPrdctCd" title="결합상품" class="form-control" >
											<option value="">[상품선택]</option>
											<c:forEach var="list" items="${prdctList.goods}">
												<option value="${list.cd}">${list.cdNm}</option>
											</c:forEach>
										</select>
								    </div>
								</div>
							</c:if>
							
							<!-- U+ 가입번호 입력란 -->
							<c:if test="${info.homePrdNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>U+ 가입번호</b></label>
								    <div class="col-md-10">
								        <p id="uEntrNo_tmpEle" style="display: none;">${uEntrNo }</p> 
								        <input type="text" name="homePrdNum" value="${uEntrNo }" title="U+홈상품 가입번호" class="form-control notRequired numberChk" maxlength="12" readonly="readonly"/> 
								        <span class="prdComment hidden" style="color: red;"> ※ 홈상품 가입번호가 맞는지 확인 바랍니다. </span>
								    </div>
								</div>
							</c:if>
							
							<!-- 점포명 입력란 -->
							<c:if test="${info.storeNmYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 점포명(GS수퍼)</b></label>
								    <div class="col-md-10">
								        <input type="text" name="storeNm" title="점포명" class="form-control" maxlength="50" />
								    </div>
								</div>
							</c:if>
							
							<!-- 고객명 입력란 -->
							<div class="form-group row d-flex flex-wrap-wrap">
							    <label class="col-md-2 col-form-label" for=""><b>* 고객인증</b></label>
							    <div class="col-md-10">
							        <button type="button" onclick="javascript:mobileAuth();" class="btn btn-purple waves-effect width-md waves-light">휴대폰 인증</button>
								    <span class="red" id="info"></span>
							    </div>
							</div>
						
							<!-- 비상 연락처 입력란 -->
							<!-- <div class="form-group row d-flex flex-wrap-wrap">
							    <label class="col-md-2 col-form-label" for=""><b>비상 연락처</b></label>
							    <div class="col-md-10">
							        <input type="text" name="homeTel" id="homeTelEle" title="비상 연락처" class="form-control phoneChk notRequired" maxlength="13" />
							    </div>
							</div> -->
							
							<!-- 이메일 입력란 -->
							<c:if test="${info.emailYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 이메일</b></label>
								    <div class="col-md-10">
								        <input type="text" name="email" title="이메일" class="form-control emailChk" maxlength="30" />
								    </div>
								</div>
							</c:if>
							
							<!-- 주소 입력란 -->
							<div class="form-group row d-flex flex-wrap-wrap">
							    <label class="col-md-2 col-form-label" for=""><b>* 주소(가입증서 수령)</b></label>
							    <div class="col-md-10">
							        <div class="input-group">
                                         <input type="text" id="zipcd" name="zipcd" class="form-control add1 notRequired" maxlength="7"  /> <!-- maxlength="7" readonly="readonly" />-->
                                         <div class="input-group-append">
                                             <button class="btn btn-dark waves-effect waves-light" type="button" id="zipcodeDaum">우편번호 찾기</button>
                                         </div>
                                     </div>
                                     <input type="text" name="adr" class="form-control mt-1" maxlength="100"  /> <!-- maxlength="100" readonly="readonly" />-->
                                     <input type="text" name="adr_dtl" title="상세주소" class="form-control mt-1" maxlength="100" placeholder="상세주소" />
							    </div>
							</div>
							
							<!-- 상담 가능 시간대 입력란 -->
							<c:if test="${info.calltimeYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 상담 가능 시간대</b></label>
								    <div class="col-md-10">
								        <select name="calltime" class="form-control" title="상담 가능 시간대">
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
								    </div>
								</div>
							</c:if>
							
							<!-- SKB 가입상태 선택란 -->
							<c:if test="${info.skbJoinYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* SKB 가입상태</b></label>
								    <div class="col-md-10">
								        <select name="skbJoin" title="SKB 가입상태" class="form-control">
											<option value="">[SKB 가입상태]</option>
											<option value="가입완료">가입완료</option>
											<option value="가입보류">가입보류</option>
										</select>
								    </div>
								</div>
							</c:if>
							
							<!-- 롯데카드번호 입력란 -->
							<c:if test="${info.lotCardNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 롯데카드번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="lotCardNum" title="롯데카드번호" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 코드(국문) 입력란 -->
							<c:if test="${info.cstmrCodeKrYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 코드</b></label>
								    <div class="col-md-10">
								        <input type="text" name="cstmrCode1" title="코드" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 고객 고유번호 입력란 -->
							<c:if test="${info.cstmrUnqNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 고객 고유번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="cstmrUnqNum" title="고객 고유번호" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 카드번호 입력란 -->
							<c:if test="${info.cardNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>카드번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="cardNum" title="카드번호" class="form-control notRequired" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- NUMBER 입력란 -->
							<c:if test="${info.cstmrNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* NUMBER</b></label>
								    <div class="col-md-10">
								        <input type="text" name="cstmrNum" title="NUMBER" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 코드(영문) 입력란 -->
							<c:if test="${info.cstmrCodeEnYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* CODE</b></label>
								    <div class="col-md-10">
								        <input type="text" name="cstmrCode2" title="CODE" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							<!-- 기타 입력란 -->
							<c:if test="${info.cstmrEtcYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>기타</b></label>
								    <div class="col-md-10">
								        <textarea name="cstmrEtc" title="기타" class="form-control notRequired" style="height: 60px;" maxlength="2000"></textarea>
								    </div>
								</div>
							</c:if>
							
							<!-- 한샘 통합 멤버십 입력란 -->
							<c:if test="${info.hanssMbspNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 한샘 통합 멤버십</b></label>
								    <div class="col-md-10">
								        <input type="text" name="hanssMbspNum" title="한샘 통합 멤버십" class="form-control" maxlength="9" />
								        <span class="red"> * 상담을 위해서 한샘 통합 멤버십 고객 번호가 반드시 필요합니다. (9자리)</span>
								    </div>
								</div>
							</c:if>
							
							<!-- 멤버십 번호 입력란 -->
							<c:if test="${info.mbspNumYn eq 'Y'}">
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 멤버십 번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="mbspNum" title="멤버십 번호" class="form-control" maxlength="20" />
								    </div>
								</div>
							</c:if>
							
							
							<!-- 납입방법 입력란 -->
							<div class="form-group row d-flex flex-wrap-wrap">
							    <label class="col-md-2 col-form-label" for=""><b>* 납입방법</b></label>
							    <div class="col-md-10">
							        <select name="pay" id="pay" class="form-control" title="납입방법" >
											<option value="">[납입방법선택]</option>
											<option value="card">신용카드</option>
											<option value="cms">계좌이체</option>
									</select>
							    </div>
							</div>
							
							<div class="cardPay" style="display: none;">
								<!-- 카드사 입력란 -->
								<!-- <div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>카드사</b></label>
								    <div class="col-md-10">
								        <input type="text" name="cardCom" id="cardCom" title="카드사" class="form-control" readonly="readonly">
								    </div>
								</div> -->
								
								<!-- 카드번호 입력란 -->
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 카드번호</b></label>
								    <div class="col-md-10">
								        <input type="text" name="cardNum" title="카드번호" id="cardNum" value="${cardNum }" class="form-control notRequired" maxlength="20" />
								    </div>
								</div>
								
								<!-- 카드 유효 기간 입력란 -->
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 카드 유효 기간</b></label>
								    <div class="col-md-10">
	                                    <div class="input-group" style="width:200px;">
									        <input type="text" name="cardMon" title="카드번호유효기간 월" placeholder="00월" id="cardMon" value="${cardMon }" class="form-control notRequired" maxlength="2" style="width: 30%" />
											<input type="text" name="cardYear" title="카드번호유효기간 년" placeholder="00년" id="cardYear"  value="${cardYear }" class="form-control notRequired" maxlength="2" style="width: 30%" />
											<input type="text" name="cardCom" title="카드사" id="infoCardCom" value="" class="form-control red" style="width: 40%;border-top: none; border-right: none; border-bottom: none;" readonly="readonly" />
											
										</div>
										<input type="hidden" name="expireDt" id="expireDt" value="${expireDt }">
									    <span class="red">
									    	<br>
									    	 ※ 현대카드 등록 불가
									    </span>
								    </div>
								</div>
								
								<!-- 카드 인증 -->
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 카드 인증</b></label>
								    <div class="col-md-10">
	                                    <button type="button" onclick="javascript:cardAuth();" class="btn btn-purple waves-effect width-md waves-light">카드 인증</button>
								    </div>
								</div>
							</div>
							
							<div class="accountPay" style="display: none;">
								<!-- 은행명 입력란 -->
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 은행명</b></label>
								    <div class="col-md-10">
								        <select name="rdpMstBnkCd" class="form-control">
											<option value="">은행선택</option>
											<option value="한국산업은행" data-cmn_com_etc1="02">한국산업은행</option>
											<option value="기업은행" data-cmn_com_etc1="03">기업은행</option>
											<option value="국민은행" data-cmn_com_etc1="04">국민은행</option>
											<option value="하나은행(구 외환)" data-cmn_com_etc1="05">하나은행(구 외환)</option>
											<option value="국민은행(구 주택)" data-cmn_com_etc1="06">국민은행(구 주택)</option>
											<option value="수협중앙회" data-cmn_com_etc1="07">수협중앙회</option>
											<option value="농협중앙회" data-cmn_com_etc1="11">농협중앙회</option>
											<option value="단위농협" data-cmn_com_etc1="12">단위농협</option>
											<option value="축협중앙회" data-cmn_com_etc1="16">축협중앙회</option>
											<option value="우리은행" data-cmn_com_etc1="20">우리은행</option>
											<option value="구)조흥은행" data-cmn_com_etc1="21">구)조흥은행</option>
											<option value="상업은행" data-cmn_com_etc1="22">상업은행</option>
											<option value="SC제일은행" data-cmn_com_etc1="23">SC제일은행</option>
											<option value="한일은행" data-cmn_com_etc1="24">한일은행</option>
											<option value="서울은행" data-cmn_com_etc1="25">서울은행</option>
											<option value="구)신한은행" data-cmn_com_etc1="26">구)신한은행</option>
											<option value="한국씨티은행(구 한미)" data-cmn_com_etc1="27">한국씨티은행(구 한미)</option>
											<option value="대구은행" data-cmn_com_etc1="31">대구은행</option>
											<option value="부산은행" data-cmn_com_etc1="32">부산은행</option>
											<option value="광주은행" data-cmn_com_etc1="34">광주은행</option>
											<option value="제주은행" data-cmn_com_etc1="35">제주은행</option>
											<option value="전북은행" data-cmn_com_etc1="37">전북은행</option>
											<option value="강원은행" data-cmn_com_etc1="38">강원은행</option>
											<option value="경남은행" data-cmn_com_etc1="39">경남은행</option>
											<option value="비씨카드" data-cmn_com_etc1="41">비씨카드</option>
											<option value="새마을금고" data-cmn_com_etc1="45">새마을금고</option>
											<option value="신용협동조합중앙회" data-cmn_com_etc1="48">신용협동조합중앙회</option>
											<option value="상호저축은행" data-cmn_com_etc1="50">상호저축은행</option>
											<option value="한국씨티은행" data-cmn_com_etc1="53">한국씨티은행</option>
											<option value="홍콩상하이은행" data-cmn_com_etc1="54">홍콩상하이은행</option>
											<option value="도이치은행" data-cmn_com_etc1="55">도이치은행</option>
											<option value="ABN 암로" data-cmn_com_etc1="56">ABN 암로</option>
											<option value="JP모건" data-cmn_com_etc1="57">JP모건</option>
											<option value="미쓰비시도쿄은행" data-cmn_com_etc1="59">미쓰비시도쿄은행</option>
											<option value="BOA(Bank of America)" data-cmn_com_etc1="60">BOA(Bank of America)</option>
											<option value="산림조합" data-cmn_com_etc1="64">산림조합</option>
											<option value="신안상호저축은행" data-cmn_com_etc1="70">신안상호저축은행</option>
											<option value="우체국" data-cmn_com_etc1="71">우체국</option>
											<option value="하나은행" data-cmn_com_etc1="81">하나은행</option>
											<option value="평화은행" data-cmn_com_etc1="83">평화은행</option>
											<option value="신세계" data-cmn_com_etc1="87">신세계</option>
											<option value="신한(통합)은행" data-cmn_com_etc1="88">신한(통합)은행</option>
											<option value="케이뱅크" data-cmn_com_etc1="89">케이뱅크</option>
											<option value="카카오뱅크" data-cmn_com_etc1="90">카카오뱅크</option>
											<option value="유안타증권(구 동양증권)" data-cmn_com_etc1="D1">유안타증권(구 동양증권)</option>
											<option value="현대증권" data-cmn_com_etc1="D2">현대증권</option>
											<option value="미래에셋증권" data-cmn_com_etc1="D3">미래에셋증권</option>
											<option value="한국투자증권" data-cmn_com_etc1="D4">한국투자증권</option>
											<option value="우리투자증권" data-cmn_com_etc1="D5">우리투자증권</option>
											<option value="하이투자증권" data-cmn_com_etc1="D6">하이투자증권</option>
											<option value="HMC 투자증권" data-cmn_com_etc1="D7">HMC 투자증권</option>
											<option value="SK 증권" data-cmn_com_etc1="D8">SK 증권</option>
											<option value="대신증권" data-cmn_com_etc1="D9">대신증권</option>
											<option value="하나대투증권" data-cmn_com_etc1="DA">하나대투증권</option>
											<option value="굿모닝신한증권" data-cmn_com_etc1="DB">굿모닝신한증권</option>
											<option value="동부증권" data-cmn_com_etc1="DC">동부증권</option>
											<option value="유진투자증권" data-cmn_com_etc1="DD">유진투자증권</option>
											<option value="메리츠증권" data-cmn_com_etc1="DE">메리츠증권</option>
											<option value="신영증권" data-cmn_com_etc1="DF">신영증권</option>
											<option value="대우증권" data-cmn_com_etc1="DG">대우증권</option>
											<option value="삼성증권" data-cmn_com_etc1="DH">삼성증권</option>
											<option value="교보증권" data-cmn_com_etc1="DI">교보증권</option>
											<option value="키움증권" data-cmn_com_etc1="DJ">키움증권</option>
											<option value="이트레이드" data-cmn_com_etc1="DK">이트레이드</option>
											<option value="솔로몬증권" data-cmn_com_etc1="DL">솔로몬증권</option>
											<option value="한화증권" data-cmn_com_etc1="DM">한화증권</option>
											<option value="NH증권" data-cmn_com_etc1="DN">NH증권</option>
											<option value="부국증권" data-cmn_com_etc1="DO">부국증권</option>
											<option value="LIG증권" data-cmn_com_etc1="DP">LIG증권</option>
										</select>
								    </div>
								</div>
								
								<!-- 계좌번호 입력란 -->
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 계좌번호</b></label>
								    <div class="col-md-10">
								        <input type="number" name="accountNum" id="accountNum" title="계좌번호"  value="${accountNum }" class="form-control notRequired" maxlength="30" value=""/>
								    </div>
								</div>
								
								<!-- 계좌 인증 -->
								<div class="form-group row d-flex flex-wrap-wrap">
								    <label class="col-md-2 col-form-label" for=""><b>* 계좌 인증</b></label>
								    <div class="col-md-10">
	                                    <button type="button" onclick="javascript:accountAuth();" class="btn btn-purple waves-effect width-md waves-light">계좌 인증</button>
								    </div>
								</div>
								<input type="hidden" name="RDP_MST_BNK_ACT_CHECK">								
							</div>
							
							<!-- 결제희망일 선택란 -->
							<div class="form-group row d-flex flex-wrap-wrap">
							    <label class="col-md-2 col-form-label" for=""><b>* 결제희망일</b></label>
							    <div class="col-md-10">
							    	<div class="custom-control custom-radio d-inline-block">
								        <input type="radio" name="payDay" value="5" id="payDay5" title="payDay" checked class="custom-control-input"> 
										<label for="payDay5" class="custom-control-label">5일</label>&nbsp;&nbsp;
							        </div>
							        <div class="custom-control custom-radio d-inline-block"> 
								        <input type="radio" name="payDay" value="10" id="payDay10" title="payDay" class="custom-control-input">
										<label for="payDay10" class="custom-control-label">10일</label>&nbsp;&nbsp; 
									</div>
									<div class="custom-control custom-radio d-inline-block"> 
										<input type="radio" name="payDay" value="15" id="payDay15" title="payDay" class="custom-control-input"> 
										<label for="payDay15" class="custom-control-label">15일</label>&nbsp;&nbsp; 
									</div>
							    </div>
							</div>
							
							<div class="form-group row d-flex flex-wrap-wrap">
								<label class="col-md-2 col-form-label" for=""><b>* 통화 요청 시간</b></label>
								<div class="custom-control custom-radio d-inline-block">
									<input type="radio" name="callTypeEle" value="quickTell" id="quickTellEle" title="빠른 통화" checked class="custom-control-input"> 
									<label for="quickTellEle" class="custom-control-label">빠른 통화</label>&nbsp;&nbsp;
								</div>
								<div class="custom-control custom-radio d-inline-block">
									<input type="radio" name="callTypeEle" value="chooseTell" id="chooseTellEle" title="희망 통화 시간" class="custom-control-input"> 
									<label for="chooseTellEle" class="custom-control-label">희망 통화 시간</label>&nbsp;&nbsp;
								</div>
								<div class="col-md-2" >
									<input class="form-control" name="callDateEle" type="text" id="callDateEle" >
								</div>
								<div class="custom-control custom-radio d-inline-block" >
									<select name="callTime" class="form-control" title="상담 가능 시간대" id="callTimeEle">
											<option value="">선택해 주세요</option>
											<option value="시간 상관 없음">시간 상관 없음</option>
											<option value="10:00 ~ 10:30">10:00 ~ 10:30</option>
											<option value="10:30 ~ 11:00">10:30 ~ 11:00</option>
											<option value="11:00 ~ 11:30">11:00 ~ 11:30</option>
											<option value="11:30 ~ 12:00">11:30 ~ 12:00</option>
											<option value="12:00 ~ 12:30">12:00 ~ 12:30</option>
											<option value="12:30 ~ 13:00">12:30 ~ 13:00</option>
											<option value="13:00 ~ 13:30">13:00 ~ 13:30</option>
											<option value="13:30 ~ 14:00">13:30 ~ 14:00</option>
											<option value="14:00 ~ 14:30">14:00 ~ 14:30</option>
											<option value="14:30 ~ 15:00">14:30 ~ 15:00</option>
											<option value="15:00 ~ 15:30">15:00 ~ 15:30</option>
											<option value="15:30 ~ 16:00">15:30 ~ 16:00</option>
											<option value="16:00 ~ 16:30">16:00 ~ 16:30</option>
											<option value="16:30 ~ 17:00">16:30 ~ 17:00</option>
											<option value="17:00 ~ 17:30">17:00 ~ 17:30</option>
											<option value="17:30 ~ 18:00">17:30 ~ 18:00</option>
											<option value="18:00 ~ 18:30">18:00 ~ 18:30</option>
											<option value="18:30 ~ 19:00">18:30 ~ 19:00</option>
											<option value="19:00 ~ 19:30">19:00 ~ 19:30</option>
											<option value="19:30 ~ 20:00">19:30 ~ 20:00</option>
									</select>
								</div>
							</div>
							<div class="form-group row d-flex flex-wrap-wrap">
								<label class="col-md-2 col-form-label" for=""></label>
								<span class="red"> &nbsp;※ 가입센터 운영 시간 : 월~금요일 (10시~20시) / 토요일 (10시~19시)</span><br>
							</div>
			            </div>
			        </div>
			    </div>
			</div>
			<%-- <!-- 고객정보 안내사항 표시란 -->
			<c:if test="${info.cinfoYn eq 'Y'}">
				<div class="col-12">
					<div class="card-box">
						<div id="cinfo" style="white-space: pre-line">${info.cinfo}</div>
					</div>
				</div>
			</c:if> --%>
		</c:if>
		<!-- 개인 정보 활용 동의 표시란 -->
		<div class="col-12">
			<div class="card-box">
				<c:if test="${info.termsYn eq 'Y'}">
					<div class="termDiv mt40">
						<p class="tit">개인 정보 활용 동의</p>
						<button type="button" class="check checkBtn">
							<strong>동의합니다.</strong> <img src="/common/images/btn/check_bt.gif" alt="체크">
						</button>
						<input type="checkbox" name="agree2" class="agree" style="display: none" />
						<div class="termBox">
							[대명 U라이프클럽 상품 가입을 위한 개인정보 수집, 이용 및 위탁동의서]<br><br>

							㈜대명스테이션은 대명 U라이프클럽 상품 가입을 위하여 회원님의 개인정보를 아래와 같이 수집, 이용 및 위탁하고자 합니다.<br><br>
							
							1. 개인정보의 수집 및 이용 동의 (필수사항)<br>
							  ▷ 수집, 이용하는 자 : ㈜대명스테이션<br>
							  ▷ 수집, 이용하려는 개인정보 항목 : 성명, 주민등록번호 앞 7자리(생년월일 | 성별), 연락처(이동전화 |유선전화), CI(암호화된 동일인 식별정보), 주소(자택 | 직장), 결제정보 중 CMS정보(은행명 및 계좌번호) 또는 신용카드번호 중 택1<br>
							 ▷ 개인정보 수집, 이용 및 위탁 목적 : 대명 U라이프클럽 상품 소개, 계약상담, 계약체결, <br>
							 ▷ 개인정보 보유 기간 : 개인정보 수집 및 이용 동의일로부터 30일 또는 수집/이용 목적 달성 시까지<br>
							* 고객님은 위의 개인정보 수집,이용에 대한 동의를 거부할 수 있습니다. 그러나 동의를 거부할 경우 상품 가입 등 서비스 제공에 제한을 받을 수 있습니다.<br><br>
							 
							2. 개인정보 취급업무 위탁내역 <br>
							 ▷ 취급을 위탁받는 자(수탁업체) : ㈜윌앤비전<br>
							 ▷ 업무내용 : 대명 U라이프클럽 상품 소개, 계약상담 및 계약체결<br>
							* 고객님은 위의 개인정보 취급업무 위탁에 대한 동의를 거부하실 수 있습니다. 그러나 동의를 거부할 경우 상품 상담 및 계약체결 등 서비스 제공에 제한을 받을 수 있습니다.<br>
						</div>
					</div>
				</c:if>
	
				<div class="mt30 taC">
					<a href="javascript:" class="btnRed" id="submitEletronic">신청</a> 
				</div>
			</div>
		</div>
	</div>
</form>

<c:set var="protDlrCd" value="316615,316614,316613,316578,316564,316562,316561,316560,316537,316535,316530,316485,316483,316481,316409,316408,316348,316339,316329,316248,316240,316239,316232,316231,316115,316113,316027,316026,316024,315973,315929,315927,315926,315925,315924,315793,315606,315455,315436,315425,315381,315340,315333,315326,315233,315229,314828,314753,314661,314638,314543,314433,314429,314423,314287,314186,314089,313863,313820,313705,313703,313702,313701,313700,313618,313580,313574,313567,313364,313353,313327,313228,313220,312981,312913,312787,312776,312700,312664,312663,312622,312536,312534,312473,312465,312464,312410,312406,312404,312394,312354,312279,312275,312273,312180,312014,311861,311836,311789,311727,311726,311687,311609,311601,311418,311394,311309,311289,311224,311202,311114,311049,311034,310996,310986,310968,310833,310658,310639,310633,310276,310266,310257,310083,309848,309793,309775,309765,309759,309464,308499,308498,308080,308065,308063,308053,307986,307978,307965,307861,307848,307544,307473,307442,306899,306896,306889,306884,306865,306810,306804,306803,306787,301799,301767,301545,301367,301054,300497,316633,316601,316587,316581,316580,316565,316536,316532,316526,316506,316504,316445,316432,316279,316144,316143,316116,316114,316038,315966,315962,315928,315575,315565,315413,315374,315367,315327,315325,315267,315236,315211,315174,315006,314855,314849,314830,314829,314790,314609,314311,314179,314150,314148,314097,314094,314042,314041,313999,313949,313942,313918,313807,313578,313510,313352,313331,313326,313323,313315,313305,313173,313096,313030,313023,312992,312973,312814,312804,312753,312749,312734,312636,312546,312470,312413,312396,312352,312350,312286,312215,312042,312038,312017,311908,311845,311751,311722,311612,311563,311233,311135,311051,310967,310926,310864,310736,310664,310559,310555,310471,310335,310326,310121,310104,310047,310045,309979,309955,309860,309853,309633,309631,309616,309615,309606,309602,309598,309294,308496,308485,308437,308433,308394,308281,308099,307958,307854,307830,307813,307695,307674,307558,307549,307548,307498,307482,307054,307044,306903,300729,300288,300273,300175,316597,316596,316558,316512,316442,316426,316352,316336,316319,316282,316075,315936,315835,315795,315518,315482,315416,315388,315353,315352,315321,315251,315137,315132,315056,315055,314960,314940,314705,314701,314699,314612,314565,314510,314453,314358,314351,314323,314308,314226,314115,313995,313923,313916,313872,313819,313760,313697,313307,312830,312420,311840,311573,311536,311442,311425,311417,311398,310917,310453,310224,309862,309455,309035,308497,307992,307951,307821,306891,306858,306758,305107,301891,300481,316607,316604,316600,316591,316527,316425,316254,316084,316058,316053,316025,315988,315901,315696,315636,315498,315451,315243,315234,315154,315028,314962,314942,314884,314748,314726,314680,314617,314597,314459,314435,314428,314420,314355,314298,313915,313901,313834,313795,313792,313786,313738,313673,313502,313304,313060,312972,312936,312838,312834,312788,312009,311830,311592,311326,311185,311173,311015,310940,310871,310532,309431,309175,308831,305892,316634,316622,316611,316541,316508,316441,316440,316438,316436,316414,316379,316344,316343,316322,316284,316167,316117,316112,316073,316071,316068,315971,315930,315883,315881,315768,315574,315563,315501,315478,315377,315328,315266,315264,315257,315215,315153,315019,315010,314955,314912,314911,314909,314878,314827,314752,314626,314535,314534,314432,314430,314345,314087,314080,313994,313947,313940,313873,313866,313805,313712,313709,313617,313365,313358,313225,313142,313139,313133,312979,312974,312860,312790,312778,312766,312745,312739,312738,312707,312618,312573,312528,312524,312466,312103,312091,312041,312015,311676,311554,311284,311274,311264,311263,311178,311025,310891,310890,310863,310682,310160,310141,309992,309985,309818,309679,309675,309674,309671,309669,309404,308469,308468,308467,308458,308457,308453,308390,308389,308379,308369,308366,308356,305156,304973,304951,304949,304935,304932,304900,304791,304781,304767,304714,304711,304698,304691,304668,304666,304622,304585,304529,302710,302015,316616,316543,316542,316539,316533,316503,316437,316345,316341,316334,316328,316233,316166,316121,316109,316069,316018,315923,315882,315830,315826,315427,315368,315335,315280,315272,315271,315265,315259,315230,315224,315170,314848,314825,314788,314749,314709,314660,314658,314654,314610,314608,314566,314484,314483,314480,314398,314333,314251,314239,314183,314081,314048,314044,314000,313937,313919,313869,313858,313716,313699,313696,313695,313688,313644,313362,313351,313188,313177,313176,313134,313108,313093,313033,312993,312987,312951,312820,312817,312815,312786,312744,312665,312462,312325,312322,312263,311982,311976,311958,311915,311841,311827,311825,311821,311558,311467,311378,311184,311127,311099,310933,310832,310830,310731,310575,310408,310252,310246,310139,310067,309965,309931,309930,309887,309840,309837,309695,309538,309531,309496,309243,309223,309216,309206,309168,309149,309099,309097,309078,309073,309062,308987,308981,308971,308970,308916,304976,304917,304550,302963,302908,302864,302659,302559,302186,302103,316649,316651,316653,316643,316719,316748,"></c:set>

<%--<c:set var="uDlrCd2" value="416614"></c:set>--%>
<%--<c:if test="${fn:contains(memInfo.pfrnPtc, list.cd)}">checked</c:if>--%>
<c:if test="${!empty(uDlrCd2) && fn:containsIgnoreCase(protDlrCd, uDlrCd2)}">
<!-- 2019.09.17 팝업 내용 추가및 css 수정(width, height 값 조절)  -->
<div class="log-popup">
	<div class="log-popup-in">
		<h2 style="text-align: center">8월 게릴라 프로모션 안내<span class="ico"></span></h2>
		<div class="log-popup-box ">
			<div class="txt-info bold">신규 폴더블폰(Z폴드4·플립4)<br>
				& 대명 U라이프클럽
			</div>
			<div class="txt-info">
				<strong> 연계 판매 프로모션이 진행 중입니다.</strong><br>
				(기간 : 22년 08월 31일까지)
			</div>
			<div class="txt-info left">
				※ 자세한 내용은 제휴상품팀 정책 자료를 확인해주세요.
			</div>
			<div class="txt-info no-show" onclick="close_layer_modal2_cookie()">
				<div class="close-box" ></div><div>오늘 하루 그만 보기</div>
			</div>
		</div>

	</div>
	<div class="log-popup-bg"></div>
</div>

<script>
	function close_layer_modal2_cookie() {
		if(confirm('오늘 하루 그만 보시겠습니까?')){
			var tomorrow = new Date();
			tomorrow.setDate(tomorrow.getDate() + 1);
			tomorrow.setHours(0, 0, 0, 0);
			document.cookie = "prod_bnr_no_show" + "=" + escape( "done" ) + "; path=/; domain=.daemyungimready.com ; expires=" + tomorrow.toGMTString() + ";"
			$(".log-popup").fadeOut(250);
			$("html,body").css("overflow-y", "auto");
		}
	}
	function layer_modal2_getCookie(cName)
	{
		cName = cName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cName);
		var cValue = '';
		if(start != -1) {
			start += cName.length;
			var end = cookieData.indexOf(';', start);
			if(end == -1)end = cookieData.length;
			cValue = cookieData.substring(start, end);
		}
		return unescape(cValue);
	}
	function popup_promotion() {
		if(layer_modal2_getCookie("prod_bnr_no_show") != "done") {
			if (new Date() < new Date('2022-09-01')) {
				$(".log-popup").fadeIn(350);
				$("html,body").css("overflow-y", "hidden");

				$(".log-popup-in h2 span").click(function () {
					$(".log-popup").fadeOut(250);
					$("html,body").css("overflow-y", "auto");
				});
				$(".log-popup-bg").click(function (e) {
					$(".log-popup").fadeOut(250);
					$("html,body").css("overflow-y", "auto");
				});
			}
		}
	}
	window.onload = function(){
		popup_promotion();
	}
</script>
<!-- EOD : 2020.02.28 팝업  -->
</c:if>