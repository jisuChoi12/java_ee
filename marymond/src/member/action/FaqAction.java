package member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.FaqDTO;
import member.dao.MemberDAO;

public class FaqAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// DB
		List<FaqDTO> list = MemberDAO.getInstance().getFaq();
		
		System.out.println("faq 리스트 사이즈"+list.size());
		
		request.setAttribute("list", list);
		request.setAttribute("display", "/member/faq.jsp");
		return "/main/index.jsp";
	}
}
