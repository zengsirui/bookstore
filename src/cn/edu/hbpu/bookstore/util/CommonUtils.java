package cn.edu.hbpu.bookstore.util;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import cn.edu.hbpu.bookstore.pojo.Product;

public class CommonUtils {
    //�ļ�������ָ����Ψһ��UUID��Ϊ�ļ���
	public static String getUUID(){
		return UUID.randomUUID().toString().replaceAll("-", "");
		
	}
	//ָ���ļ��ϴ���·��
	public static String path="D:\\dev\\upload\\";
	//�����ļ��ϴ�
	public static void uploadFiles(Product product,MultipartFile[] files ){
		//����ϴ�����ļ��Ļ����ļ���֮���ö��ŷָ�������product�����image������
		String picNames="";
		for (int i = 0; i < files.length; i++) {
			if (files[i]!=null) {
				String picName=getUUID();
				//��ȡ�ϴ��ļ����ļ���
				String filename=files[i].getOriginalFilename();
				//��ȡ��չ��
				String extname=filename.substring(filename.indexOf("."));
				//��ʼ�ϴ�
				try {
					files[i].transferTo(new File(path+picName+extname));
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				picNames+=picName+extname+",";
			}
		}
		//����ͼƬ������Ʒ������
		product.setImage(picNames.substring(0, picNames.length()-1));
	}
}
