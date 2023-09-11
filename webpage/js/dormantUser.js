// 회원정보 예제 데이터

const MembersData = {
	  member1: { name: "홍길동", userId: "hong123", cellNum: "010-1234-5678", area: "서울", gender: "남", age: 30 },
      member2: { name: "이순신", userId: "lee99", cellNum: "010-9876-5432", area: "경기도", gender: "남", age: 45 }
};

// 총 회원수 
const MembersCnt = Object.keys(MembersData).length;
document.getElementById("membersCnt").innerHTML="[총 회원수 " + MembersCnt + "명] 검색결과 n명";

// 날짜선택
$("#buttonGroup > button").click(function(){
	$("#dateType").val($(this).text());
})

// 유효성검사

$("#searchBtn").click(function(){
	const resultData = {};
	const selectSearchTypeValue = $("#selectSearchType") ;
	const inputUserValue = $("#inputUser") ;
	
	if(selectSearchTypeValue.val() !== "viewAll" && !inputUserValue.val()){
		alert("회원정보를 입력하세요");	
		inputUserValue.focus();
		return;
	}
	if(selectSearchTypeValue.val() ==="viewAll" && inputUserValue.val()){
		inputUserValue.val("")
		return;
	}
	
	resultData["searchType"] = selectSearchTypeValue.val();
	resultData["inputQuery"] = inputUserValue.val();
	
	console.log(resultData);
});