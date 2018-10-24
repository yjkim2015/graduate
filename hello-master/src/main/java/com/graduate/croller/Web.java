package com.graduate.croller;


import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Web {

	public static String href;
	public static String href2;

	public static void main(String[] args) {
		try {
			Document rawData =Jsoup.connect("http://www.tourtips.com/dest/list/1001_hongkong?type=place")
					.timeout(5000)
					.get();
			Elements articles = rawData.select("[class=spot_list] li img");
			Elements articles2= rawData.select("[class=spot_list] li [class=title]");
		
			href=articles.toString();
			
			System.out.println(href);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}

