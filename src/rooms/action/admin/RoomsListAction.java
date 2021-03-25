package rooms.action.admin;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rooms.action.Action;
import rooms.action.ActionForward;
import rooms.db.admin.RoomsBean;
import rooms.db.admin.RoomsDAO;

public class RoomsListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		List<RoomsBean> roomsList = null;

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

		// 검색기능
		String searchName = "";
		String search_Param = "all";

		if (request.getParameter("searchName") != null) {
			searchName = request.getParameter("searchName").trim();
			search_Param = request.getParameter("search_param");
		}

		roomsList = RoomsDAO.roomsSearchList(searchName, search_Param);
		request.setAttribute("roomsList", roomsList);

		forward.setRedirect(false);
		forward.setPath("./rooms/roomsAdmin/AdminRoomsList.jsp");
		return forward;
	}
}
