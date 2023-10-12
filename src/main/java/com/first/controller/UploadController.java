package com.first.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


import com.first.domain.ImageFileDTO;

import lombok.extern.log4j.Log4j;
//import net.coobird.thumbnailator.Thumbnailator;

@RestController
@Log4j
public class UploadController {
	
	@PostMapping("/uploadAjaxAction")
	public ResponseEntity<List<ImageFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("upload ajax post ..................");
		
		List<ImageFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		
		String uploadFolderPath = getFolder();
		
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path: " + uploadPath);

		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			ImageFileDTO imageDTO = new ImageFileDTO();
			
			log.info("---------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			String uploadFileName = multipartFile.getOriginalFilename();
			
			imageDTO.setFileName(uploadFileName);
			
			//IE 처리를 위한 코드
			uploadFileName=uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);

			String extensionName=uploadFileName.substring(uploadFileName.lastIndexOf("."));
			String pureFileName=uploadFileName.substring(0, uploadFileName.lastIndexOf("."));			
			
			log.info("only file name: " + uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = pureFileName + "_" + uuid.toString() + extensionName;
			
			//File saveFile = new File(uploadFolder, uploadFileName);
			File saveFile = new File(uploadPath, uploadFileName);
			try {
				multipartFile.transferTo(saveFile);
				
				imageDTO.setUuid(uuid.toString());
				imageDTO.setUploadPath(uploadFolderPath);
				
//				if(checkImageType(saveFile)) {
//					
//					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, pureFileName + "_" + uuid.toString() + "_s" + extensionName));
//					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
//					thumbnail.close();
//				}
				
				list.add(imageDTO);
				
			} catch(Exception e) {
				log.error(e.getMessage());
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}

	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

}
