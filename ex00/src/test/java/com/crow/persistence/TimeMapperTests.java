package com.crow.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.crow.mapper.TimeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TimeMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private TimeMapper timeMapper;
	
	@Test
	public void testGetTime() {
		
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getTime());
		/*
		2018-12-25 testGetTime Junit테스트중 오류발생
		이유: spring-tx 가 pom.xml에 정확히 있었는대도 Libraries.Maven Dependencies에 누락됨
		해결: user/tori1/.m2/repository 폴더 지우고 eclipse 재실행한뒤 해결함
		앞으로 오류가 뜨면 일단 resository부터 지워봐야겠음
		
		Caused by: org.springframework.beans.factory.BeanCreationException: 
		Error creating bean with name 'UserDao' defined in ServletContext resource 
		[/WEB-INF/spring/mybatis-context.xml]: Initialization of bean failed; 
		nested exception is java.lang.NoClassDefFoundError: 
		org/springframework/dao/support/PersistenceExceptionTranslator

	*/
	}

	@Test
	public void testGetTime2() {
		
		log.info("getTime2");
		log.info(timeMapper.getTime2());
	} 

}
