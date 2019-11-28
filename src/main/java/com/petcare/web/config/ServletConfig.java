package com.petcare.web.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import com.petcare.web.interceptor.UserAuthInterceptor;
import com.petcare.web.interceptor.HospitalAuthInterceptor;
import com.petcare.web.interceptor.HospitalLoginInterceptor;
import com.petcare.web.interceptor.LoginIntercepter;
import com.petcare.web.interceptor.LogoutInterceptor;
import com.petcare.web.interceptor.SampleInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "package com.petcare.web.controller")
public class ServletConfig implements WebMvcConfigurer {
    
	@Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
	
	//리소스경로 정하는 설정
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }

    //인터셉터 추가하는 설정
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new SampleInterceptor());
        registry.addInterceptor(new LoginIntercepter()).addPathPatterns("/loginPro");
        registry.addInterceptor(new HospitalLoginInterceptor()).addPathPatterns("/loginPro2");
        registry.addInterceptor(new LogoutInterceptor()).addPathPatterns("/logout");
        registry.addInterceptor(new UserAuthInterceptor()).addPathPatterns("/pet/register")
        .addPathPatterns("/pet/get")
        .addPathPatterns("/pet/modify")
        .addPathPatterns("/pet/remove")
        .addPathPatterns("/pet/list")
        .addPathPatterns("/userAppointment/list")
        .addPathPatterns("/userAppointment/modify");
        registry.addInterceptor(new HospitalAuthInterceptor()).addPathPatterns("/appointment/list")
        .addPathPatterns("/appointment/modify");
    }
    
    /**
     * Configure TilesConfigurer.
     */
    @Bean
    public TilesConfigurer tilesConfigurer(){
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        tilesConfigurer.setDefinitions(new String[] {"/WEB-INF/tiles/tiles.xml"});
        tilesConfigurer.setCheckRefresh(true);
        return tilesConfigurer;
    }

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		TilesViewResolver viewResolver = new TilesViewResolver();
		registry.viewResolver(viewResolver);
	}
	
    /**
     * Configure Spring Validator.
     */
    @Bean
    public Validator validator() {
        return new LocalValidatorFactoryBean();
    }

    @Override
    public Validator getValidator() {
        return validator();
    }
}
