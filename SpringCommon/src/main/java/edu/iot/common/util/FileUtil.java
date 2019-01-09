package edu.iot.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.OutputStream;

public class FileUtil {
	
	public static void copy(String path, OutputStream out) throws Exception{
		
		try(
			BufferedInputStream bis = new BufferedInputStream(
						new FileInputStream(path));
			BufferedOutputStream bos = new BufferedOutputStream(out)
		){
			int data;
			while((data=bis.read())!=-1) {
				bos.write(data);
			}
			bos.flush();
 		}
		
	}
}
