package com.control;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; // 객체 직렬화
	private Map<String, Object> map = new HashMap<String, Object>(); // command.properties 안에 있는 내용 꺼내기 위한 Map

	@Override
	public void init(ServletConfig config) throws ServletException {
		String propertyConfig = config.getInitParameter("propertyConfig"); // web.xml에 있는 propertyConfig(command.poperties)를 읽어 온다
		System.out.println("propertyConfig = " + propertyConfig + "\n");

		FileInputStream fin = null; // command.properties라는 환경설정 파일을 읽어오기 위한 FileInputStream
		Properties properties = new Properties(); // 외부에서 설정한 환경설정 파일을 보관하기 위한 Properties

		try {
			fin = new FileInputStream(propertyConfig); // 읽어온 파일로 생성
			properties.load(fin); // propertyConfig를 읽어서 properties에 로드 (구분자 ',')
			System.out.println("properties = " + properties);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fin.close(); // 스트림은 꼭 닫아주기
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println();

		Iterator it = properties.keySet().iterator(); // properties의 내용을 구분자 ','를 기준으로 나누어서 Set에 보관하고 (Set은 중복 안됨 같은 내용이 여러개면 하나만) Iterator로 각각의 항목을 꺼내올 수 있게한다
		while (it.hasNext()) { // it.hasNext() 현재 위치의 항목이 T/F
			String key = (String) it.next(); // it.next() 현재 위치의 항목을 꺼내주고 다음으로 이동 (=를 기준점으로 앞의 내용) -> key값
			System.out.println("key = " + key);
			
			String className = properties.getProperty(key); // key값을 이용해 properties에서 클래스 이름을 찾아온다 (=를 기준점으로 뒤의 내용)
			System.out.println("className = " + className);
			
			try {
				Class<?> classType = Class.forName(className); // className은 문자열이기 때문에 Class타입으로 변환해야한다
				Object ob = classType.newInstance(); // Object타입으로 생성
				
				System.out.println("ob = " + ob);
				
				map.put(key, ob); // map에 보관
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println();

		// 한글처리: html파일의 form태그 안에 있는 method를 얻어와서 post일 경우 UTF-8로 한글처리를 해줘야 한다
		if (request.getMethod().equals("POST")) {
			request.setCharacterEncoding("UTF-8");
		}
		
		String category = request.getServletPath(); // 들어오는 url에서 필요한 부분만 잘라서 category에 저장 ex)/member/writeForm.do
		System.out.println("category = " + category);
		
		CommandProcess commandProcess = (CommandProcess) map.get(category); // key값(category)를 이용해서 map에 있는 class를 가져와서 CommandProcess(부모)에 저장 
		System.out.println("commandProcess = " + commandProcess);
		
		String view = null;
		try {
			view = commandProcess.requestPro(request, response); // 호출 (java 파일에서 리턴값으로 준 jsp파일을 받아온다)
		} catch (Throwable e) {
			e.printStackTrace();
		}	
		
		// forward
		RequestDispatcher dispatcher = request.getRequestDispatcher(view); // 상대번지
		dispatcher.forward(request, response); // 제어권 넘기기
	}
}