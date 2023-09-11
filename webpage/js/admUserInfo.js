const areaData = {

	seoul :[
		{ name: '강동구' },
		{ name: '강서구' },
		{ name: '강남구' },
		{ name: '강북구' },
		{ name: '도봉구' },
		{ name: '노원구' },
		{ name: '중랑구' },
		{ name: '성북구' },
		{ name: '동대문구' },
		{ name: '종로구 '},
		{ name: '은평구' },
		{ name: '서대문구' },
		{ name: '중구' },
		{ name: '성동구' },
		{ name: '광진구' },
		{ name: '양천구' },
		{ name: '영등포구' },
		{ name: '구로구' },
		{ name: '동작구' },
		{ name: '금천구' },
		{ name: '관악구' },
		{ name: '서초구' },
		{ name: '강남구' },
		{ name: '송파구' },
	],
	gyunggido : [
		{ name: '고양시' },
		{ name: '과천시' },
		{ name: '광명시' },
		{ name: '광주시' },
		{ name: '구리시'},
		{ name: '군포시' },
		{ name: '김포시' },
		{ name: '남양주시' },
		{ name: '동두천시' },
		{ name: '부천시' },
		{ name: '성남시' },
		{ name: '수원시' },
		{ name: '시흥시' },
		{ name: '안산시' },
		{ name: '안성시' },
		{ name: '안양시' },
		{ name: '양주시' },
		{ name: '여주시' },
		{ name: '오산시' },
		{ name: '용인시' },
		{ name: '의왕시' },
		{ name: '의정부시' },
		{ name: '이천시' },
		{ name: '파주시' },
		{ name: '평택시' },
		{ name: '포천시' },
		{ name: '하남시' },
		{ name: '화성시'}
	],
	incheon : [
		{ name: '중구' },
		{ name: '동구' },
		{ name: '미추홀구' },
		{ name: '연수구' },
		{ name: '남동구' },
		{ name: '부평구' },
		{ name: '계양구' },
		{ name: '서구' },
		{ name: '강화군' },
		{ name: '옹진군' }
	]
};

// 회원정보 예제 데이터

const MembersData = {
	 member1: { name: "홍길동", userId: "hong123", cellNum: "010-1234-5678", area: "서울", gender: "남", age: 30, joinDate: 22-08-08 },
     member2: { name: "이순신", userId: "lee99", cellNum: "010-9876-5432", area: "경기도", gender: "남", age: 45, joinDate: 23-08-08}
};

var leaveMembers = [];

// 총 회원 수 계산
const MembersCnt = Object.keys(MembersData).length;
document.getElementById("membersCnt").innerHTML="[총 회원수"+MembersCnt+"명] 검색회원 0명";

// subArea 만들기
// 순서 
// 1. 변수선언 (mainArea값 뽑아오기)
// 2. 변수선언 (subArea값 뽑아오기)
// 3. subArea 비우기 (새로운 값을 채워야 하기때문에) 
// 4. subArea 리스트에 mainArea값에 일치하는 데이터 채우기(for each 반복문)
// 5. 만약 인덱스가 0이라면 --선택-- 넣어주기

// (append)는 요소 끝부분에 추가인데 왜 append가 사용되는지 물어보기



$("#searchArea").change(function(){
	const searchAreaValue = $(this).val();
	const areaDataValue = $("#areaData");
	
	$(areaDataValue).empty();
	
	if (searchAreaValue !== ""){
		areaData[searchAreaValue].forEach((item,index) =>{
			if (index === 0)
			$(areaDataValue).append(`
				<option value="none">--선택--</option>
				`)
			$(areaDataValue).append(`
				<option value="${item.name}">${item.name}</option>
			`);
		})
	} else {
		$(areaDataValue).append(`
			<option value="">select</option>
		`)
	}
});


// 유효성 검사
// 1. 검사하고 싶은 값들 뽑아오기
// ( 회원정보 셀렉리스트, 인풋값, mainArea값, subArea값, 날짜는 더 배우고)
// ( 처음부터 val값을 뽑아오지 않고 if문 에서 붙이면 편하다??, 왜인지 둘 다 실행 해볼것)
// ( 아~ 아마 val()을 변수에 바로 넣어버리면 서울 또는 경기등 특정지역이 바로 대입이 되니 if문에서 더 복잡해진다)
// ( 그래서 select박스 리스트값을 한번에 담은다음에 if문에서 val값을 뽑아서 사용하면 편리한것 같다?)
$("#searchBtn").click(function(){
	const resultData = {};
	
	const searchUserValue = $("#searchUser");
	const inputUserValue = $("#inputUser");
	const searchAreaValue = $("#searchArea");
	const areaDataValue = $("#areaData");
	const dateTypeValue = $("#dateType");
	
	// 검사 시작
    if (searchUserValue.val() !== "viewAll" && !inputUserValue.val()){
        alert("회원정보를 입력해주세요");
        inputUserValue.focus();
        return;
    }
    if (searchAreaValue.val() === "viewAll" && inputUserValue.val()){
		inputUserValue.val("");
		return;
	}
   else {
		resultData["searchType"] = searchUserValue.val();
		resultData["searchQuery"] = inputUserValue.val();
		resultData["mainArea"] = searchAreaValue.val();
		resultData["subArea"] = areaDataValue.val();
		resultData["dateType"] = dateTypeValue.val();
	}
	
	 const filteredMembers = Object.keys(MembersData).filter(memberKey => {
     const member = MembersData[memberKey];
        return (
            (resultData["searchType"] === "viewAll" || member[resultData["searchType"]] === resultData["searchQuery"]) &&
            (resultData["mainArea"] === "viewAll" || member["area"].includes(resultData["mainArea"]))
        );
    });

	console.log(filteredMembers);
	console.log(resultData);
	
});


$('#cal').daterangepicker();

$(".buttonGroup > button").click(function(){
	var selectedValue = $(this).val();
	$("#dateType").val(selectedValue);
	
});

$(".banBtn").click(function(){
    var checked = $("#resultUser input[type='checkbox']:checked");
    
    if (checked.length === 0) {
        alert("데이터를 선택하세요.");
        return; // 선택된 데이터가 없으면 더 이상 진행하지 않음
    }

    var confirmed = confirm("정말 삭제하시겠습니까?");
    
    if (confirmed){
        checked.each(function(){
            var userInfo = $(this).closest("ul");
            var userId = userInfo.find(".userId").text();
            delete MembersData[userId];
            userInfo.remove();
            console.log("삭제됨");
        });
    }
});



















