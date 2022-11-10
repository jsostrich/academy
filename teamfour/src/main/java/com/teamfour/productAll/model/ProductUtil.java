package com.teamfour.productAll.model;

public class ProductUtil {
	public int minPrice(String priceRange) {
		int min = 0;
		
		if(priceRange.equals("1")) {
			min = 0;
		} else if(priceRange.equals("2")) {
			min = 1000;
		} else if(priceRange.equals("3")) {
			min = 5000;
		} else if(priceRange.equals("4")) {
			min = 10000;
		} else if(priceRange.equals("5")) {
			min = 50000;
		}
		
		return min;
	}
	
	public int maxPrice(String priceRange) {
		int max = 0;
		
		if(priceRange.equals("1")) {
			max = 1000;
		} else if(priceRange.equals("2")) {
			max = 5000;
		} else if(priceRange.equals("3")) {
			max = 10000;
		} else if(priceRange.equals("4")) {
			max = 50000;
		} else if(priceRange.equals("5")) {
			max = 0;
		}
		
		return max;
	}
}
