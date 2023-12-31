// 회원정보 예제 데이터

const MembersData = {
	  member1: { name: "홍길동", userId: "hong123", cellNum: "010-1234-5678", area: "서울", gender: "남", age: 30 },
      member2: { name: "이순신", userId: "lee99", cellNum: "010-9876-5432", area: "경기도", gender: "남", age: 45 }
};

const leaveData = 
{
	name: "홍길동",
	userId: "hong123",
	cellNum: "010-1234-5678",
	area: "서울", 
	gender: "남", 
	age: "30",
	leaveType: "ban"
}


// 총 회원수 
const MembersCnt = Object.keys(MembersData).length;
document.getElementById("membersCnt").innerHTML="[총 회원수 " + MembersCnt + "명] 검색결과 n명";

// 날짜선택
$("#buttonGroup > button").click(function(){
	$("#dateType").val($(this).text());
})

$('#cal').daterangepicker();

$("#selectLeaveType").change(function(){
	$("#selectLeaveType").val($(this).val())

});

// 유효성검사
$("#searchBtn").click(function(){
	const selectSearchTypeValue = $("#selectSearchType");
	const inputUserValue = $("#inputUser")	
	const selectLeaveTypeValue = $("#selectLeaveType");
	const dateTypeValue = $("#dateType");
	
		
	if(selectSearchTypeValue.val() !== "viewAll" && !inputUserValue.val()){
		alert("회원정보를 입력하세요");	
		inputUserValue.focus();
		return;
	}
	if(selectSearchTypeValue.val() ==="viewAll" && inputUserValue.val()){
		inputUserValue.val("")
		return;
	}
	
	const resultData = {};
	
	resultData["searchType"] = selectSearchTypeValue.val();
	resultData["inputQuery"] = inputUserValue.val();
	resultData["leaveType"] = selectLeaveTypeValue.val();
	resultData["dateType"] = dateTypeValue.val();
	
	const filteredMembers = Object.keys(MembersData).filter(memberKey => {
    const member = MembersData[memberKey];
   		return (
            (resultData["searchType"] === "viewAll" || member[resultData["searchType"]] === resultData["inputQuery"]) &&
            (resultData["leaveType"] === "viewAll" || member["area"].includes(resultData["leaveType"]))
        );
    
    });

	console.log(filteredMembers);
	console.log(resultData);
	
	
});