package com.sist.temp;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MainClass {

	public static void main(String[] args) throws ParseException {
		// TODO Auto-generated method stub
		String start="02/09/2023";
		SimpleDateFormat format=new SimpleDateFormat("mm/dd/yyyy");
		Date std = format.parse(start);
		//변경할 타입으로의 형 변환
		String start_rent = new SimpleDateFormat("yyyy-mm-dd").format(std);
			
			System.out.println(start_rent);
	}

}
