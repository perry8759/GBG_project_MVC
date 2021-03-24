package com.web.GBG_project.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialClob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.web.GBG_project.ACT.model.ACT;

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
//=========================================
	static public String DEFAULTPIC = "/WEB-INF/resource/images/NoImage.jpg";
	
	public String getPic(byte[] b) {
		return Base64.getEncoder().encodeToString(b);
	}
//=========================================分頁計算
	public Page getPage(Integer start, Integer total,Integer count) {
		return new Page( start,  total, count);
	}
	public class Page{
		Vector<Integer> pageArr;
		
		Integer start,total,next,pre,last,count;
		
		private Page(Integer start, Integer total,Integer count) {
			super();		
			this.start = start;
			this.total = total;
			this.count = count;
			pageCount();
		}
		
		private void pageCount() {
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
		public Map<String, Integer> getPageNum() {
			Map<String, Integer> pageNum=new HashMap<>();
			pageNum.put("start",start );
			pageNum.put("total", total);
			pageNum.put("next", next);
			pageNum.put("pre", pre);
			pageNum.put("last", last);
			pageNum.put("count", count);
			return pageNum;
		}
	}
	
//=========================================	
	public Clob StringToClob(String string) {
		Clob clob = null;
		try {
			clob = new SerialClob(string.toCharArray());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clob;
	}

	public String ClobToString(Clob clob) {
		Reader r;
		StringBuffer buffer = new StringBuffer();
		try {
			r = clob.getCharacterStream();
			int ch;
			while ((ch = r.read()) != -1) {
				buffer.append("" + (char) ch);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}
//=======================================
	// 接收表單中的datetimepicker後，轉成timeStamp
	public Timestamp StringToTimestamp(String date) throws ParseException {
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:s");
		java.util.Date cdate1 = sdf1.parse(date);
		Timestamp ts = new Timestamp(cdate1.getTime());
		return ts;
	}

	public String TimestampToString(Timestamp ts) {
		String tsStr = "";
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:s");
		try {
			tsStr = sdf.format(ts);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return tsStr;
	}

}
