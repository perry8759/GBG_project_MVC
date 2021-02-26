package com.web.GBG_project.HOME.controller;
//回到首頁controller
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class HomeController {
//    @RequestMapping("/welcome")
//    public String welcome(Model model) {
//    	model.addAttribute("title","歡迎");
//    	model.addAttribute("subtitle", "網路獨一無二");
//    	return "welcome";
//    }
    @RequestMapping("/")
    public String index() {
    	return "index";
    }
}
