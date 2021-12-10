package com.jduncan.dojosandninjas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jduncan.dojosandninjas.models.Dojo;
import com.jduncan.dojosandninjas.services.DojoService;
import com.jduncan.dojosandninjas.services.NinjaService;

@Controller
public class MainController {
	
	@Autowired
	private NinjaService ninjaService;
	
	@Autowired
	private DojoService dojoService;
	
	@GetMapping("/")
	public String homePage(Model model) {
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		return "index.jsp";
	}

}
