package board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.db.BoardDAO;

public class ClientListAction implements Action { 
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception { 
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionID");
		
		if (id == null) {
			forward.setRedirect(true);
			forward.setPath("./LoginForm.do");
			return forward;
		}
		BoardDAO boarddao = new BoardDAO(); 
		List boardlist = new ArrayList();
	
		
		boardlist = boarddao.getClientList(id); // 리스트를 받아옴
		request.setAttribute("boardlist", boardlist);
	

	forward.setRedirect(false);
	forward.setPath("./reservation/client_list.jsp");
	return forward;
	}
}