package com.poly.config;

import java.nio.file.Path;
import java.nio.file.Paths;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
@Configuration
@EnableWebMvc
public class WebMvcConfig implements WebMvcConfigurer {

  @Bean
  public ViewResolver viewResolver() {
    final InternalResourceViewResolver bean = new InternalResourceViewResolver();
    bean.setViewClass(JstlView.class);
    bean.setPrefix("/WEB-INF/views/");
    bean.setSuffix(".jsp");
    return bean;
  }

  @Override
  public void configureViewResolvers(ViewResolverRegistry registry) {
    registry.viewResolver(viewResolver());
  }
  
  @Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		exposeDirectory("uploads", registry);
	}
  public void exposeDirectory(String dirName , ResourceHandlerRegistry registry) {
	  Path uploadDir = Paths.get(dirName);
	  String uploadPath = uploadDir.toFile().getAbsolutePath();
	  if(dirName.startsWith("../")) {
		  dirName = dirName.replace("../", "");
	  }
	  registry.addResourceHandler("/"+dirName+"/**").addResourceLocations("file:/"+uploadPath+"/");
	  
  }
}