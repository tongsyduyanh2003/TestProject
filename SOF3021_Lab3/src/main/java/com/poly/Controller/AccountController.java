package com.poly.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.poly.FileUploadUtil;
import com.poly.Model.Account;

@Controller
@RequestMapping("account")
public class AccountController {
	public static List<Account> lsAccount = new ArrayList<Account>();
	public int findByUsername(String username) {
		for (int i = 0; i < lsAccount.size(); i++) {
			Account c = lsAccount.get(i);
			if(c.getUsername().equals(username)) {
				return i;
			}
		}
		return -1;
	}
	@GetMapping("/register")
	public String showForm(Model model) {
		model.addAttribute("ACCOUNT", new Account());
		return "register-form";
	}
	
	@PostMapping("/SaveOrUpdate")
		public String saveOrUpdate(@Validated @ModelAttribute("ACCOUNT") Account acc,
				Errors result
				, Model model,
								   @RequestParam("image")MultipartFile multipartFile ) throws IOException {
			if(result.hasErrors()) {
				if(multipartFile.isEmpty()) {
					model.addAttribute("ERROR_PHOTO", "Photo not invalid");
				}
				return "register-form";
			}
		
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
			String uploadDir = "uploads/";
			FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
			
			int position = findByUsername(acc.getUsername());
			if(position<0) {
				//ko tim thay
				acc.setPhoto(fileName);
				lsAccount.add(acc);
				System.out.println("Insert successfully " + acc.getUsername());
				model.addAttribute("mess", "Insert successfully");
			}else {
				//update
				acc.setPhoto(fileName);
				lsAccount.set(position, acc);
				model.addAttribute("mess", "Update successfully");
			}
			model.addAttribute("ACCOUNT", new Account());
			return "register-form";
			
	}
	
	@GetMapping("/views")
	public String viewAccount(Model model) {
		model.addAttribute("ACCOUNTS", lsAccount);
		return "view-acc";
	}
	
	@GetMapping(value = "views", params = "btnDel")
	public String delAccount(@RequestParam("username")String username ,Model model) {
		int position = findByUsername(username);
		if(position>=0) {
			lsAccount.remove(position);
			
		}
		return "redirect:/account/views";
	}
	
	@GetMapping("register/{username}")
	public String edit(@PathVariable("username")String username, Model model) {
		int position = findByUsername(username);
		if(position<0) {
			//ko tim thay
			model.addAttribute("ACCOUNT", new Account());
		}else {
			model.addAttribute("ACCOUNT", lsAccount.get(position));
		}
		return "register-form";
	}
}
