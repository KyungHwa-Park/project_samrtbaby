package edu.iot.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

public class XFile {
	public static void copy(File file, OutputStream out) throws Exception {
		try(
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));	
			BufferedOutputStream bos= new BufferedOutputStream(out);
		) {
			int data;
			while((data=in.read())!= -1) {
				bos.write(data);
			}
		}
	}
	
	public static void copy(byte[] data, OutputStream out) throws Exception {
		try(
			BufferedOutputStream bos= new BufferedOutputStream(out);
		) {
			out.write(data);
		}
	}
}
