package com.sist.temp;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class abc {

	public static void main(String[] args) throws ParseException {
		// TODO Auto-generated method stub
		String s="09/02/2023";
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        Date date = format.parse(s);
        System.out.println(date);
	}

}
