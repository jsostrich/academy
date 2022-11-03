package com.tips.model;

public class FoodExpert {
	public String getTip(String foodmenu){
		String result="";
		if(foodmenu.equals("한식")){
		result="제육덮밥";
		}else if(foodmenu.equals("일식")){
		result="연어초밥";
		}else if(foodmenu.equals("양식")){
		result="시금치 뇨끼";
		}
		return result;
		}
}
