package review.user.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import review.db.ReviewBean;
import review.db.ReviewDAO;
import review.*;

public class UserReviewWriteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession sesObj = request.getSession();
		ActionForward forward = new ActionForward();
		ReviewBean reviewBean = new ReviewBean();
		ReviewDAO reviewDao = new ReviewDAO();
		
		request.setCharacterEncoding("UTF-8");
		
		String realFolder = "D:\\work\\jagoga\\WebContent\\reviewUpload";
		int fileSize = 5 * 1024 * 1024;
		
		String fileRealName = null;

		File fileSaveDir = new File(realFolder);
		if (!fileSaveDir.exists())
			fileSaveDir.mkdir();

		try {
			MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			Enumeration images = multi.getFileNames();
			String imagesName = "", imageName = "";
			while (images.hasMoreElements()) {
				String parameter = (String) images.nextElement();
				fileRealName = multi.getFilesystemName(parameter);
				if (fileRealName == null) {
					continue;
				}
				imagesName += fileRealName+",";			
			}
			
			System.out.println(imagesName);
			
			reviewBean.setMember_id((String) sesObj.getAttribute("sessionID"));
			reviewBean.setRooms_nm(multi.getParameter("rooms_nm"));
			reviewBean.setReview_star_tt(Integer.parseInt(multi.getParameter("start_tt").trim()));
			reviewBean.setReview_content(multi.getParameter("review_content"));
			if (multi.getFilesystemName((String) multi.getFileNames().nextElement()) != null) {
				reviewBean.setReview_file(imagesName); 
				reviewDao.reviewInsert(reviewBean);
				forward.setRedirect(false);
				forward.setPath("./review/review_thank.jsp");
				return forward;
			}
			reviewDao.reviewInsert2(reviewBean);
			forward.setRedirect(false);
			forward.setPath("./review/review_thank.jsp");
			return forward;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
}
