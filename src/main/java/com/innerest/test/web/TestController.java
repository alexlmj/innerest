package com.innerest.test.web;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 1. Json을 사용하기 위해서 pom.xml에 jackson-databind 의존성을 추가한다.
 * 2. 사용되는 객체는 getter와 setter 정의해야 한다.
 * <문제> 필요없는 파라미터도 응답으로 가게된다. 어떻게 처리해야 될까? 
 *  해결방법1. primitive는 보통 0으로.. Object는 null로 
 *  해결방법2. 필요한 파라미터만 가지는 json을 만들어 보낸다. map으로 처리해야 되나?
 */
//@Controller
@RequestMapping("/test")
public class TestController {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	/*메인*/
	@ResponseBody
	@RequestMapping(value = "/1", method = RequestMethod.GET)
	public EmptyVO jsonTest1() {
		
		return new EmptyVO();
	}
	
	@ResponseBody
	@RequestMapping(value = "/2", method = RequestMethod.GET)
	public HavingSomeDefaultValueVO jsonTest2() {
		HavingSomeDefaultValueVO e = new HavingSomeDefaultValueVO();
		User user = new User(1,"user1","1234");
		e.setUser(user);
		
		return e;
	}
	
	@ResponseBody
	@RequestMapping(value = "/3", method = RequestMethod.GET)
	public HavingAllDefaultValueVO jsonTest3() {
		return new HavingAllDefaultValueVO();
	}
	
	//필요한 파라미터만 보내보자. map에 필요한 데이터만 넣어서 보내 처리한다.
	@ResponseBody
	@RequestMapping(value = "/4", method = RequestMethod.GET)
	public HashMap<String, Object> jsonTest4() {
		
		HashMap<String, Object> map = new HashMap();
		HavingSomeDefaultValueVO vo = new HavingSomeDefaultValueVO();
		map.put("testInt", vo.getTestInt());
		map.put("testFloatObject", vo.getTestFloatObject());
		map.put("testBoolean", vo.isTestBoolean());
		map.put("name", vo.getName());
		
		return map;
	}
	
	private class User {
		private int num;
		private String id;
		private String pw;
		
		public User(){}
		public User(int num, String id, String pw) {
			this.num = num; this.id=id; this.pw=pw;
		}
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPw() {
			return pw;
		}
		public void setPw(String pw) {
			this.pw = pw;
		}
	}
	
	private class EmptyVO {
		private User user;
		private int testInt;
		private Integer testIntObject;
		private float testFloat;
		private Float testFloatObject;
		private boolean testBoolean;
		private Boolean testBooleanObject;
		private String name;
		
		public User getUser() {
			return user;
		}
		public void setUser(User user) {
			this.user = user;
		}
		public int getTestInt() {
			return testInt;
		}
		public void setTestInt(int testInt) {
			this.testInt = testInt;
		}
		public Integer getTestIntObject() {
			return testIntObject;
		}
		public void setTestIntObject(Integer testIntObject) {
			this.testIntObject = testIntObject;
		}
		public float getTestFloat() {
			return testFloat;
		}
		public void setTestFloat(float testFloat) {
			this.testFloat = testFloat;
		}
		public Float getTestFloatObject() {
			return testFloatObject;
		}
		public void setTestFloatObject(Float testFloatObject) {
			this.testFloatObject = testFloatObject;
		}
		public boolean isTestBoolean() {
			return testBoolean;
		}
		public void setTestBoolean(boolean testBoolean) {
			this.testBoolean = testBoolean;
		}
		public Boolean getTestBooleanObject() {
			return testBooleanObject;
		}
		public void setTestBooleanObject(Boolean testBooleanObject) {
			this.testBooleanObject = testBooleanObject;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
	}
	
	private class HavingSomeDefaultValueVO {
		private User user;
		private int testInt=1;
		private Integer testIntObject;
		private float testFloat;
		private Float testFloatObject=new Float(3.3);
		private boolean testBoolean = new Boolean(true);
		private Boolean testBooleanObject;
		private String name = "aa";
		
		public User getUser() {
			return user;
		}
		public void setUser(User user) {
			this.user = user;
		}
		public int getTestInt() {
			return testInt;
		}
		public void setTestInt(int testInt) {
			this.testInt = testInt;
		}
		public Integer getTestIntObject() {
			return testIntObject;
		}
		public void setTestIntObject(Integer testIntObject) {
			this.testIntObject = testIntObject;
		}
		public float getTestFloat() {
			return testFloat;
		}
		public void setTestFloat(float testFloat) {
			this.testFloat = testFloat;
		}
		public Float getTestFloatObject() {
			return testFloatObject;
		}
		public void setTestFloatObject(Float testFloatObject) {
			this.testFloatObject = testFloatObject;
		}
		public boolean isTestBoolean() {
			return testBoolean;
		}
		public void setTestBoolean(boolean testBoolean) {
			this.testBoolean = testBoolean;
		}
		public Boolean getTestBooleanObject() {
			return testBooleanObject;
		}
		public void setTestBooleanObject(Boolean testBooleanObject) {
			this.testBooleanObject = testBooleanObject;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
	}
	
	private class HavingAllDefaultValueVO {
		private int testInt=1;
		private Integer testIntObject=2;
		private float testFloat=3;
		private Float testFloatObject=new Float(4);
		private boolean testBoolean = true;
		private Boolean testBooleanObject = false;
		private String name ="aa";
		public int getTestInt() {
			return testInt;
		}
		public void setTestInt(int testInt) {
			this.testInt = testInt;
		}
		public Integer getTestIntObject() {
			return testIntObject;
		}
		public void setTestIntObject(Integer testIntObject) {
			this.testIntObject = testIntObject;
		}
		public float getTestFloat() {
			return testFloat;
		}
		public void setTestFloat(float testFloat) {
			this.testFloat = testFloat;
		}
		public Float getTestFloatObject() {
			return testFloatObject;
		}
		public void setTestFloatObject(Float testFloatObject) {
			this.testFloatObject = testFloatObject;
		}
		public boolean isTestBoolean() {
			return testBoolean;
		}
		public void setTestBoolean(boolean testBoolean) {
			this.testBoolean = testBoolean;
		}
		public Boolean getTestBooleanObject() {
			return testBooleanObject;
		}
		public void setTestBooleanObject(Boolean testBooleanObject) {
			this.testBooleanObject = testBooleanObject;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
	}
}
