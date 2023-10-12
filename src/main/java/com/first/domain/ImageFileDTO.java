package com.first.domain;

import lombok.Data;

@Data
public class ImageFileDTO {
	
	private String uuid;
	
	private String uploadPath;
	
	private String fileName;
	
	private boolean fileType;
	
	private int lid;
	

}
