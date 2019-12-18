$(document).ready(function() {
	var IDcode = /^[a-zA-Z0-9]{6,12}$/; // 아이디가 적합한지 검사할 정규식
	var PWcode = /^[a-zA-Z0-9]{8,15}$/; // 패스워드가 적합한지 검사할 정규식
	var emailcode = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식
	var YY = /^[0-9]{4}$/;
	var DD = /^[0-9]{2}$/;
	var PhoneNumberCode = /^[0-9]{10,11}$/;

	//유효성 검증할 id값 가져오기
	var id = document.getElementById('id');
	var labelID = document.getElementById('labelID');

	var pw = document.getElementById('pw');
	var labelPW = document.getElementById('labelPW');

	var checkpw = document.getElementById('checkpw');
	var labelCheckPW = document.getElementById('labelCheckPW');

	var name = document.getElementById('name');
	var labelName = document.getElementById('labelName');

	var birthdayYY = document.getElementById('birthdayYY');
	var birthdayMM = document.getElementById('birthdayMM');
	var birthdayDD = document.getElementById('birthdayDD');
	var label_birthday = document.getElementById('label_birthday');

	var gender = document.getElementById('gender');
	var label_gender = document.getElementById('label_gender');

	var email = document.getElementById('email');
	var labelEmail = document.getElementById('labelEmail');

	var phoneNumber = document.getElementById('phoneNumber');
	var label_Phone_number = document.getElementById('label_Phone_number');

	var SMSCode = document.getElementById('SMSCode');
	var label_SMSCode = document.getElementById('label_SMSCode');

	//유효성 검증 check 함수 실행
	$('#id').on('keyup', function() {
		if (!check(IDcode, id, labelID, '아이디는 6~12자의 영문 대소문자와 숫자로만 입력')) {
			return false;
		}
	});

	$('#pw').on('keyup', function() {
		if (!check(PWcode, pw, labelPW, '패스워드는 8~15자의 영문 대소문자와 숫자로만 입력')) {
			return false;
		}
	});

	$('#checkpw').on('keyup', function() {
		if (pw.value != checkpw.value) {
			// alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
			labelCheckPW.style.display = 'block';
			labelCheckPW.innerHTML = '비밀번호가 다릅니다. 다시 확인해 주세요.';
			return false;
		} else {
			labelCheckPW.style.display = 'none';
		}
	});

	$('#name').on('keyup', function() {
		if (!check1(name, labelName, '이름을 입력해 주세요')) {
			return false;
		}
	});

	$('#birthdayYY').on('keyup', function() {
		if (!check1(birthdayYY, label_birthday, '태어난 년도를 입력해주세요')) {
			return false;
		}
		if (!check(YY, birthdayYY, label_birthday, '4자리 숫자로 입력해주세요')) {
			return false;
		}
	});

	$('#gender').on('keyup', function() {
		if (gender.options[gender.selectedIndex].value == 'G') {
			label_gender.style.display = 'block';
			label_gender.innerHTML = '성별을 입력해주세요';
			gender.value = 'G';
			return false;
		} else {
			label_gender.style.display = 'none';
		}
	});

	$('#birthdayMM').blur(function() {
		if (birthdayMM.options[birthdayMM.selectedIndex].value == '0') {
			label_birthday.style.display = 'block';
			label_birthday.innerHTML = '태어난 달을 입력해주세요';
			birthdayMM.value = '0';
			return false;
		} else {
			label_birthday.style.display = 'none';
		}
	});

	$('#birthdayDD').on('keyup', function() {
		if (!check1(birthdayDD, label_birthday, '태어난 일을 입력해주세요')) {
			return false;
		}
		if (!check(DD, birthdayDD, label_birthday, '2자리 숫자로 입력해주세요')) {
			return false;
		}
	});

	$('#email').on('keyup', function() {
		if (!check1(email, labelEmail, 'E-mail을 입력해 주세요')) {
			return false;
		}

		if (!check(emailcode, email, labelEmail, '적합하지 않은 이메일 형식입니다.')) {
			return false;
		}
	});

	$('#phoneNumber').on('keyup', function() {
		if (!check1(phoneNumber, label_Phone_number, '핸드폰 번호를 입력해주세요')) {
			return false;
		}

		if (!check(PhoneNumberCode, phoneNumber, label_Phone_number, '-를 제외한 숫자로만 입력해주세요')) {
			return false;
		}
	});
	$('#SMSCode').on('keyup', function() {
		if (!check1(SMSCode, label_SMSCode, '인증번호를 입력해주세요')) {
			return false;
		}
	});

	function validate() {
		if (!check2(IDcode, id, labelID, '아이디는 6~12자의 영문 대소문자와 숫자로만 입력')) {
			return false;
		}

		if (!check2(PWcode, pw, labelPW, '패스워드는 8~15자의 영문 대소문자와 숫자로만 입력')) {
			return false;
		}

		if (pw.value != checkpw.value) {
			// alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
			labelCheckPW.style.display = 'block';
			labelCheckPW.innerHTML = '비밀번호가 다릅니다. 다시 확인해 주세요.';
			checkpw.value = '';
			checkpw.focus();
			return false;
		} else {
			labelCheckPW.style.display = 'none';
		}

		if (!check1(name, labelName, '이름을 입력해 주세요')) {
			return false;
		}

		if (!check1(birthdayYY, label_birthday, '태어난 년도를 입력해주세요')) {
			return false;
		}

		if (!check(YY, birthdayYY, label_birthday, '4자리로 입력해주세요')) {
			return false;
		}

		if (gender.options[gender.selectedIndex].value == 'G') {
			label_gender.style.display = 'block';
			label_gender.innerHTML = '성별을 입력해주세요';
			gender.value = 'G';
			gender.focus();
			return false;
		} else {
			label_gender.style.display = 'none';
		}

		if (!check1(birthdayDD, label_birthday, '태어난 일을 입력해주세요')) {
			return false;
		}

		if (!check(DD, birthdayDD, label_birthday, '2자리로 입력해주세요')) {
			return false;
		}

		if (birthdayMM.options[birthdayMM.selectedIndex].value == '0') {
			label_birthday.style.display = 'block';
			label_birthday.innerHTML = '태어난 달을 입력해주세요';
			birthdayMM.value = '0';
			birthdayMM.focus();
			return false;
		} else {
			label_birthday.style.display = 'none';
		}

		if (!check1(email, labelEmail, 'E-mail을 입력해 주세요')) {
			return false;
		}

		if (!check(emailcode, email, labelEmail, '적합하지 않은 이메일 형식입니다.')) {
			return false;
		}

		if (!check1(phoneNumber, label_Phone_number, '핸드폰 번호를 입력해주세요')) {
			return false;
		}

		if (!check(PhoneNumberCode, phoneNumber, label_Phone_number, '-를 제외한 숫자로만 입력해주세요')) {
			return false;
		}

		if (!check1(SMSCode, label_SMSCode, '인증번호를 입력해주세요')) {
			return false;
		}

		alert('회원가입이 완료되었습니다.');
	}

	//check 함수 정의 값을 전달 받아서 실행
	function check(re, what, labelID, message) {
		if (re.test(what.value)) {
			labelID.style.display = 'none';
			return true;
		}
		// alert(message);
		//위에 가져온 id값을 기준으로 style 접근
		labelID.style.display = 'block';
		// innerHTML으로 message를 바꾼다.
		labelID.innerHTML = message;
		//return false;
	}

	function check1(what, labelID, message) {
		if (what.value) {
			labelID.style.display = 'none';
			if (what == phoneNumber) {
				SMSCode.disabled = false;
			}
			return true;
		}
		labelID.style.display = 'block';
		labelID.innerHTML = message;
	}

	//validate button을 눌렀을 경우 유효성 검증할 함수
	function check2(re, what, labelID, message) {
		if (re.test(what.value)) {
			labelID.style.display = 'none';
			return true;
		}
		// alert(message);
		//위에 가져온 id값을 기준으로 style 접근
		labelID.style.display = 'block';
		// innerHTML으로 message를 바꾼다.
		labelID.innerHTML = message;
		what.value = '';
		what.focus();
		//return false;
	}

	function check3(what, labelID, message) {
		if (what.value) {
			labelID.style.display = 'none';
			if (what == phoneNumber) {
				SMSCode.disabled = false;
			}
			return true;
		}
		labelID.style.display = 'block';
		labelID.innerHTML = message;
		what.value = '';
		what.focus();
	}
});

// document.getElementsByClassName('.MemberButton').onclick = function() {
// 	if (!check2(IDcode, id, labelID, '아이디는 6~12자의 영문 대소문자와 숫자로만 입력')) {
// 		return false;
// 	}

// 	if (!check2(PWcode, pw, labelPW, '패스워드는 8~15자의 영문 대소문자와 숫자로만 입력')) {
// 		return false;
// 	}

// 	if (pw.value != checkpw.value) {
// 		// alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
// 		labelCheckPW.style.display = 'block';
// 		labelCheckPW.innerHTML = '비밀번호가 다릅니다. 다시 확인해 주세요.';
// 		checkpw.value = '';
// 		checkpw.focus();
// 		return false;
// 	} else {
// 		labelCheckPW.style.display = 'none';
// 	}

// 	if (!check1(name, labelName, '이름을 입력해 주세요')) {
// 		return false;
// 	}

// 	if (!check1(birthdayYY, label_birthday, '태어난 년도를 입력해주세요')) {
// 		return false;
// 	}

// 	if (!check(YY, birthdayYY, label_birthday, '4자리로 입력해주세요')) {
// 		return false;
// 	}

// 	if (gender.options[gender.selectedIndex].value == 'G') {
// 		label_gender.style.display = 'block';
// 		label_gender.innerHTML = '성별을 입력해주세요';
// 		gender.value = 'G';
// 		gender.focus();
// 		return false;
// 	} else {
// 		label_gender.style.display = 'none';
// 	}

// 	if (!check1(birthdayDD, label_birthday, '태어난 일을 입력해주세요')) {
// 		return false;
// 	}

// 	if (!check(DD, birthdayDD, label_birthday, '2자리로 입력해주세요')) {
// 		return false;
// 	}

// 	if (birthdayMM.options[birthdayMM.selectedIndex].value == '0') {
// 		label_birthday.style.display = 'block';
// 		label_birthday.innerHTML = '태어난 달을 입력해주세요';
// 		birthdayMM.value = '0';
// 		birthdayMM.focus();
// 		return false;
// 	} else {
// 		label_birthday.style.display = 'none';
// 	}

// 	if (!check1(email, labelEmail, 'E-mail을 입력해 주세요')) {
// 		return false;
// 	}

// 	if (!check(emailcode, email, labelEmail, '적합하지 않은 이메일 형식입니다.')) {
// 		return false;
// 	}

// 	if (!check1(phoneNumber, label_Phone_number, '핸드폰 번호를 입력해주세요')) {
// 		return false;
// 	}

// 	if (!check(PhoneNumberCode, phoneNumber, label_Phone_number, '-를 제외한 숫자로만 입력해주세요')) {
// 		return false;
// 	}

// 	if (!check1(SMSCode, label_SMSCode, '인증번호를 입력해주세요')) {
// 		return false;
// 	}

// 	alert('회원가입이 완료되었습니다.');
// };
