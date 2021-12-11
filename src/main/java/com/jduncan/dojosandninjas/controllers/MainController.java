package com.jduncan.dojosandninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.jduncan.dojosandninjas.models.Dojo;
import com.jduncan.dojosandninjas.models.Ninja;
import com.jduncan.dojosandninjas.services.DojoService;
import com.jduncan.dojosandninjas.services.NinjaService;

@Controller
public class MainController {
	
	@Autowired
	private NinjaService ninjaService;
	
	@Autowired
	private DojoService dojoService;
	
	// **** DISPLAY ROUTES ****
	
	// View index page
	@GetMapping("/")
	public String homePage(Model model) {
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		return "index.jsp";
	}
	
	// View create Dojo form
	@GetMapping("/dojos/new")
	public String showCreateDojoForm(@ModelAttribute("newDojo") Dojo newDojo) {
		return "newDojo.jsp";
	}
	
	// View create Ninja form
	@GetMapping("/ninjas/new")
	public String showCreateNinjaForm(@ModelAttribute("newNinja") Ninja newNina, Model model) {
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		return "newNinja.jsp";
	}
	
	// View one dojo
	@GetMapping("/dojos/{id}")
	public String showOneDojo(@PathVariable("id") Long id, Model model) {
		Dojo dojo = dojoService.showOneDojo(id);
		model.addAttribute("dojo", dojo);
		return "showDojo.jsp";
	}
	
	// **** ACTION ROUTES ****
	
	// CREATE
	// Process creation of new Dojo
	@PostMapping("/dojos/new") 
		public String processCreateDojo(@Valid @ModelAttribute("newDojo") Dojo newDojo, BindingResult result) {
			if(result.hasErrors()) {
				return "newDojo.jsp";
			} else {
				dojoService.createDojo(newDojo);
				return "redirect:/";
			}
		}
	
	// Process creation of new Ninja
	@PostMapping("/ninjas/new") 
		public String processCreateNinja(@Valid @ModelAttribute("newNinja") Ninja newNinja, BindingResult result, Model model) {
			if(result.hasErrors()) {
				List<Dojo> dojos= dojoService.allDojos();
				model.addAttribute("dojos", dojos);
				return "newNinja.jsp";
			} else {
				ninjaService.createNinja(newNinja);
				return "redirect:/";
			}
		}

}
