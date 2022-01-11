package com.reserve.model;

import java.util.Date;

public class LeaseVO {
	// 아이디
    private int leaseId;
    
    // 숙소 이름
    private String leaseName;
    
    // 숙소 타입
    private String typeId;
    
    // 숙소 타입 이름
    private String typeName;
    
    // 숙소 소개
    private String leaseIntro;
    
    // 등록 날짜
    private Date regDate;
    
    // 숙소 날짜
    private Date updateDate;

	public int getLeaseId() {
		return leaseId;
	}

	public void setLeaseId(int leaseId) {
		this.leaseId = leaseId;
	}

	public String getLeaseName() {
		return leaseName;
	}

	public void setLeaseName(String leaseName) {
		this.leaseName = leaseName;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
		if(typeId.equals("01")) {
            this.typeName = "카라반";
        } else {
            this.typeName = "캠핑장";
        }
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getLeaseIntro() {
		return leaseIntro;
	}

	public void setLeaseIntro(String leaseIntro) {
		this.leaseIntro = leaseIntro;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "LeaseVO [leaseId=" + leaseId + ", leaseName=" + leaseName + ", typeId=" + typeId
				+ ", typeName=" + typeName + ", leaseIntro=" + leaseIntro + ", regDate=" + regDate + ", updateDate="
				+ updateDate + "]";
	}
    
    
}
