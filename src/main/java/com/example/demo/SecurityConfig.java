package com.example.demo;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	 // SpringSecurity 설정 관련 소스코드
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .cors().disable() // cors 방지
                .csrf().disable() // csrf 방지
                .formLogin().disable() // 기본 로그인 창이 뜨지 않도록 설정
                .headers().frameOptions().disable();
    }
    
    @Bean
	public BCryptPasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
	}

}
