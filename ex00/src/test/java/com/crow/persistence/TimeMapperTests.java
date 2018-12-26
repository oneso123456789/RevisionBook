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
		2018-12-25 testGetTime Junit�׽�Ʈ�� �����߻�
		����: spring-tx �� pom.xml�� ��Ȯ�� �־��´뵵 Libraries.Maven Dependencies�� ������
		�ذ�: user/tori1/.m2/repository ���� ����� eclipse ������ѵ� �ذ���
		������ ������ �߸� �ϴ� resository���� �������߰���
		
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
