package cn.edu.hbpu.bookstore.util;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import cn.edu.hbpu.bookstore.pojo.Product;

public class CommonUtils {
    //文件名另外指定，唯一的UUID作为文件名
	public static String getUUID(){
		return UUID.randomUUID().toString().replaceAll("-", "");
		
	}
	//指定文件上传的路径
	public static String path="D:\\dev\\upload\\";
	//进行文件上传
	public static void uploadFiles(Product product,MultipartFile[] files ){
		//如果上传多个文件的话，文件名之间用逗号分隔，存在product对象的image属性中
		String picNames="";
		for (int i = 0; i < files.length; i++) {
			if (files[i]!=null) {
				String picName=getUUID();
				//获取上传文件的文件名
				String filename=files[i].getOriginalFilename();
				//获取扩展名
				String extname=filename.substring(filename.indexOf("."));
				//开始上传
				try {
					files[i].transferTo(new File(path+picName+extname));
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				picNames+=picName+extname+",";
			}
		}
		//设置图片名到商品对象中
		product.setImage(picNames.substring(0, picNames.length()-1));
	}
}
