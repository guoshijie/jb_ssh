package com.jb.utils;

import java.io.File;
import java.util.Calendar;
import java.util.Random;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

public class FileUpUtils {

	public static String doFileUp( File upload, String uploadFileName, String path) {
		try {
			// 保存到 中间件的 绝对路径
			String targetDirectory = ServletActionContext.getServletContext().getRealPath(path);  // C:/P/A / tOM
			System.out.println("targetDirectory : " + targetDirectory);
			// 保存到数据库的相对路径
			String dbname = accordingToTimeNaming(uploadFileName);
			String toDataBasePath = ServletActionContext.getRequest().getContextPath() + "/" + path + "/" + dbname;
			System.out.println("toDataBasePath : " + toDataBasePath);   //       /struts/img/02.png
			// 声明目标文件
			File target = new File(targetDirectory, dbname);   //  //     C:/P/A / tOM/02.png
			// 开始上传拷贝
			FileUtils.copyFile(upload, target);
			return toDataBasePath;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 处理多文件上传的方法
	 */
	public static String doFilesUp( File[] upload , String[] uploadFileName, String path) {
		
		//获取上传的绝对路径 保存到 中间件tomcat
		String middelWarePath = ServletActionContext.getServletContext().getRealPath(path); 
		System.out.println("targetDirectory : " + middelWarePath);
		
		StringBuffer toDB = new StringBuffer(); 
		
		try {
			
			for (int i = 0; i < upload.length; i++) {   
				String dbname = accordingToTimeNaming(uploadFileName[i]);
				// 保存到数据库的相对路径										
				String toDataBasePath = ServletActionContext.getRequest().getContextPath() + "/" + path + "/" + dbname;
				
				toDB.append(toDataBasePath).append(",");
				
				//将文件 保存到  tomcat 的文件路径 
				File target = new File( middelWarePath, dbname);   
				
				// 开始上传拷贝
				FileUtils.copyFile(upload[i], target);
			}
			
			String toDB_path = toDB.deleteCharAt(toDB.lastIndexOf(",")).toString();

			return toDB_path;      //   a.png,b.png,c.png   

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public static String accordingToTimeNaming(String filename){
		 String destinationfileName = null;
		 if(filename.endsWith(".jpg")){
			   destinationfileName=getTimeString() + ".jpg";
		   }else if(filename.endsWith(".gif")){
			   destinationfileName=getTimeString() + ".gif";
		   }else if(filename.endsWith(".bmp")){
			   destinationfileName=getTimeString() + ".bmp";
		   }else if(filename.endsWith(".png")){
			   destinationfileName=getTimeString() + ".png";
		   }else if(filename.endsWith(".psd")){
			   destinationfileName=getTimeString() + ".psd";
		   }else if(filename.endsWith(".JPG")){
			   destinationfileName=getTimeString() + ".jpg";
		   }
		return destinationfileName;
	}
	
	public static String getTimeString(){
		 Calendar time = Calendar.getInstance();
		 Random rd = new Random();
		 String str = null;
		 str=String.valueOf(time.get(Calendar.YEAR))
				   + String.valueOf(time.get(Calendar.MONTH)+1)
				   + String.valueOf(time.get(Calendar.DAY_OF_MONTH))
				   + String.valueOf(time.get(Calendar.HOUR_OF_DAY))
				   + String.valueOf(time.get(Calendar.MINUTE))
				   + String.valueOf(time.get(Calendar.SECOND))
				   + String.valueOf(rd.nextInt(10000));
		 return str;
	}

}
