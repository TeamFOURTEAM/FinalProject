//지도 api 실행
var map;
$(document).ready(function() {
	var container = document.getElementById('MapArea'); //지도 출력 div
	var options = {
		center: new kakao.maps.LatLng(37.537915, 127.123304), //지도의 중심 좌표
		level: 2 //지도 확대
	};

	map = new kakao.maps.Map(container, options); //지도 생성
});

//display전환과 스크롤,opacity 컨트롤
function admin_add_CompanyMap() {
	var addCompanyDP = document.getElementById('addCompany');
	var keyEventStop = document.getElementById('CompanyName');

	//display 보이고 감추기 --id접근 바로 가능한듯?;
	addCompany.classList.toggle('addCompany');
	// addCompanyDP.style.display == 'block'
	// 	? (addCompanyDP.style.display = 'none')
	// 	: (addCompanyDP.style.display = 'block');

	//버튼활성화 될때 마다 keyEvent영역 잠금
	if (!DisPlayEvent(keyEventStop)) return false;
	// addCompanyDP.style.display == 'block'
	// 	? (CompanyName.style.pointerEvents = 'none')
	// 	: (CompanyName.style.pointerEvents = 'auto');
}

// keyEvent 잠그기(마우스 이벤트)
function DisPlayEvent(keyEventStop) {
	var opacityBlock = document.getElementById('opacityBlock');
	var scrollLock = document.getElementById('scrollLock');
	opacityBlock.classList.toggle('DPbackground');
	scrollLock.classList.toggle('not_scroll');
	keyEventStop.style.pointerEvents == 'none'
		? (keyEventStop.style.pointerEvents = 'auto')
		: (keyEventStop.style.pointerEvents = 'none');
	header.style.pointerEvents == 'none'
		? (header.style.pointerEvents = 'auto')
		: (header.style.pointerEvents = 'none');
	title.style.pointerEvents == 'none' ? (title.style.pointerEvents = 'auto') : (title.style.pointerEvents = 'none');
	MapArea.style.pointerEvents == 'none'
		? (MapArea.style.pointerEvents = 'auto')
		: (MapArea.style.pointerEvents = 'none');
}
// multipart 사용시 contentType = encoding 변환해주는 부분
function fn_check() {
	//frm = form id값 id값 정해주면 document.get...id안써도 바로 값 가져옴
	frm.encoding = 'application/x-www-form-urlencoded';
	frm.action = '/newCompany';
	frm.submit();
}

//비동기식
function MapInfo(company_name) {
	alert(company_name);
	// alert(company_name);
	$.ajax({
		async: true,
		type: 'POST',
		url: '/MapOverlay',
		data: { company_name: company_name },
		datatype: 'json',
		success: function(result) {
			// var container = document.getElementById('MapArea'); //지도 출력 div
			// var options = {
			// 	center: new kakao.maps.LatLng(37.537915, 127.123304), //지도의 중심 좌표
			// 	level: 2 //지도 확대
			// };

			// var map = new kakao.maps.Map(container, options); //지도 생성
			var content =
				'<div class="overlayBOX">' +
				'<div class="companyImage">' +
				'<img src="/resources/img/main/main_image01.jpg" alt="NO Image">' +
				'</div>' +
				'<div class="Company_name">' +
				result.company_name +
				'</div>' +
				'<div class="Company_addr">' +
				result.company_addr +
				'</div>' +
				'</div>';
			alert(content);
			var position = new kakao.maps.LatLng(37.538067, 127.123425);

			// 커스텀 오버레이를 생성합니다
			var customOverlay = new kakao.maps.CustomOverlay({
				position: position,
				content: content,
				xAnchor: 0.3,
				yAnchor: 0.91
			});
			customOverlay.setMap(map);
		},
		error: function() {
			alert(result.company_name);
		}
	});
}
