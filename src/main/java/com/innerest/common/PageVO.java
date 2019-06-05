package com.innerest.common;

public class PageVO {
	private static final int DEFAULT_GROUP_SIZE = 10;
	private static final int DEFAULT_PAGE_SIZE = 10;
	
	private int groupSize = DEFAULT_GROUP_SIZE; // 한 그룹에 표시되는 페이지 목록의 수
	private int pageSize = DEFAULT_PAGE_SIZE; //한 페이지에 표시되는 레코드 수 == 페이지 크기
	private int reqPage = 1; //요청 페이지
	
	private int totalPageNum;
	private int startPage;
	private int endPage;
	
	public int getGroupSize() {
		return groupSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getReqPage() {
		return reqPage;
	}
	
	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getTotalPageNum() {
		return totalPageNum;
	}

	public void setGroupSize(int groupSize) {
		if(groupSize<1 || groupSize >20) {
			groupSize = 10;
		}
		this.groupSize = groupSize;
	}

	public void setPageSize(int pageSize) {
		if(pageSize <1 || pageSize>50) {
			pageSize = 10;
		}
		this.pageSize = pageSize;
	}

	public void setReqPage(int reqPage) {
		this.reqPage = reqPage;
	}

	public void setTotalRecordNum(int totalRecordNum) {
		
		totalPageNum = totalRecordNum/pageSize;
		if(totalRecordNum % pageSize != 0) {
			totalPageNum++;
		}
		
		if(totalPageNum < reqPage) {
			reqPage = totalPageNum;
		}
		if(reqPage < 1) {
			reqPage = 1;
		}
		
		// req : 1~10 >>  sP: 1 eP: 10
		// req :11~20 >>  sP: 11 eP : 20
		startPage = ((reqPage-1)/groupSize)*groupSize + 1;
		endPage = startPage + groupSize - 1;
		if(endPage > totalPageNum) {
			endPage = totalPageNum;
		}
	}
	
	// 0~ pageSize-1, 1*pageSize ~ 2*pageSize-1...
	public int getStartRowNumForDB() {
		return (reqPage-1)*pageSize;
	}
}
