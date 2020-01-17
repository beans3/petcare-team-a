//
//  package com.petcare.web.config; import
//  org.springframework.context.annotation.Bean; import
//  org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder; import
//  org.springframework.security.config.annotation.web.builders.HttpSecurity;
//  import org.springframework.security.config.annotation.web.configuration.
//  EnableWebSecurity; import
//  org.springframework.security.config.annotation.web.configuration.
//  WebSecurityConfigurerAdapter;
//  
//  @EnableWebSecurity public class WebSecurityConfig extends
//  WebSecurityConfigurerAdapter {
//  
//  protected void configure(HttpSecurity http) throws Exception {
//	  http
//	  .authorizeRequests() 
//	  .anyRequest()
//	  .authenticated() 
//	  .and() 
//	  .formLogin()
//	  .loginPage("/login") 
//	  .permitAll(); 
//	  }
//  
//  @Bean public BCryptPasswordEncoder passwordEncoder(){ 
//	  BCryptPasswordEncoder
//	  bCryptPasswordEncoder = new BCryptPasswordEncoder(); 
//	  return bCryptPasswordEncoder; 
//	  }
//  
//  }
 