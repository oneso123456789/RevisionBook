package com.crow.sample;
/*
 * Restaurant 클래스는 Chef를 주입받로고 설계.
 * 이때 Lombok의 setter를 생성하는 기능과 생성자, toString() 등을 자동으로 생성하도록
 * @Data 어노테이션을 이용
 * 
 * @Component 어노테이션은 스프링에게 해당 클래스가 스프링에서 관리해야 하는 대상임을 표시
 * @Setter는 자동으로 setChef()를 컴파일 시 생성함
 * 
 * @Setter에서 사용된 onMethod 속성은 생성되는 setChef()에 @Autowired 어노테이션을 추가하다록 함
 * Lombok으로 생성된 클래스에 대한 정보는 이클립스를 통해서 확인가능
 * */
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Setter;

@Component
@Data
public class Restaurant {

	@Setter(onMethod_ =  @Autowired)
	private Chef chef;
}
