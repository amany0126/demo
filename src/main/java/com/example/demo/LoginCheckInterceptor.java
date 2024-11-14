package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class LoginCheckInterceptor implements WebMvcConfigurer{


	@Autowired
	InteceptorConfig inteceptorConfig;
	
	//인터셉터 주소 세팅
		@Override
		public void addInterceptors(InterceptorRegistry registry) {
			registry.addInterceptor(inteceptorConfig).addPathPatterns("/insertPage.po");
			registry.addInterceptor(inteceptorConfig).addPathPatterns("/detail.po");
			registry.addInterceptor(inteceptorConfig).addPathPatterns("/delete.po");
			registry.addInterceptor(inteceptorConfig).addPathPatterns("/upDatePage.po");
			registry.addInterceptor(inteceptorConfig).addPathPatterns("/upDatePost.po");
			registry.addInterceptor(inteceptorConfig).addPathPatterns("/insertReply.po");
			registry.addInterceptor(inteceptorConfig).addPathPatterns("/deleteReply.po");
			registry.addInterceptor(inteceptorConfig).addPathPatterns("/UpdateReply.po");
			registry.addInterceptor(inteceptorConfig).addPathPatterns("/membership.me");
			registry.addInterceptor(inteceptorConfig).addPathPatterns("/loginPage.me");
		}

}
