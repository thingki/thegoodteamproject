package com.jeong.haejwo.util;

import java.io.File;
import java.io.InputStream;

import com.amazonaws.AmazonClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class UploadObject {
		private static final String BURKETNAME = "jeonghaejwo";
	    private static final String ACCESS_KEY = "AKIAJUPL4UX6QYLEEM3Q";
	    private static final String SECRET_KEY = "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";
	    private AmazonS3 amazonS3;
	    
	    @SuppressWarnings("deprecation")
	    public UploadObject(){
	        AWSCredentials awsCredentials = new BasicAWSCredentials(ACCESS_KEY,SECRET_KEY);
	        amazonS3 = new AmazonS3Client(awsCredentials);
	    }  
	    public void upload(String keyName, InputStream inputStream,ObjectMetadata metadata, File file){
	        if(amazonS3!=null)
	        try{
	            //amazonS3.putObject(new PutObjectRequest(BURKETNAME,keyName,inputStream,metadata));
	            amazonS3.putObject(new PutObjectRequest(BURKETNAME, keyName, file));
	        }catch(AmazonClientException ace){
	            ace.printStackTrace();
	        } finally {
	            amazonS3 = null;
	        }
	    }
}
