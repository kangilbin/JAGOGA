package admin.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.print("member");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/AdminLogin.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/loginForm.jsp");
		} else if (command.equals("/AdminJoin.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/member_join.jsp");
		} else if (command.equals("/Adminlist.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/admin_list.jsp");
		} else if (command.equals("/AdminLoginAction.me")) {
			action = new AdminLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminLogoutAction.me")) {
			action = new AdminLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
//		} else if (command.equals("/MemberDetailAction.me")) {
//			action = new MemberDetailAction();
//			try {
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
		} else if (command.equals("/AdminJoinAction.me")) {
			action = new AdminJoinAction();
			try {
			forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminListAction.me")) {
			action = new AdminListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminViewAction.me")) {
			action = new AdminViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminModifyAction.me")) {
			action = new AdminModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}		
		} else if (command.equals("/AdminDeleteAction.me")) {
			action = new AdminDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
