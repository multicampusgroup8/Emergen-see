package com.mulcam8.emergensee.vo;


import lombok.ToString;

// 페이지정보, 검색어
@ToString
public class PagingVO {
	private int nowPage = 1; 			// 현재페이지
	private int onePageRecord = 5; 		// 한번에 표시할 레코드 수
	
	private int totalRecord; 			// 총 레코드 수
	private int totalPage; 				// 총 페이지 수
	
	private int offsetPoint = (nowPage-1)*onePageRecord; // 레코드 선택시 시작위치
	
	// 페이지 넘버링
	private int onePageCount = 5;
	private int startPage = 1;
	
	private String searchKey;
	private String searchText;
	
	private String disasterType;
	
	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		offsetPoint = (nowPage-1)*onePageRecord;
		
		startPage = (nowPage - 1)/onePageCount*onePageCount+1;
	}

	public int getOnePageRecord() {
		return onePageRecord;
	}

	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		// 총 페이지 수
		totalPage = (int)Math.ceil(totalRecord / (double)onePageRecord);
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getOffsetPoint() {
		return offsetPoint;
	}

	public void setOffsetPoint(int offsetPoint) {
		this.offsetPoint = offsetPoint;
	}

	public int getOnePageCount() {
		return onePageCount;
	}

	public void setOnePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getDisasterType() {
		return disasterType;
	}

	public void setDisasterType(String disasterType) {
		this.disasterType = disasterType;
	}

	
	
	
	
}
