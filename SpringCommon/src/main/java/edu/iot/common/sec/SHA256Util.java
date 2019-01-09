package edu.iot.common.sec;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class SHA256Util {
	public static String getEncrypt(String source, String salt) {

		byte[] bytes = (source + salt).getBytes();
		String result = "";
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(bytes);

			byte[] byteData = md.digest();
			result = byteToHexString(byteData);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return result;
	}

	public static String generateSalt() {
		Random random = new Random();

		byte[] salt = new byte[8];
		random.nextBytes(salt);
		return byteToHexString(salt);
		
	}

	public static String byteToHexString(byte[] bytes) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < bytes.length; i++) {
			sb.append(String.format("%02x", bytes[i]));
		}

		return sb.toString();
	}
	
	
}
