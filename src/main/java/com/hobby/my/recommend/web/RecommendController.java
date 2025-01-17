package com.hobby.my.recommend.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecommendController {
	
	@RequestMapping("/recommend")
	public String recommendView() {
		
		return "recommend/recommend";
	}

}
