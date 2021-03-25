package review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.user.action.*;
import review.admin.action.*;
/**
 * Servlet implementation class BoardFrontController
 */
@WebServlet("/ReviewFrontController")
public class ReviewFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
		protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			
			String RequestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = RequestURI.substring(contextPath.length());
			ActionForward forward = null;
			Action action = null;
			System.out.println(RequestURI);
			System.out.println(contextPath);
			System.out.println(command);
			
			if(command.equals("/UserReviewList.re")) {
				action = new UserReviewListAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) { e.printStackTrace(); }
			} else if(command.equals("/UserReviewWrite.re")) {
				action = new UserReviewWriteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) { e.printStackTrace(); }
			} else if(command.equals("/UserModifyList.re")) {
				action = new UserModifyListAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) { e.printStackTrace(); }
			} else if(command.equals("/UserDelete.re")) {
				action = new UserDeleteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) { e.printStackTrace(); }
			} else if(command.equals("/UserModify.re")) {
				action = new UserModifyAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) { e.printStackTrace(); }
			} else if(command.equals("/UserModifyDetail.re")) {
				action = new UserModifyDetailAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) { e.printStackTrace(); }
			} else if(command.equals("/AdminDelete.re")) {
				action = new AdminDeleteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) { e.printStackTrace(); }
			} else if(command.equals("/AdminDeleteList.re")) {
				action = new AdminDeleteListAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) { e.printStackTrace(); }
			} else if(command.equals("/UserReviewWriteBefore.re")) {
				action = new UserReviewWriteBeforeAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) { e.printStackTrace(); }
			} 
			
			if (forward != null) {
				if(forward.isRedirect()) {
					response.sendRedirect(forward.getPath());
				} else {
					RequestDispatcher dispatcher = 
							request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}
		}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

}
