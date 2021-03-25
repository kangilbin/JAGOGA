package rooms.action.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rooms.action.Action;
import rooms.action.ActionForward;
import rooms.db.user.PageBean;
import rooms.db.user.RoomsDAO;

public class UserRoomsListAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionID");

		System.out.println("숙소 보기 id 값 : " + id);

		List roomsList = new ArrayList();
		PageBean pageBean = new PageBean();
		int page = 1;
		int limit = 6;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startRow = (page - 1) * limit + 1; // 읽기 시작할 row 번호
		int endRow = startRow + limit - 1; // 읽을 마지막 row 번호

		pageBean.setStartrow(startRow);
		pageBean.setEndrow(endRow);

		// 검색 기능
		String searchName = "";
		String search_Param = "검색";
		request.setAttribute("search_param", search_Param);

		if (request.getParameter("searchName") != null) {
			searchName = request.getParameter("searchName").trim();
			search_Param = request.getParameter("search_param");
			System.out.println("검색 문자열 :" + searchName);
			System.out.println("선택 메뉴 :" + search_Param);
			request.setAttribute("searchName", searchName);
			request.setAttribute("search_param", search_Param);
		}

		pageBean.setSearchName(searchName);
		pageBean.setSearch_Param(search_Param);

		int listCount = RoomsDAO.roomsListCount(pageBean);

		roomsList = RoomsDAO.userRoomsList(pageBean);

		// 총 페이지 수
		int maxPage = (int) ((double) listCount / limit + 0.95);
		// 현재 페이지에 보여줄 시작 페이지 수
		int startPage = (((int) ((double) page / limit + 0.9)) - 1) * limit + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수
		int endPage = startPage + limit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}

		request.setAttribute("page", page); // 현재 페이지 수
		request.setAttribute("maxPage", maxPage); // 최대 페이지 수
		request.setAttribute("startPage", startPage); // 현재 페이지에 표시할 첫 페이지
		request.setAttribute("endPage", endPage); // 현재 페이지에 표시할 끝 페이지
		request.setAttribute("listCount", listCount); // 글 수
		request.setAttribute("roomsList", roomsList); // 한 페이지에 출력할 리스트

		System.out.println("| page :" + page + " | maxpage :" + maxPage + " | startpage :" + startPage + " | endpage :"
				+ endPage + " | listcount :" + listCount + " | roomsList : " + roomsList.size() + " | ");

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./rooms/roomsUser/UserRoomsList.jsp");
		return forward;
	}
}
