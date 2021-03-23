package com.web.GBG_project.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.web.GBG_project.member.model.MemberBean;

@Component
public class CommonUtils {
	
	@Autowired
	ServletContext context;
	
	//文字加密
	public String getMD5Endocing(String message) {
		
		final StringBuffer buffer = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(message.getBytes());
			byte[] digest = md.digest();

			for (int i = 0; i < digest.length; ++i) {
				final byte b = digest[i];
				final int value = Byte.toUnsignedInt(b);
				buffer.append(value < 16 ? "0" : "");
				buffer.append(Integer.toHexString(value));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		return buffer.toString();
	}
	
	public ResponseEntity<byte[]> getPicture(Object fromObject, Blob blob) {
		String defaultPicture = "/WEB-INF/resource/images/NoImage.jpg";
		
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		if (fromObject != null) {
			filename = "/ss.png";
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(defaultPicture);
				filename = defaultPicture;
			}
		} else {
			media = toByteArray(defaultPicture);
			filename = defaultPicture;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		System.out.println("mimeType: " + mimeType);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

}
