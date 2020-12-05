package com.sooltoryteller.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BbstControllerTests {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testGetBbstList() throws Exception {
		log.info(
			mockMvc.perform(MockMvcRequestBuilders.get("/cheers/list")
			.param("pageNum", "1")
			.param("amount", "9")
			.param("type", "T")
			.param("keyword", "1"))
			.andReturn()
			.getModelAndView()
			.getModelMap());
	}
	
	@Test
	public void testRegisterBbst() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/cheers/register")
			.param("memberId", "20")
			.param("title", "컨트롤러테스트")
			.param("img", "컨트롤러테스트")
			.param("cn", "컨트롤러테스트")
			).andReturn().getModelAndView().getViewName();
		
		log.info("========== RESULTPAGE: " + resultPage + " ==========");
	}
	
	@Test
	public void testGetBbst() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders
			.get("/cheers/get")
			.param("bbstId", "11"))
			.andReturn()
			.getModelAndView().getModelMap());
	}
	
	@Test
	public void testModifyBbst() throws Exception {
		String resultPage = mockMvc
			.perform(MockMvcRequestBuilders.post("/cheers/modify")
				.param("bbstId", "11")
				.param("title", "컨트롤러테스트다새꺄")
				.param("img", "컨트롤러테스트다새꺄")
				.param("cn", "컨트롤러테스트다새꺄")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	@Test
	public void testRemoveBbst() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/cheers/remove")
			.param("bbstId", "11")
			).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
}
