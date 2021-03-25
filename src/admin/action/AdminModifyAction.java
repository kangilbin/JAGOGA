package admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.db.MemberBean;
import admin.db.AdminDAO;

public class AdminModifyAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		AdminDAO dao = new AdminDAO();
		MemberBean member = new MemberBean();

		String name = request.getParameter("member_id");
		
		member.setMember_id(request.getParameter("member_id"));
		member.setPassword(request.getParameter("password"));
		member.setMail(request.getParameter("mail"));
		member.setPhone(request.getParameter("phone"));
		member.setAddress(request.getParameter("address"));

		System.out.println(name);
		System.out.println(member.getMember_id());
		
		int result = dao.updateMember(member);

		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('Modify Success');");
			out.println("location.href='./AdminListAction.me'</script>");
		} else {
			
			out.println("<script>alert('Modify Fail');");
			out.println("location.href='./AdminListAction.me'</script>");
		}
		return null;
	}
}
