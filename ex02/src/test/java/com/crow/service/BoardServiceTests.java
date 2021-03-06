package com.crow.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.crow.domain.BoardVO;
import com.crow.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {com.crow.config.RootConfig.class})
@Log4j
public class BoardServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		
		BoardVO board = new BoardVO();
		board.setTitle("test 작성글");
		board.setContent("Test 작성 내용");
		board.setWriter("newbie");
		
		service.register(board);
		
		log.info("생성된 게시물의 번호: " + board.getBno());
	}
	
	@Test
	public void testGetList() {
		
	//	service.getList().forEach(board -> log.info(board));
		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
	}
	
//	forEach로 board를 log.info(board)로 바꾸는 이유가 뭔지 모르겠음	
//	두 콘솔 로그를 비교해보니 forEach를 사용해야지 로그가 중복으로 찍히는걸 방지할수있음?	
/*	@Test
	public void testGetList2() {
		service.getList();
	}*/
	
	@Test
	public void testGet() {
		
		log.info(service.get(1L));
	}
	
	@Test
	public void testDelete() {
		
		//게시물 번호의 존재 여부를 확인하고 테스트 해야함. 2는 내가 방금 테스트로 삭제함
		log.info("REMOVE RESULT: " + service.remove(2L));
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO board = service.get(1L);
		
		if(board == null) {
			return;
		}
		
		board.setTitle("UPDATE TEST수정제목");
		log.info("MODIFY RESULT: " + service.modify(board));
	}
	

	
	
	
	
	

}
