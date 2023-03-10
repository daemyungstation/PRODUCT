
$(document).ready(function(){
	window.addEventListener("message", (e) => {
		if(e.data != undefined && e.data.messageType != undefined && e.data.messageType === "address"){
			// 처리
			console.log(e.data);
			CommonCtrl.JusoCallBack.apply(null, e.data.data);
		}
	});

	// 공통으로 사용될 함수모음
	var CommonCtrl = new feel.controller("CommonController");
	CommonCtrl.checkbox = {
		useYN : "Y",
		on : "/common/images/btn/check_bt_on.gif",
		off : "/common/images/btn/check_bt.gif",		
		Action : function($obj, allcheck){			
			if(allcheck !== undefined){
				if(allcheck){
					$obj.next().attr('checked', true)
					.end().find('img').attr('src', this.on);
					
					/* 마케팅 동의서 */
					if($obj.attr('id') == 'marketingAgree'){
						setCookie("marketingYn", "Y", 1);
					}					
				}else{
					$obj.next().removeAttr('checked')
					.end().find('img').attr('src', this.off);
					
					/* 마케팅 동의서 */
					if($obj.attr('id') == 'marketingAgree'){
						setCookie("marketingYn", "N", -1);
					}					
				}
			}else{
				if($obj.next().is(':checked') == false){							
					$obj.next().attr('checked', true)
						.end().find('img').attr('src', this.on);
				}else{
					$obj.next().removeAttr('checked')
						.end().find('img').attr('src', this.off);
					
					$('#allAgree').next().removeAttr('checked')
						.end().find('img').attr('src', this.off);
				}				
			}
		}
	};
	CommonCtrl.AuthPop = function(formObj, arrAgreeCheck){	// 모바일, 아이핀 인증 팝업
		if(this.checkbox.useYN == "Y"){
			var trueCheck = arrAgreeCheck.toString().match(/true/g);
			if(trueCheck == null || arrAgreeCheck.length > trueCheck.length){
				alert("이용약관 및 개인정보 수집 및 이용에 대해 동의하여주세요.");
				return;
			}
		}
		
		window.open('', 'auth_popup', 'width=520, height=640');

		formObj.target = "auth_popup";
		formObj.submit();				
	};
	CommonCtrl.Postcode = function(zipcd, adr){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	        	$('input[name='+zipcd+']').val(data.zonecode);
	        	$('input[name='+adr+']').val(data.roadAddress);
	        }
	    }).open();		
	};
	CommonCtrl.PostcodeGov = function(){
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/address/jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
	};
	/** API 서비스 제공항목 확대 (2017.02) **/
	CommonCtrl.JusoCallBack = function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
		, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		$('input[name=zipcd]').val(zipNo);
		$('input[name=adr]').val(roadFullAddr );
		$('input[name=adr_dtl]').val(addrDetail);
	};

	CommonCtrl.model = {
		id : { 
			allAgree : {
				event : {
					click : function(){
						CommonCtrl.checkbox.Action($(this));
						$('.checkBtn').each(function(index, obj){
							CommonCtrl.checkbox.Action($(obj), $('#allAgree').next().is(':checked'));	
						});				
					}
				}
			},			
			mobileAuth : {	// 핸드폰 본인인증
				event : {
					click : function(e){
						e.preventDefault();	
						CommonCtrl.AuthPop(	document.form1, 	$.map( $('.agree'), function(x){							
																				return $(x).is(':checked');
																			})
						);
					}
				}
			},
			ipinAuth : {	// 아이핀 본인인증
				event : {
					click : function(e){
						e.preventDefault();
						CommonCtrl.AuthPop(	document.form2,	$.map( $('.agree'), function(x){
																				return $(x).is(':checked');
																			})
						);
					}
				}
			},
			zipcode : {
				event : {
					click : function(e){
						e.preventDefault();						
						CommonCtrl.PostcodeGov();
					}
				}
			},
			zipcodeDaum : {
				event : {
					click : function(e){
						e.preventDefault();
						CommonCtrl.Postcode('zipcd', 'adr');
					}
				}
			},
			marketingAgree : {
				event : {
					click : function(e){
						if($(this).next().attr('checked') == undefined){
							setCookie("marketingYn", "Y", 1);
						}else{
							setCookie("marketingYn", "N", -1);
						}
					}
				}
			}			
		},
		classname : {
			zipcode : {
				event : {
					click : function(e){
						e.preventDefault();
						var zipcdName = $(this).data('zipcd')
						   , adressName = $(this).data('adr');
						
						CommonCtrl.Postcode(zipcdName, adressName);					 
					}
				}
			}
		},
		immediately : function(){	// 즉시실행함수			
			$('.checkBtn').live('click', function(){	// 체크박스 클릭
				CommonCtrl.checkbox.Action($(this));
			});
		}		
	};
	
	CommonCtrl.exec();
	
	// 뒤로가기 막기 컨트롤러
	var BackBlockCtrl = new feel.controller("BackBlockController");
	BackBlockCtrl.model = {
		immediately : function(){
			window.history.forward();
		}
	};
	BackBlockCtrl.exec();		
	
	// 페이지 벗어날시 경고창 컨트롤러
	var OnbeforeUnloadCtrl = new feel.controller("OnbeforeUnloadController");
	OnbeforeUnloadCtrl.model = {
		immediately : function(){
			window.onbeforeunload = function(e, a, b){
				return "이 페이지를 벗어나면 입력했던 내용이 사라질 수 있습니다.";
			};
		}
	};
	OnbeforeUnloadCtrl.exec();	
	
	// 회원 정보 작성 컨트롤러
	var JoinCtrl = new feel.controller("JoinController");
	JoinCtrl.getGb = function(){
		return this.obj.data('gb');
	};
	JoinCtrl.Maillist = function($this){
		var tmpmymail = ""
		  , tmpmailtype = ""
		  , secretEmail = $('input[name=email]');

		if ($this.val() != "" && secretEmail.val() != "")
		{
			tmpmymail = secretEmail.val().split('@')[0];
			tmpmailtype = secretEmail.val().split('@')[1];

			secretEmail.val(tmpmymail + '@' + $this.val());	
		}
		else if ($this.val() == "")
		{
			secretEmail.val('');
		}	
	};	
	JoinCtrl.ajaxCall = function(gubun, url, data){
		var msg = "", valCheck = false, valMsg = "";
		if(gubun == 'id'){
			msg = "이미 사용중인 아이디입니다.";
			valCheck = Feel.Validation.method.RegExrCheck($('#'+gubun), Feel.RegExr.Id);
			valMsg = Feel.Msg.Id;
		}
		if(gubun == 'email'){
			msg = "이미 사용중인 이메일입니다.";
			valCheck = Feel.Validation.method.RegExrCheck($('#'+gubun), Feel.RegExr.Email);
			valMsg = Feel.Msg.Email;
		}
		
		if(valCheck){
			$.ajax({
				type : 'POST',
				url : url,
				data : data,
				success : function(r){
					console.log(r);
					if(r.check.useYn == "Y" || r.check.qscnYn == 'Y' || r.check.drotYn == 'Y'){
						alert(msg);
						$('#'+gubun).data('state', false).focus();
					}else{
						alert("사용할 수 있는 아이디입니다.");
						$('#'+gubun).data('state', true).data(gubun, data);					
					}
				}			
			});			
		}else{
			alert(valMsg);
			$('#'+gubun).focus();
		}
	};
	JoinCtrl.model = {
		id : {
			maillist : {
				event : {
					change : function(){
						JoinCtrl.Maillist($(this));
					}
				}
			},
			id : {
				event : {
					focusout : function(){
						if($(this).data('id') != undefined){
							if($(this).data('id').id != $(this).val()){
								$(this).data('state', false);
							}	
						}
					},
					keyup : function(){
						$(this).val($(this).val().toLowerCase());
					}
				}
			},
			email : {
				event : {
					focusout : function(){
						if($(this).data('email') != undefined){
							if($(this).data('email').email != $(this).val()){
								$(this).data('state', false);
							}	
						}						
					}
				}
			},
			idOverapCheck : {
				event : {
					click : function(e){
						e.preventDefault();
						
						var id = $('input[name=id]').val(); 
						var data = {
							check : 'id',
							id : id
						};
						
						if($('input[name=id]').val() != ""){
							JoinCtrl.ajaxCall('id', '/member/join/overapCheck.ajax', data);	
						}else{
							alert("아이디를 입력해주세요.");
							$('input[name=id]').focus();
						}
					}
				}
			}, 
			emailOverapCheck :{
				event : {
					click : function(e){
						e.preventDefault();
						
						var email =	$('input[name=email]').val(); 
						var data = {
							check : 'email',
							email : email 
						};
						
						if($('input[name=email]').val() != ""){
							JoinCtrl.ajaxCall('email', '/member/join/overapCheck.ajax', data);	
						}else{
							alert("이메일을 입력해주세요.");
							$('input[name=email]').focus();
						}			
					}
				}				
			},			
			renaming : {
				event : {
					click : function(e){
						setPopup("./renaming.do", "renaming", 700, 550);
					}
				}
			},
			reg : {
				event : {
					click : function(e){
						e.preventDefault();						
						$('input[type=submit]').trigger('click');
					}
				}
			},
			cancel : {
				event : {
					click : function(e){
						e.preventDefault();
						if(confirm('입력하신 모든 정보가 사라지고 약관동의 화면으로 이동합니다.\n취소하시겠습니까?')){
							location.href = $(this).attr('href');
						}
					}
				}
			}
		},
		immediately : function(){
			$('form[name=frm]').validation({
				msg : {
					empty : {
						names : {
							sms_rcv_yn : "SMS 수신동의를 선택해주세요.",
							tel_rcv_yn : "전화 수신동의를 선택해주세요.",
							ctlg_rcv_yn : "카탈로그 수신동의를 선택해주세요.",
							email_rcv_yn : "이메일 수신동의를 선택해주세요."
						}
					}
				},
				customfunc : function(obj, tagid, okval, msg){					
					if(tagid == "id"){
						if(!obj.data('state')){
							alert("아이디 중복체크를 해주세요.");
							return false;
						}
					}
					if(tagid == "email"){
						if(!obj.data('state')){
							alert("이메일 중복체크를 해주세요.");
							return false;
						}
					}
					
					if(tagid == "zipcd"){
						if($(obj).val() == ""){
							alert("주소를 입력해주세요.");
							$(obj).focus();
							return false;
						}
					}
				},
				loadingbar : {
					use : true
				}
			});
			
			if(JoinCtrl.getGb() == "join")
			{
				Feel.Validation.confirm = "상품 가입이 되어있는 경우, 입력해주신 정보로 동일하게 업데이트 됩니다. (3영업일 소요)\n\n가입하시겠습니까?"; 
			}
			else
			{
				$('#id').data('state', true).data('id', $('#id').val());	
				$('#email').data('state', true).data('email', $('#email').val());
				
				Feel.Validation.confirm = "상품 가입이 되어있는 경우, 입력해주신 정보로 동일하게 업데이트 됩니다. (3영업일 소요)\n\n수정하시겠습니까?";
			}
			
			$("input[name='intr_ptc']").on("click", function(){
				var chkCnt = $("input[name='intr_ptc']:checked").length;
				
				if(chkCnt > 3)
				{
					alert("3가지 이상 선택 할 수 없습니다.");
					$(this).prop("checked", false);
				}
			});
			
			$("input[name='join_path']").on("click", function(){
				var joinPath = $(this).next().text();
				
				if(joinPath == "기타")
				{
					$("input[name='join_path_etc']").prop("readonly", false);
					$("input[name='join_path_etc']").focus();
				}
				else
				{
					$("input[name='join_path_etc']").val("");
					$("input[name='join_path_etc']").prop("readonly", true);
				}			
			});
			
			$("input[name='pfrn_ptc']").on("click", function(){
				var chkCnt = $("input[name='pfrn_ptc']:checked").length;
				
				if(chkCnt > 2)
				{
					alert("2가지 이상 선택 할 수 없습니다.");
					$(this).prop("checked", false);
				}
				else
				{
					var pfrnGb = $(this).next().text();
					
					if(pfrnGb == "기타")
					{
						var isChkd = $(this).is(":checked");
						
						if(isChkd)
						{
							$("input[name='pfrn_etc']").prop("readonly", false);
							$("input[name='pfrn_etc']").focus();
						}
						else
						{
							$("input[name='pfrn_etc']").val("");
							$("input[name='pfrn_etc']").prop("readonly", true);
						}
					}
				}
			});
		}
	};
	JoinCtrl.exec();
	
	// 회원 로그인 컨트롤러
	var LoginCtrl = new feel.controller("LoginController");
	LoginCtrl.model = {
		id : {
			submit : {
				event : {
					click : function(e){
                        e.preventDefault();
						$('input[type=submit]').trigger('click');
					}
				}
			}
		},
		immediately : function(){
			$('form[name=frm]').validation({
				loadingbar : {
					use : false
				}
			});
		}
	};
	LoginCtrl.exec();

	
	// 회원 아이디, 비번찾기 컨트롤러
	var FindCtrl = new feel.controller("FindController");
	FindCtrl.model = {
		id : {
			submit : {
				event : {
					click : function(e){
						e.preventDefault();						
						$('input[type=submit]').trigger('click');
					}
				}
			}			
		},
		immediately : function(){
			CommonCtrl.checkbox.useYN = "N";
			
			$('form[name=frm]').validation();
		}
	};
	FindCtrl.exec();
	
	// 온라인 상품 약관 동의 컨트롤러
	var OnlineProductAgreeCtrl = new feel.controller("OnlinePrdctAgreeController");
	OnlineProductAgreeCtrl.model = {
		id : {			
			confirm : {
				event : {
					click : function(e){
						e.preventDefault();
						
						var pass = true;
						$('.agree').each(function(index, obj){
							if(!$(this).is(':checked')){
								pass = false;
							}
						});						
						
						if(pass){
							location.href = $(this).attr('href');
						}else{
							alert("이용약관과 개인정보 수집 및 이용에 대한 안내에 동의해 주세요.");
						}
					}
				}
			}
		},
		immediately : function(){
			$('.getTerm').each(function(i, obj){
				var seq = $(this).attr('data-seq');
				
				$.ajax({
					type : 'POST',
					url : '/onlineproduct/getTermInfo.do',
					data : {
						trsMstSeq : seq
					},
					success : function(e){
						$(obj).html(e);
					}
				});				
			});
			
			//체크박스 뒤로가기 후 복귀시 버튼 이미지 변경
			$(".checkBtn").each(function(){
				CommonCtrl.checkbox.Action($(this), $(this).siblings("input[type='checkbox']").is(":checked"));
			});
			
			if($("#allAgree").siblings("input[type='checkbox']").is(":checked"))
			{
				CommonCtrl.checkbox.Action($("#allAgree"), true);
			}

		}
	};
	OnlineProductAgreeCtrl.exec(); 
		
	// 임직원 및 b2b회원 코드인증화면 컨트롤러
	var B2bCheckCtrl = new feel.controller("B2bCheckController");
	B2bCheckCtrl.model = {
		id : {
			check : {
				event : {
					click : function(e){
						e.preventDefault();
						
						var code = $('#code').val();
						
						if(code == ""){
							alert("접속코드를 입력하세요");
							$('#code').focus();
						}else{
							$.ajax({
								type : 'POST',
								url : './checkCode.ajax',
								data : {
									cd : code
								},
								success : function(r){
									if(r.b2bYN == "Y"){
										location.href = "./gate.do";
									}else{
										alert("일치하는 코드가 존재하지 않습니다.");
									}
								},
								error : function(){
									
								}
							});
						}
					}
				}
			}
		}
	};
	
	B2bCheckCtrl.exec();
	
	
	// 온라인 상품 작성화면 컨트롤러(일반, b2b 공통)
	var OnlineProductJoinCtrl = new feel.controller("OnlinePrdctController");
	OnlineProductJoinCtrl.step = {
		$step2 : $('#step2'),
		$step3 : $('#step3').hide(),
		$step3 : $('#step3'),
		$imgNavi : $('#imgNavi'),
		changeStep : function(){
			this.$step2.hide();
			this.$step3.show();
			this.$imgNavi.attr('src', '/common/images/txt/b2b_txt3.gif');
			
			$(window).scrollTop(0);
		}
	};
	OnlineProductJoinCtrl.pmtGb = {
		cms : $('#cms').val(),
		card : $('#ccard').val()
	};
	OnlineProductJoinCtrl.Desc = {
		bankDesc : $('.bankDesc').hide(),
		cardDesc : $('.cardDesc').hide(),
		exec : function(type){
			if(type == "bank"){
				this.bankDesc.show();
				this.cardDesc.hide();
			}else{
				this.bankDesc.hide();
				this.cardDesc.show();				
			}
		}
	};
	OnlineProductJoinCtrl.getTerms = {
		templete : $('#termDivTemp').removeAttr('id'),
		func : function(productCd){
			if(productCd == undefined){
			}else{
				
				$.ajax({
					type : 'POST',
					url : '/onlineproduct/getTerms.ajax',
					data : {
						prodCd : productCd
					},
					success : function(data){
						Feel.Msg.Empty.names = {};
						
						var list = data.info.termsList;
						if(list.length > 0){
							$.each(list, function(index, obj){
								if(obj != null){
									var clone = OnlineProductJoinCtrl.getTerms.templete.clone()
									.show().addClass('clone');
																		
									clone.find('input[type=checkbox]').attr('name', 'clone'+index).removeClass('notRequired');
									clone.find('.tit').text(obj.cdNm + ' 약관');
									clone.find('.termBox').html("<iframe name='' src='/onlineproduct/getTermInfo.do?trsMstSeq="+obj.trsMstSeq+"' frameborder='0' style='width:950px; height:200px;'></iframe>");
									
									OnlineProductJoinCtrl.step.$step3.append(clone);
									
									// 새로 생성된 약관의 알럿 메시지를 생성한다.
									var termsMsg = '{ "clone' + index + '" : "' + obj.cdNm + ' 약관을 확인해주세요." }';
									Feel.Msg.Empty.names = $.extend(true, {}, Feel.Msg.Empty.names, $.parseJSON(termsMsg));										
								}
							});
						}else{
							$('.clone').remove();
						}
					}
				});
			}
		}
	};
	OnlineProductJoinCtrl.getSubProduct = function($this, productCd){	
		$.ajax({
			type : 'POST',
			url : '/onlineproduct/getSubProduct.ajax',
			data : {
				prodCd : productCd
			},
			success : function(data){
				var prdctDtlCdObj = $this.next();
				
				prdctDtlCdObj.find('option').not(':first').remove();
				$.each(data.list, function(index, item){
					prdctDtlCdObj.append("<option value='" + item.modelClCd + "'>"+item.modelClNm+"</option>");
				});
				
				$this.next().off('change').change(function(){
					$(this).next().val($(this).find('option:selected').text());
				});
			}
		});
	};
	OnlineProductJoinCtrl.model = {
		id : {
			maillist : {
				event : {
					change : function(){
						JoinCtrl.Maillist($(this));
					}
				}
			},
			emailOverapCheck :{
				event : {
					click : function(e){
						e.preventDefault();
						
						var email =	$('input[name=email]').val(); 
						var data = {
							check : 'email',
							email : email 
						};
						
						if($('input[name=email]').val() != ""){
							JoinCtrl.ajaxCall('email', '/member/join/overapCheck.ajax', data);	 
						}else{
							alert("이메일을 입력해주세요.");
							$('input[name=email]').focus();
						}			
					}
				}				
			},		
			addProduct : {
				event : {
					click : function(e){
						e.preventDefault();
						var productForm, clone, index;
						if($('.productForm').size() < 3){
							index = $('.productForm').size();
							productForm = $('.productForm').eq(0);
							clone = productForm.clone(true);
							
							clone.attr('id', 'productForm' + index)
								.attr('data-index', index)
								.find('input[type=radio]').attr('checked',false).end()
								.find('input[type=text]').val('').end()
								.find('input[type=hidden]').val('').end()
								.find('select[name=prdctDtlCd]').find('option').not(':first').remove().end().end().end()
								.find('.paymentMethod').html('<span>상품을 선택해주세요.</span>').end()
								.find('.searchEmp').attr('data-target', index).end()
								.find('input[name=radio0]').attr('name', 'radio' + index);
							
							$('#productDiv').append(clone);							
						}else{
							alert("최대 3개까지 가능합니다.");
						}
					}
				}
			},
			removeProduct : {
				event : {
					click : function(e){
						e.preventDefault();
						if($('.productForm').size() > 1){
							$('.productForm').last().remove();	
						}
					}
				}
			},			
			submit : {
				event : {
					click : function(e){
						e.preventDefault();
						
						var tempMtd = $('input[name=pay_mtd]').val();
						
						//납입방식 리로드
						if(tempMtd.length <= 0)
						{
							$("select[name='prdctGrpCd']").trigger("change");
							alert("납입방식을 선택해주세요.");
							$("input[name='radioCd0']").focus();
							return true;
						}
						
						$('input[type=submit]').trigger('click');
					}
				}
			},
			cancel : {
				event : {
					click : function(e){
						e.preventDefault();
						if(confirm("작성을 취소하시겠습니까?")){
							location.href = $(this).attr('href');
						}
					}
				}
			}
		},
		immediately : function(){
			
			$('form[name=frm]').validation({
				msg : {
					empty : {
						names : {
							pmt_gb : "결제를 선택해주세요.",
							pmt_day_gb : "납부일자를 선택해주세요.",
							agree2 : "CMS출금이체 약관 및 개인정보 제공 동의서에 동의해주세요.",
							agree3 : "카드출금이체 약관 및 개인정보 제공 동의서에 동의해주세요."
						}
					},
					confirm : "신청이 완료되면 수정이 불가합니다. 진행하시겠습니까?"
				},
				customfunc : function(obj, tagid, okval, msg){					
					/*if(tagid == "email"){
						if(!obj.data('state')){
							alert("이메일 중복체크를 해주세요.");
							return false;
						}
					}*/
					
					if(tagid == "zipcd"){
						if($(obj).val() == ""){
							alert("주소(우편물 수령)를 입력해주세요.");
							$(obj).focus();
							return false;
						}
					}
					if(tagid == "zipcd2"){
						if($(obj).val() == ""){
							alert("주소(전자제품 설치)를 입력해주세요.");
							$(obj).focus();
							return false;
						}
					}
					
					if(tagid == "next"){
						OnlineProductJoinCtrl.step.changeStep();
						obj.remove();
						return false;
					}
				},
				loadingbar : {
					use : true
				}
			});

			$('select[name=prdctGrpCd]').live('change', function(){
				var productForm = $(this).closest('.productForm');
				
				var productCd = $(this).find(':selected').data('productcd')
					, productNm = $(this).find(':selected').data('productnm');
				
				// 납입방식 조회
				if(productCd != undefined){
					
					productForm.find('input[name=prdct_nm]').val(productNm);		// 상품명 설정
					
					OnlineProductJoinCtrl.getTerms.func(productCd);					// 상품 선택시 최신 약관 노출
					OnlineProductJoinCtrl.getSubProduct($(this), productCd);			// 세부상품 조회
					
					$.ajax({
						type : 'POST',
						url : '/onlineproduct/paymentMethod.ajax',
						data : {
							prodCd : productCd
						},
						success : function(data){
							var list = data.list
								, prodCd = ""
								, monPayAmt = ""
								, exprNo = 1
								, prodAmt = 0
								, text = ""
								, value="";
							
							productForm.find('.paymentMethod').html('');
							for(var i = 0 ; i < list.length ; i++){
								prodCd = list[i].prodCd;				//상품코드
								monPayAmt = list[i].monPayAmt;	//월납 금액
								exprNo = list[i].exprNo;				//회차
								prodAmt = list[i].prodAmt;			//일시납 금액
								
								if(exprNo == 1){
									value = "일시납";							
									text = number_format(prodAmt) + "원(일시납)";
								}else{
									value = "월납";							
									text = "월 " + number_format(monPayAmt) + "원 X " + exprNo + "회" ;
								}
							
								productForm.find('.paymentMethod').append('<input type="radio" name="radioCd' + productForm.attr('data-index') + '" value="'+prodCd+'" data-paymtd='+value+' class="prdct_cd " title="납입방식" /> ' + text + '&nbsp;&nbsp;');
							}
						}
					});					
				}else{
					productForm.find('.paymentMethod').html('<span>상품을 선택해주세요.</span>');
				}
				
				if($(this).val() == ""){
					$(this).parent().find('.productInfo').attr('href', '');
				}else{
					if($(this).val() == "normal01"){
						$(this).parent().find('.productInfo').attr('href', '/lifeway-service/normal-product/contentsid/181/index.do');
					}else if($(this).val() == "normal02"){
						$(this).parent().find('.productInfo').attr('href', '/lifeway-service/normal-product/contentsid/182/index.do');
					}else if($(this).val() == "normal03"){
						$(this).parent().find('.productInfo').attr('href', '/lifeway-service/normal-product/contentsid/183/index.do');
					}	
				}
				
			});
			
			if($("select[name='prdctGrpCd']").val())
			{
				$("select[name='prdctGrpCd']").trigger("change");
			}
			
			$('.productInfo').live('click', function(e){
				e.preventDefault();
				if($(this).attr('href') == ''){
					alert("상품을 선택해주세요.");
				}else{
					window.open($(this).attr('href'), '', 'width=520, height=640');	
				}
			});
			
			$('.prdct_cd').live('click', function(){
				var paymtd = $(this).data('paymtd');
				$(this).closest('.productForm').find('input[name=pay_mtd]').val(paymtd)
											.end().find('input[name=prdct_cd]').val($(this).val());
			});
				
			$('input[name=asgn_nm]').hide();
			$('.searchEmp').hide();
			
			$('.asgn_yn').live('click', function(){
				if($(this).val() == 'N'){
					$(this).closest('.productForm').find('input[name=asgn_yn]').val($(this).val()).end()
														.find('input[name=asgn_cd]').val('').end()
														.find('input[name=asgn_nm]').val('').addClass('notRequired').hide().end()
														.find('.searchEmp').hide();
				}else{
					$(this).closest('.productForm').find('input[name=asgn_yn]').val($(this).val()).end()
														.find('input[name=asgn_nm]').removeClass('notRequired').show().end()
														.find('.searchEmp').show().trigger('click');
				}
			});
			
			if($("input[name='radio0']").is(":checked"))
			{
				$("input[name='radio0']:checked").trigger("click");
			}
			
			$('.searchEmp').click(function(e){
				e.preventDefault();
				var index = $(this).closest('.productForm').attr('data-index');
				window.open('/onlineproduct/employeeList.do?target='+index, '담당자검색', 'width=520, height=640');						
			});
			$('.searchCompany').click(function(e){
				e.preventDefault();
				var index = $(this).closest('.productForm').attr('data-index');
				window.open('/onlineproduct/companyList.do?target='+index, '회사검색', 'width=520, height=640');						
			});
			
			
			var bankSelectObj = $('#bank').remove()
				, cardSelectObj = $('#card').remove();
		
			$('input[name=pmt_gb]').click(function(){
				$('input[name=pmt_co_grp_gb]').val('');
				$('select[name=pmt_co_gb]').val('');
				
				if($(this).val() == OnlineProductJoinCtrl.pmtGb.cms){
					$('#pmtCo').text('은행명');
					$('#payNo').text('계좌번호');
					$('input[name=pmt_no]').attr('title','계좌번호');
					
					$('#pmtCoGb').html(bankSelectObj);
					
					$('#cardExp').hide().find('input').addClass('notRequired').end()
											.find('select').addClass('notRequired');
					
					OnlineProductJoinCtrl.Desc.exec('bank');
					
					$('.termTab').eq(0).show().find('input[type=checkbox]').removeClass('notRequired')
					.end().end().eq(1).hide().find('input[type=checkbox]').addClass('notRequired');		// 약관 변경
			
					if($('.termTab').eq(0).find('input[type=checkbox]').attr('checked')){
						CommonCtrl.checkbox.Action($('.termTab').eq(0).find('.checkBtn'));	
					}
				}else if($(this).val() == OnlineProductJoinCtrl.pmtGb.card){
					$('#pmtCo').text('카드사');
					$('#payNo').text('카드번호');
					$('input[name=pmt_no]').attr('title','카드번호');
					
					$('#pmtCoGb').html(cardSelectObj);					
					
					$('#cardExp').show().find('input').removeClass('notRequired').end()
											.find('select').removeClass('notRequired');
					
					OnlineProductJoinCtrl.Desc.exec('card');
					
					$('.termTab').eq(1).show().find('input[type=checkbox]').removeClass('notRequired')
					.end().end().eq(0).hide().find('input[type=checkbox]').addClass('notRequired');		// 약관 변경
			
					if($('.termTab').eq(1).find('input[type=checkbox]').attr('checked')){
						CommonCtrl.checkbox.Action($('.termTab').eq(1).find('.checkBtn'));	
					}
				}
			});	
			
			if($("input[name='pmt_gb']").is(":checked"))
			{
				$("input[name='pmt_gb']:checked").trigger("click");
			}
			else
			{
				$("input[name='pmt_gb']").eq(0).trigger('click');
			}
			
			$('select[name=pmt_co_gb]').live('change', function(){
				var grpCd = $(this).find('option:selected').data('grpcd');
				$('input[name=pmt_co_grp_gb]').val(grpCd);
			});
		}
	};
	OnlineProductJoinCtrl.exec();
	

	// 개명팝업 컨트롤러
	var RenameCtrl = new feel.controller("RenameController");
	RenameCtrl.model = {		
		immediately : function(){
			CommonCtrl.checkbox.useYN = "N";
		}
	};
	RenameCtrl.exec();	
	
	
	// 전환서비스 신청 컨트롤러
	var chngRqstAgrCtrl = new feel.controller("chngRqstAgrController");
	chngRqstAgrCtrl.model = {
		id : { 
			submitLink : {
				event : {
					click : function(e){
						e.preventDefault();
						jQuery("input[type='submit']").trigger("click");
					}
				}
			}
		},
		immediately : function(){
			// 즉시실행함수
			jQuery(".csConDiv").show();
			
			jQuery(".csConDiv .subSelDiv .selUnit").hide();
			jQuery(".csConDiv .subSelDiv .selUnit").eq(0).show();
			
			jQuery(".csConDiv .subSelDiv .subSel").each(function(k){
				jQuery(this).css("left", 90 * k);
			});
			
			jQuery(".csConDiv .subSelDiv .subSel").on("click", function(){
				jQuery(this).parent(".subSelDiv").find(".subSel").not(this).removeClass("on");
				
				jQuery(this).addClass("on");
				
				jQuery(this).parent(".subSelDiv").find(".selUnit").hide();
				
				jQuery(this).next().show();
			});
			
			jQuery("#frm").validation({
				msg : {
					empty : {
						names : {
							agree1 : "안내사항을 확인하여 주세요.",
							agree2 : "개인정보 수집 및 이용 동의를 하셔야 신청이 가능합니다.",
							agree3 : "개인정보의 제 3자 제공 동의를 하셔야 신청이 가능합니다."
						}
					}
				},
				loadingbar : {
					use : true
				}
			});
			
			//체크박스 뒤로가기 후 복귀시 버튼 이미지 변경
			$(".checkBtn").each(function(){
				CommonCtrl.checkbox.Action($(this), $(this).siblings("input[type='checkbox']").is(":checked"));
			});
			
			if($("#allAgree").siblings("input[type='checkbox']").is(":checked"))
			{
				CommonCtrl.checkbox.Action($("#allAgree"), true);
			}
		}
	};
	chngRqstAgrCtrl.exec();
	
	// 외주업체 상담신청 컨트롤러
	var OutsourcingCtrl = new feel.controller("OutsourcingController");
	OutsourcingCtrl.init = {
		M5_ : $('#M5_').find('input').addClass('notRequired').end().hide(),
		M6 : $('#M6').find('input').addClass('notRequired').end().hide()
	};
	OutsourcingCtrl.model = {
		id : { 
			prodctCd : {
				event : {
					change : function(){
						$('input[name=prdctNm]').val($(this).find('option:selected').attr('data-prdctNm'));
						
						$('input[name=code1]').val('');
						$('input[name=homeno]').val('');
						$('input[name=mobileno]').val('');
						
						if($(this).val() == "M5_"){
							OutsourcingCtrl.init.M5_.show().find('input').removeClass('notRequired');
							OutsourcingCtrl.init.M6.hide().find('input').addClass('notRequired');
						}else if($(this).val() == "M6"){
							OutsourcingCtrl.init.M5_.hide().find('input').addClass('notRequired');
							OutsourcingCtrl.init.M6.show().find('input').removeClass('notRequired');;
						}else{
							OutsourcingCtrl.init.M5_.hide().find('input').addClass('notRequired');
							OutsourcingCtrl.init.M6.hide().find('input').addClass('notRequired');
						}
					}
				}
			},
			submit : {
				event : {
					click : function(e){
						e.preventDefault();
						$('input[type=submit]').trigger('click');
					}
				}
			}	
		},
		immediately : function(){
			$('form[name=frm]').validation({
				msg : {
					empty : {
						names : {
							agree : "개인 정보 활용 동의에 체크해주세요.",
							thrd_sppl_agree : "개인 정보의 제3자 제공 동의에 체크해주세요",
							tlife_agree1 : "개인정보 수집, 이용 및 위탁에 동의 하셔야 신청이 완료됩니다.",
							tlife_agree2 : "개인정보 취급업무 위탁내역에 동의 하셔야 신청이 완료됩니다."
						}
					}
				},
				customfunc : function(obj, tagid, okval, msg){					
					if(tagid == "zipcd"){
						if($(obj).val() == ""){
							alert("주소를 입력해주세요.");
							$(obj).focus();
							return false;
						}
					}
					
					if(tagid == "prodctCd"){
						if($(obj).val() == "M5_"){
							$('input[name=code1]').val($('input[name=homeno]').val());
						}else if($(obj).val() == "M6"){
							$('input[name=code1]').val($('input[name=mobileno]').val());
						}else{
							$('input[name=code1]').val('');
						}
					}
				}
			});
			
			//체크박스 뒤로가기 후 복귀시 버튼 이미지 변경
			$(".checkBtn").each(function(){
				CommonCtrl.checkbox.Action($(this), $(this).siblings("input[type='checkbox']").is(":checked"));
			});
		}
	};
	OutsourcingCtrl.exec();
	
	// 나의 라이프웨이 - 가입내역 컨트롤러
	var MLAJoinPrdctCtrl = new feel.controller("MLAJoinPrdctController");
	MLAJoinPrdctCtrl.checkTermGrp = function($obj, gb){
		var prdctCd = $obj.attr('data-prdctCd');
		var joinDt = $obj.attr('data-joinDt');
		var accntNo = $obj.attr('data-accntNo');
		var msg = "";
		
		if(gb == "TRS_GB"){
			msg = "설정된 약관이 없습니다.";
		}else if(gb == "CONTRACT_GB"){
			msg = "설정된 계약안내가 없습니다.";
		}
		
		if(gb == "TRS_GB" || gb == "CONTRACT_GB"){
			$.ajax({
				type : "post",
				url : "./checkTermGrp.ajax",
				data : {
					prdctCd : prdctCd,
					cdId : gb 
				},
				success : function(e){
					if(e.check.result == false){
						alert(msg);
					}else{
						window.open('./printTerm.do?prdctCd=' + prdctCd + '&cdId='+gb+'&joinDt='+joinDt, '출력', 'width=1200, height=800, scrollbars=yes');
					}
				}
			});	
		}else{
			//alert("준비중입니다.")
			window.open('./printCert.do?accntNo='+accntNo+'&prdctCd=' + prdctCd+'&joinDt='+joinDt, '출력', 'width=1250, height=900, scrollbars=yes');			
		}
	};
	MLAJoinPrdctCtrl.model = {
		className : {
			printCert : {
				event : {
					click : function(e){
						e.preventDefault();
						MLAJoinPrdctCtrl.checkTermGrp($(this), 'JOIN_CERT');
					}
				}
			},
			printContract : {
				event : {
					click : function(e){
						e.preventDefault();
						MLAJoinPrdctCtrl.checkTermGrp($(this), 'CONTRACT_GB');
					}
				}
			},
			printTerm : {
				event : {
					click : function(e){
						e.preventDefault();
						
						MLAJoinPrdctCtrl.checkTermGrp($(this), 'TRS_GB');					
					}
				}
			}
		}
	};
	MLAJoinPrdctCtrl.exec();
	
	// 나의 라이프웨이 - 납입현황 컨트롤러
	var MLAPmtPtcCtrl = new feel.controller("MLAPmtPtcController");
	MLAPmtPtcCtrl.model = {
		className : {
			printPayment : {
				event : {
					click : function(e){
						e.preventDefault();
						var accntNo = $(this).attr('data-accntNo');				

						window.open('./printPayment.do?accntNo='+accntNo, '출력', 'width=1250, height=900, scrollbars=yes');
					}
				}
			},
		}
	};
	MLAPmtPtcCtrl.exec();
});
