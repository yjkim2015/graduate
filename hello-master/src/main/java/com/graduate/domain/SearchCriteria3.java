package com.graduate.domain;

public class SearchCriteria3 extends Criteria3{

	private String searchType;
	private String keyword;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return super.toString() + " SearchCriteria3 "
				+ "[searchType=" + searchType + ", keyword="
				+ keyword + "]";
	}
}
