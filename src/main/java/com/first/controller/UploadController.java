package com.first.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


import com.first.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.util.BufferedImages;


@Log4j
@Controller
public class UploadController {
	
	private String uploadFolder = "C:\\upload";
	
	@GetMapping("/uploadAjax")
	public void uploadAjax()
	{
		log.info("upload ajax");
	}
	
	@PostMapping("/uploadAjax")
	@ResponseBody
    public ResponseEntity<List<AttachFileDTO>> uploadFile(MultipartFile[] uploadFile)
	{
		log.info("update ajax pos.....................");
		
		List<AttachFileDTO> list = new ArrayList<AttachFileDTO>();
		
		
		// upload폴더 안에 년,월,일에 해당하는 폴더가 없으면 생성 상위폴더가 없으면 상위폴더까지 생성함
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder ,uploadFolderPath);
		
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for ( MultipartFile multipartFile : uploadFile)
		{
			log.info("........................................................");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String onlyFileName = multipartFile.getOriginalFilename();

			UUID uuid = UUID.randomUUID();
	
			String uploadFileName = uuid.toString() + "_" + onlyFileName;
			
			try
			{
				File saveFile = new File(uploadPath , uploadFileName);
				
				if(checkImageType(saveFile) == true) {
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath , "s_" + uploadFileName));
					InputStream imageInputStream = multipartFile.getInputStream();
					
					BufferedImage originalImage = ImageIO.read(imageInputStream);
					BufferedImage thumbnailImage = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
					
					thumbnailImage.createGraphics().drawImage(originalImage.getScaledInstance(100, 100, java.awt.Image.SCALE_SMOOTH), 0, 0, 100, 100, null);
					
					ImageIO.write(thumbnailImage, "jpg", thumbnail);
					multipartFile.transferTo(saveFile);
					thumbnail.close();
					
					attachDTO.setFileName(onlyFileName);
					attachDTO.setUuid(uuid.toString());
					attachDTO.setUploadPath(uploadFolderPath);
					
					list.add(attachDTO);
					
				}
				else {
					return new ResponseEntity<>(list , HttpStatus.NOT_ACCEPTABLE);
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(list , HttpStatus.OK);
    }
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type",Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file) , header , HttpStatus.OK);
		}
		catch(IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		File file;
		try {
			fileName = "C:\\upload\\" + URLDecoder.decode(fileName, "UTF-8");
			log.info("deleteFile: " + fileName); 			
			file = new File(fileName);
			file.delete();
			if(type.equals("image")) {
				String extensionName = fileName.substring(fileName.lastIndexOf("."));
				String largeFileName = fileName.substring(0, fileName.lastIndexOf(".")-2)+extensionName;				
				//String largeFileName = file.getAbsolutePath().replace("_s", "");
				log.info("largeFileName: " + largeFileName);
				file = new File(largeFileName);
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>("deleted", HttpStatus.OK);
	}
	
	
	
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-",File.separator);
	}
	
	private boolean checkImageType(File file) {
		
		try {			
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		}
		catch(IOException e){
			e.printStackTrace();
		}
		return false;
	}
	



}
