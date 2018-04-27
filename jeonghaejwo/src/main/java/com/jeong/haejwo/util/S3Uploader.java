package com.jeong.haejwo.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.amazonaws.services.s3.model.ObjectMetadata;

public class S3Uploader {
	public String upload(MultipartHttpServletRequest multi) {
		// 년월일 으로 서버 날짜를 받아옴
		Date date = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
		String dateS = transFormat.format(date);
		// 파일받는부분
		Iterator<String> files = multi.getFileNames();
		String uploadFile = files.next();
		MultipartFile file = multi.getFile(uploadFile);
		// 유저 정보 받아오는 부분
		String id = multi.getParameter("userId");
		String path="";
		System.out.println(id);
		try {
			UploadObject uploadObject = new UploadObject();
			ObjectMetadata metadata = new ObjectMetadata();
			InputStream is = file.getInputStream();
			String originName = file.getOriginalFilename();
			path="https://s3.ap-northeast-2.amazonaws.com/jeonghaejwo/"+dateS + "/" + id + "/" + file.getOriginalFilename();
			File convFile = new File(originName);
			file.transferTo(convFile);
			uploadObject.upload(path, is, metadata, convFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return path;
	}
}
