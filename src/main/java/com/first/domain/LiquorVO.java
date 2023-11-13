package com.first.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class LiquorVO {


	private int lid;
	private String name;
	private String description;
	private String cateName;
	private int price;
	private int stock;
	
	private List<ImageFileVO> imageList;
	

}

