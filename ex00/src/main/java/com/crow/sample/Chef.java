package com.crow.sample;
/*
 * 일반적으로 스프링에서 의존성 주입은 Chef를 클래스가 아닌 인터페이스로 설계하는 것이 좋지만,
 * 지금은 최소한의 코드만을 이용해서 의존성 주입을 테스트하기 위한것이니 클래스로 설계
 * 
 * 
 */
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Chef {

}
