package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class JoinAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String name = request.getParameter("name");
		String id= request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		String birthDay = request.getParameter("birthDay");
		
		System.out.println(name+" "+id+" "+pwd+" "+email1+" "+email2+" "+birthYear+" "+birthMonth+" "+birthDay);

		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setName(name);
		memberDTO.setId(id);
		memberDTO.setPwd(pwd);
		memberDTO.setEmail1(email1);
		memberDTO.setEmail2(email2);
		memberDTO.setBirthYear(birthYear);
		memberDTO.setBirthMonth(birthMonth);
		memberDTO.setBirthDay(birthDay);
		
		// DB
		int cnt = MemberDAO.getInstance().insert(memberDTO); 
		
		// 응답
		request.setAttribute("joinResult", cnt);
		return "/member/joinResult.jsp";
		
	}
}
