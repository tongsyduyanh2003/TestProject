package com.poly.Model;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Account {
	@NotEmpty(message = "Username invalid")
	private String username;
	
	@NotEmpty(message = "Password invalid")
	@Size(min = 6, message = "Password must be at least 6 characters long")
	private String password;
	
	@NotEmpty(message = "Fullname invalid")
	private String fullname;
	
	@NotEmpty(message = "Email invalid")
	@Email(message = "Email invalid")
	private String email;
	
	
	private String photo;
	
	private boolean activated;
	
	private boolean admin;
	
}
