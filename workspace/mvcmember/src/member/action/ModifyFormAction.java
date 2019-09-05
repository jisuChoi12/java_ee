package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class ModifyFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 세션
		HttpSession session = request.getSession();
		
		// 데이터
		String id = (String)session.getAttribute("memId");
		
		// DB
		MemberDTO memberDTO = MemberDAO.getInstance().getMember(id);
		session.setAttribute("memDTO", memberDTO);
		
		// 응답
		return "/member/modifyForm.jsp";
	}

}
