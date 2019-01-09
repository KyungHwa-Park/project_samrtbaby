package edu.iot.common.util;

public class ArrayUtil {
	public static void swap(Object[] arr, int i1, int i2) {
		Object temp = arr[i1];
		arr[i1] = arr[i2];
		arr[i2] = temp;	
	}
}

