package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.db.AdminDAO;
import admin.db.MemberBean;

public class AdminJoinAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		AdminDAO memberdao = new AdminDAO();
		MemberBean member = new MemberBean();
		boolean result = false;

		member.setMember_id(request.getParameter("member_id"));
		member.setPassword(request.getParameter("password"));
		member.setMember_name(request.getParameter("member_name"));
		member.setGender(request.getParameter("gender"));
		member.setBirthyy(request.getParameter("birthyy"));
		member.setBirthmm(request.getParameterValues("birthmm")[0]);
		member.setBirthdd(request.getParameter("birthdd"));
		member.setMail(request.getParameter("mail"));
		member.setPhone(request.getParameter("phone"));
		member.setAddress(request.getParameter("address"));
//		member.setMember_reg(request.getParameter("reg"));

		result = memberdao.joinMember(member);
		if (result == false) {
			return null;
		}
		forward.setRedirect(true);
		forward.setPath("./AdminListAction.me");
		return forward;
	}
}
