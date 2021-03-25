package rooms.action.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rooms.action.Action;
import rooms.action.ActionForward;
import rooms.db.admin.RoomsBean;
import rooms.db.admin.RoomsDAO;

public class RoomsModifyAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		RoomsBean roomsBean = new RoomsBean();

		// 관리자 인증
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionID");

		if ((id == null) || (!id.equals("admin"))) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 접근 입니다!');");
			out.println("location.href='./';");
			out.println("</script>");
			out.close();
			return null;
		}

		roomsBean.setRooms_nm(request.getParameter("name"));
		roomsBean.setRooms_intro(request.getParameter("intro"));
		roomsBean.setRooms_contents(request.getParameter("contents"));
		roomsBean.setRooms_info(request.getParameter("info"));
		roomsBean.setRooms_amt(Integer.parseInt(request.getParameter("amt")));
		roomsBean.setRooms_pay(Integer.parseInt(request.getParameter("pay")));

		int result = 0;
		result = RoomsDAO.roomsUpdate(roomsBean);
		if (result > 0) {
			System.out.println("update success : " + result);
		} else {
			System.out.println("update fail");
		}

		forward.setRedirect(true);
		forward.setPath("./AdminRoomsList.ro");
		return forward;
	}
}
