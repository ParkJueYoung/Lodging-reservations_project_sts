package com.reserve.model;

public class AttachImageVO {
	
	// 경로
	private String uploadPath;
	
	// UUID
	private String uuid;
	
	// 파일 이름
	private String fileName;
	
	// 숙소 id
	private int lodgingId;

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getLodgingId() {
		return lodgingId;
	}

	public void setLodgingId(int lodgingId) {
		this.lodgingId = lodgingId;
	}

	@Override
	public String toString() {
		return "AttachImageVO [uploadPath=" + uploadPath + ", uuid=" + uuid + ", fileName=" + fileName + ", lodgingId="
				+ lodgingId + "]";
	}
	
	
}
