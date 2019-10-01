package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MyPageFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 세션 데이터
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");

		// DB
		MemberDTO memberDTO = MemberDAO.getInstance().getMemberInfo(id);

		// 응답
		request.setAttribute("memDTO", memberDTO);
		request.setAttribute("display", "/member/mypage.jsp");
		return "/main/index.jsp";
	}

}
