package com.web.GBG_project.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan("com.web.GBG_project")
public class WebAppConfig implements WebMvcConfigurer {
    @Bean
    public ViewResolver internalResourceViewResolver(){
    	InternalResourceViewResolver resolver=new InternalResourceViewResolver();
    	resolver.setPrefix("/WEB-INF/views/");
    	resolver.setSuffix(".jsp");
    	return resolver;
    }
    
    @Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;
	}

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
		messageSource.setBasenames("MemberMessage", "ValidationMessages");
		return messageSource;
	}
	
	@Override
	// 為了處理靜態檔案必須加入下列敘述：只要是 /css/開頭的任何請求，都轉到/WEB-INF/views/css/去尋找
	// 為了處理靜態檔案必須加入下列敘述：只要是 /image/開頭的任何請求，都轉到/WEB-INF/views/images/去尋找
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//郭
		registry.addResourceHandler("/css_member/**")
				.addResourceLocations("/WEB-INF/resource/css/");
		registry.addResourceHandler("/images_member/**")
				.addResourceLocations("/WEB-INF/resource/images/");
		registry.addResourceHandler("/js_member/**")
		.addResourceLocations("/WEB-INF/resource/js/");
		
		//朱
		registry.addResourceHandler("/css_index/**")
		.addResourceLocations("/WEB-INF/resource_index/css/");
        registry.addResourceHandler("/images_index/**")
		.addResourceLocations("/WEB-INF/resource_index/images/");
        registry.addResourceHandler("/js_index/**")
        .addResourceLocations("/WEB-INF/resource_index/js/");
        registry.addResourceHandler("/fonts/**") //同樣名稱太多，只能改成原本的
        .addResourceLocations("/WEB-INF/resource_index/fonts/");
		
        //商城
  		registry.addResourceHandler("/css_product/**")
  				.addResourceLocations("/WEB-INF/resource/css/product/");
  		registry.addResourceHandler("/images_product/**")
  				.addResourceLocations("/WEB-INF/resource/images/");
  		registry.addResourceHandler("/js_product/**")
  		.addResourceLocations("/WEB-INF/resource/js/");
	}
}
