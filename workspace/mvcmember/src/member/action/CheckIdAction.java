package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class CheckIdAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String id = request.getParameter("id");
		
		// DB
		boolean isExist = MemberDAO.getInstance().isExistId(id);
		
		// 응답
		if(isExist) {
			return "/member/checkIdFail.jsp";
		} else {
			return "/member/checkIdOk.jsp";
		}
	}
}
