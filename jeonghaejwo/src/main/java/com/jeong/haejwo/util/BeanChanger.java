package com.jeong.haejwo.util;

import org.springframework.beans.BeansException;
import org.springframework.beans.MutablePropertyValues;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;

public class BeanChanger implements BeanFactoryPostProcessor{

	//https://okky.kr/article/377512
	//참조
	//그냥 bean이 property를 참조하게 한다음에 property값을 변경해줘도 괜찮을듯
	
	
	@Override
	public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
		 String[] beanNames = beanFactory.getBeanDefinitionNames();
	        
	        for(String name : beanNames) {
	 
	        	
	        	//이부분을 수정하면 될듯
	            if(name.equals("aromi")) {
	            
	                BeanDefinition aromi = beanFactory.getBeanDefinition(name);
	 
	                System.out.println("### name : " + name);
	                
	                System.out.println("### aromi : " + aromi.toString());
	                
	                System.out.println("### className : " + aromi.getBeanClassName());
	                
	                MutablePropertyValues prop = aromi.getPropertyValues();
	                
	                prop.add("age", new Integer(20));
	                
	            
	            }
	            
	        }
		
	}

	
}
