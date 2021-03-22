package com.web.GBG_project.ACT.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Vector;

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
public class ActUtils {
	@Autowired
	ServletContext context;

	static public String DEFAULTPIC = "/WEB-INF/resource/images/NoImage.jpg";
	
	public byte[] toByteArray(String filepath) {
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
	public String getPic(byte[] b) {
		return Base64.getEncoder().encodeToString(b);
	}

	public class Page{
		Vector<Integer> pageArr;
		Integer start,total,next,pre,last,count;
		
		public Page(Integer start, Integer total,Integer count) {
			super();
			this.start = start;
			this.total = total;
			this.count = count;
			count();
		}
		
		private void count() {
			this.pageArr = new Vector<Integer>();
			Integer ri = 1;
			if (total % count == 0) {
				for (ri = 1; ri <= total / count; ri++) {
					pageArr.add(ri);
				}
				// 總共21筆資料 每頁5個，則最後一頁開始就是第20筆
			} else {
				for (ri = 1; ri <= total / count; ri++) {
					pageArr.add(ri);
				}
				pageArr.add(ri);
			}

			// 0+5=5，下一頁就從第5筆開始
			next = start + count;
			// 5-5=0，上一頁就從第0筆開始
			pre = start - count;
			// 總共10筆資料 每頁5個 ，則最後一頁開始就是第5筆
			if (total % count == 0) {
				last = total - count;
				// 總共21筆資料 每頁5個，則最後一頁開始就是第20筆
			} else {
				last = total - total % count;
			}
			// 邊界
			pre = pre < 0 ? 0 : pre;
			next = next > last ? last : next;
		}
		
		public Vector<Integer> getPageArr() {
			return pageArr;
		}
		public void setCount(Integer count) {
			this.count = count;
		}
		public Integer getNext() {
			return next;
		}
		public Integer getPre() {
			return pre;
		}
		public Integer getLast() {
			return last;
		}
		
	}
}
