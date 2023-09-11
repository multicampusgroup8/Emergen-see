const subBoardData ={
	emergencyBoard: [
		{area: "서울"},
		{area: "경기도"},
		{area: "인천"}
	],
	newsBoard: [
		{area: "서울"},
		{area: "경기도"},
		{area: "인천"}
	],
	linkBoard: [
		{area: "서울"},
		{area: "경기도"},
		{area: "인천"}
	]
};

// 회원정보 예제 데이터

const MembersData = {
	  member1: { name: "홍길동", userId: "hong123", cellNum: "010-1234-5678", area: "서울", gender: "남", age: "30" },
      member2: { name: "이순신", userId: "lee99", cellNum: "010-9876-5432", area: "경기도", gender: "남", age: "45" }
};

const BoardData =[
	{
		category: "긴급상황게시판",
		title: "침수되었어요",
		date: "23-08-08",
		writer: "홍길동"
	}
]
	




// 총 회원수 
const MembersCnt = Object.keys(MembersData).length;
document.getElementById("membersCnt").innerHTML="[총 회원수 " + MembersCnt + "명] 검색결과 n명";

// 날짜선택
$(".buttonGroup > button").click(function(){
	var selectedValue = $(this).val();
	$("#dateType").val(selectedValue);
})




$("#selectBoard").change(function(){
	const selectBoardValue = $(this).val();
	const subBoardValue = $("#selectSubBoard");

	subBoardValue.empty();
	if (selectBoardValue === "disasterBoard"){
		subBoardValue.hide();
	}else{
		subBoardValue.show();
	}

	if (selectBoardValue !== ""){
		subBoardData[selectBoardValue].forEach((item,index) =>{
			if (index === 0)
			subBoardValue.append(`
				<option value="viewAll">전체보기</option>
				`)
			subBoardValue.append(`
				<option value="${item.area}">${item.area}</option>
			`);
		})
	}
});

// 유효성 검사

$("#searchBtn").click(function(){
	let resultData = {};
	
	const selectBoardValue = $("#selectBoard");
	const selectSubBoardValue = $("#selectSubBoard");
	const selectPostValue = $("#selectPost");
	const inputUserValue = $("#inputUser");
	const dateTypeValue = $("#dateType");
	const answerdTypeValue = $("#answerdType");
	
	if(selectBoardValue.val() === ""){
		alert("게시판목록을 선택해주세요");
		selectBoardValue.focus();
		return;
	}	
	if(selectPostValue.val() !== "all" && !inputUserValue.val()){
		alert("검색어를 입력해주세요")
		inputUserValue.focus();
		return;
	}

	resultData["BoardType"] = selectBoardValue.val();
	resultData["subBoardType"] = selectSubBoardValue.val();
	resultData["PostTitle"] = selectPostValue.val();
	resultData["inputQuery"] = inputUserValue.val();
	resultData["dateType"] = dateTypeValue.val();
	resultData["answerdType"] = answerdTypeValue.val();
	
	console.log(resultData);

});
















