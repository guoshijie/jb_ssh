package com.jb.utils;

import java.util.Arrays;

public class ArrayUtils {

	//给定一个数字，初始化数组
	public static int[] initArray(int i){
		int[] tmp = new int[i];
		for(int j=0;j<i;j++){
			tmp[j] = j+1;
		}
		return tmp;
	}
	
	//给定一个下标，和一个整数数组，返回去掉该下标后的数组
	public static int[] secondArray(int[] array,int k){
		int[] tmp = new int[array.length-1];
		System.arraycopy(array, 0, tmp, 0, k);
		System.arraycopy(array, k+1, tmp, k, array.length-1-k);
		return tmp;
	}
	
	//给定一个整型数组，随机返回该数组中的任意一个值
	public static int getOneNumber(int[] array){
		Double temp = Math.random();
		Double temp2 = temp*array.length;
		return array[temp2.intValue()];
	}
	
	public static int[] getRandomArray(int i){
		int[] array = new int[2];
		
		int[] one_array =  initArray(i);
		int one_num = getOneNumber(one_array);
		array[0]=one_num;
		
		int[] sec_array = secondArray(one_array,one_num-1);
		int two_num = getOneNumber(sec_array);
		array[1]=two_num;
		Arrays.sort(array);
		return array;
	}
	
	//打印数组
	public static void printArray(int[] array){
		for(int i:array){
			System.out.print(i+"\t");
		}
		System.out.println();
	}
	
	//测试主方法
	public static void main(String[] args) {
		printArray(getRandomArray(5));
	}
	
}
