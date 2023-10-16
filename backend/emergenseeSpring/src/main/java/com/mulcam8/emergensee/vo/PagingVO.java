package com.mulcam8.emergensee.vo;


import lombok.ToString;

// ����������, �˻���
@ToString
public class PagingVO {
	private int nowPage = 1; 			// ����������
	private int onePageRecord = 5; 		// �ѹ��� ǥ���� ���ڵ� ��
	
	private int totalRecord; 			// �� ���ڵ� ��
	private int totalPage; 				// �� ������ ��
	
	private int offsetPoint = (nowPage-1)*onePageRecord; // ���ڵ� ���ý� ������ġ
	
	// ������ �ѹ���
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
		
		// �� ������ ��
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
