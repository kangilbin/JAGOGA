package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.action.Action;
import admin.action.ActionForward;

public class AdminLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		
		forward.setRedirect(true);
		forward.setPath("./AdminLogin.me");
		return forward;
	}

}
