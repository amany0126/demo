package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class DemoApplication {
	
	
	
	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
		
		System.out.println("서버 실행됨");
		
	}

	
   
	/*
	 * @Bean public SqlSessionFactory sqlSessionFactory(DataSource dataSource)
	 * throws Exception { SqlSessionFactoryBean sessionFactory = new
	 * SqlSessionFactoryBean(); sessionFactory.setDataSource(dataSource);
	 * 
	 * Resource[] res = new
	 * PathMatchingResourcePatternResolver().getResources("classpath:/mapper/*.xml")
	 * ; sessionFactory.setMapperLocations(res);
	 * 
	 * return sessionFactory.getObject(); }
	 */
}
