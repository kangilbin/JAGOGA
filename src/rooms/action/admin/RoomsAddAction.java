package rooms.action.admin;

import java.io.File;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import rooms.action.Action;
import rooms.action.ActionForward;
import rooms.db.admin.RoomsBean;
import rooms.db.admin.RoomsDAO;

public class RoomsAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
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

		String realFolder = "D:\\work\\jagoga\\WebContent\\rooms\\roomsImages";
		int fileSize = 10 * 1024 * 1024;

		File fileSaveDir = new File(realFolder);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}

		try {
			MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "utf-8",
					new DefaultFileRenamePolicy());

			String name = RoomsDAO.roomsName(multi.getParameter("name").trim());

			if (name != null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('중복되는 숙소명이 있습니다!');");
				out.println("location.href='./RoomsWrite.ro';");
				out.println("</script>");
				out.close();
				return null;
			} else {
				// 파일명 저장
				Enumeration images = multi.getFileNames();
				String imagesName = "/", imageName = "";

				while (images.hasMoreElements()) {
					imageName = multi.getFilesystemName((String) images.nextElement());

					if (imageName == null) {
						continue;
					}

					if (roomsBean.getRooms_thumbnail() == null) {
						roomsBean.setRooms_thumbnail(imageName);
						imageName = "";
					} else {
						imagesName += imageName + "/";
					}
				}
				roomsBean.setRooms_nm(multi.getParameter("name").trim());
				roomsBean.setRooms_intro(multi.getParameter("intro"));
				roomsBean.setRooms_contents(multi.getParameter("contents"));
				roomsBean.setRooms_info(multi.getParameter("info"));
				roomsBean.setRooms_amt(Integer.parseInt(multi.getParameter("amt")));
				roomsBean.setRooms_pay(Integer.parseInt(multi.getParameter("pay")));
				roomsBean.setRooms_file(imagesName);
				int result = 0;

				System.out.println(roomsBean.getRooms_file());
				result = RoomsDAO.roomsInsert(roomsBean);
				if (result == 1) {
					System.out.println("insert success");
				} else {
					System.out.println("fail");
				}

				forward.setRedirect(true);
				forward.setPath("./AdminRoomsList.ro");
				return forward;
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return null;
	}
}
