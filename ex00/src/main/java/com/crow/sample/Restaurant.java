package com.crow.sample;
/*
 * Restaurant Ŭ������ Chef�� ���Թ޷ΰ� ����.
 * �̶� Lombok�� setter�� �����ϴ� ��ɰ� ������, toString() ���� �ڵ����� �����ϵ���
 * @Data ������̼��� �̿�
 * 
 * @Component ������̼��� ���������� �ش� Ŭ������ ���������� �����ؾ� �ϴ� ������� ǥ��
 * @Setter�� �ڵ����� setChef()�� ������ �� ������
 * 
 * @Setter���� ���� onMethod �Ӽ��� �����Ǵ� setChef()�� @Autowired ������̼��� �߰��ϴٷ� ��
 * Lombok���� ������ Ŭ������ ���� ������ ��Ŭ������ ���ؼ� Ȯ�ΰ���
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
