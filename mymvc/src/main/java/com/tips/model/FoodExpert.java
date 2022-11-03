package com.tips.model;

public class FoodExpert {
	public String getTip(String food){
		String result="";
		if(food.equals("한식")){
		result="제육덮밥";
		}else if(food.equals("일식")){
		result="연어초밥";
		}else if(food.equals("양식")){
		result="시금치 뇨끼";
		}
		return result;
		}
}
