

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta name="format-detection" content="telephone=no">
<title>대명KB차차차 선할인 서비스</title>
<link rel="stylesheet" type="text/css" href="http://dmkb.g72.biz/common/css/mobile_default.css?20191213"/>
<script type="text/javascript" src="http://dmkb.g72.biz/common/script/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="http://dmkb.g72.biz/common/script/jquery_common.js?v=2017092601"></script>

<!-- Scroll Top Btn -->
<script type="text/javascript" src="http://dmkb.g72.biz/common/script/jquery.scroll2Top.js"></script>
<script type="text/javascript" src="http://dmkb.g72.biz/common/script/scroll-top.js"></script>
<!--//Scroll Top Btn -->
</head>

<!-- Selectbox Style -->
<script type="text/javascript">
	jQuery(document).ready(function(){
		var select = $(".selectBox");
		select.change(function(){
			var select_name = $(this).children("option:selected").text();

			if(select_name.length>19){
				$(this).siblings("label").text(select_name.substr(0,19)+"..");
			}else{
				$(this).siblings("label").text(select_name);
			}
		});
	});
</script>
<!--//Selectbox Style -->

<div id="FullLayer" class="full-layerView" style="display:none;">
	<div class="full-layer-body">
		<div class="full-layer-header">
			<em>&nbsp;</em>
			<span onclick="closeFullTopFrameLayer();"></span>
		</div>
		<div class="full-layer-container" id="LayerFullBody" style="background-color:#ffff;padding:0;padding-bottom:40px;height:100%; overflow-y:scroll">
		</div>
	</div>
	<p class="full-layer-bg"></p>
</div>
<script type="text/javascript">
<!--
	//console.log("");
	//var isComplete = false;
	var isComplete = false;
	function btnSend(){
		/*
		if (isComplete) {
			if (confirm("페이지를 닫으시겠습니까?")) {
				//window.close();
				window.open("","_self","");
				window.close();
				//location.replace("/customer/empty.html");
			}
		} else {
		*/
			if (!confirm("신청하시겠습니까?")) {
				return;
			}

			isComplete = true;

			var frm_dm = document.frm_dm;
			//frm_dm.target = "daemyung";
			frm_dm.target = "_self";
			//frm_dm.action = "https://www.daemyungimready.com/KBCAR/write.do";
			frm_dm.action = "http://localhost:18080/KBCAR/agree.do";
			frm_dm.submit();
		/*
			$(".fixedBtn button").html("페이지 닫기");
		}
		*/



		/*
		setTimeout(function(){
			location.replace("about:blank");
		},500);
		*/

		//location.replace("about:blank");
		//history.back();
	}

	var win = {
		viewLayer : function(){
			topFullFrameLayer('/inc/layer_description3.asp',0,"도움말");
		},
	}

//-->
</script>
<body>
	<div class="wrap">
		<!-- Top -->
		<header>
	<p>"중고차 선할인 서비스"신청</p>
	<a onclick="win.viewLayer();"><img src="/img/icon/question.png"></a>
</header>
<ul class="submenu-tab tab03" id="ulTabMenu" style="margin-top:35px;">
	<li class=""><span>동의 및 인증</span></li>
	<li class=""><span>결제</span></li>
	<li class=""><span>승인 완료</span></li>
</ul>

<script type="text/javascript">

	$(document).ready(function(){
		setTabMenu();
	});

	function setTabMenu(){
		var path = location.pathname.toLowerCase();
		path = path.split("/")[path.split("/").length-1];

		if (path=="auth.asp"){
			$("#ulTabMenu > li").eq(0).addClass("on");
		}else if (path=="orderform.asp"){
			$("#ulTabMenu > li").eq(1).addClass("on");
		}else if (path=="ordercomplete.asp"){
			$("#ulTabMenu > li").eq(2).addClass("on");
		}
	}
</script>
		<!--//Top -->
		<div class="container100">

			<span class="complete-text">선할인 승인 완료 내역</span>

			<div class="table-write">
				<table>
					<colgroup>
						<col style="width:40%;" />
						<col style="width:60%;" />
					</colgroup>
					<tr>
						<th>계약자명</th>
						<td>윤장호</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>1983년 02월 18일</td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td>010-8928-8218</td>
					</tr>
					<tr>
						<th>차량번호</th>
						<td>54더1559</td>
					</tr>
					<tr>
						<th>제조사</th>
						<td>기아</td>
					</tr>
					<tr>
						<th>모델명</th>
						<td>올 뉴 K3</td>
					</tr>
					<tr>
						<th>대명오토라이프플랜<br>계약 신청 건 수</th>
						<td>2구좌(상조/여행)</td>
					</tr>
					<tr>
						<th>선할인 승인 금액</th>
						<td>2,000,000원</td>
					</tr>
					<tr>
						<th>신용카드사</th>
						<td>현대</td>
					</tr>
					<tr>
						<th>카드번호</th>
						<td>****-****-****-0109</td>
					</tr>
					<tr>
						<th>거래구분</th>
						<td>24개월 유이자 할부</td>
					</tr>
					<tr>
						<th>승인번호</th>
						<td>00239116</td>
					</tr>
					<tr>
						<th>승인일시</th>
						<td>2019/12/06</td>
					</tr>
				</table>
			</div>

			<ol class="payment-notice">
				<li>※선할인 승인 금액이 24개월 유이자 할부(연이자율 6.18%)로 정상 승인 완료 되었습니다.</li>
				<li>※승인내역을 확인하신 후 "대명오토라이프플랜" 신청을 진행하여 주세요. 승인내역은 고객님 휴대폰으로 전송됩니다.</li>
			</ol>

			<span class="complete-text">아래의 계약 신청하기 를 클릭하시면, (주)대명스테이션의 "대명오토라이프플랜" 상품 신청하기 화면으로 연결됩니다.</span>

			<div class="fixedBtn">
				<!--<a href="javascript:self.close();" class="btn-style01 btn-color01">페이지 닫기</a>-->
				<button type="button" class="btn-style01 btn-color01" onclick="btnSend()">"대명오토라이프플랜" 상품 계약 신청하기</button>
			</div>

			<form id="frm_dm" name="frm_dm" method="post">
				<input type="hidden" name="OrderNo" value="1912029211">
				<input type="hidden" name="OrderName" value="윤장호">
				<input type="hidden" name="OrderPhone" value="01089288218">
				<input type="hidden" name="OrderBirth" value="19830218">
				<input type="hidden" name="OrderQty" value="2">
				<input type="hidden" name="OrderType1" value="상조">
				<input type="hidden" name="OrderType2" value="여행">
				<input type="hidden" name="PayCard" value="HD">
				<input type="hidden" name="PayCardNo" value="0109">
				<input type="hidden" name="PayCardMMYY" value="0423">
				<input type="hidden" name="ShopCode" value="117279">
				<input type="hidden" name="ShopName" value="지성모터스">
				<input type="hidden" name="ShopEmp" value="신일학">
				<input type="hidden" name="ShopPhone" value="01000000000">
				<input type="hidden" name="CarNumber" value="54더1559">
			</form>

		</div><!-- container(e) -->
	</div><!-- wrap(e) -->
</body>
</html>
