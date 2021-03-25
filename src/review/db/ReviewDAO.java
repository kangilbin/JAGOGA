package review.db;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ReviewDAO implements ReviewInterface{
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("/review/db/SqlMapConfig.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (IOException e) {
			throw new RuntimeException("SqlSessionFactory instance."+e,e);
		}
	}
	//카운트
	public int reviewAllCount(){
		int count = 0;
		SqlSession session = sqlSessionFactory.openSession();
		count = session.selectOne("reviewAllCount"); 
		session.close();
		return count;
	}
	
	//전부출력
	public List<ReviewBean>	listAll(){
		List<ReviewBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("listAll"); 
		session.close();
		return list;
	}
	
	//최근 리뷰
	public List<ReviewBean> listRecent(ReviewBean reviewBean){
		List<ReviewBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("listRecent",reviewBean); 
		session.close();
		return list;
	}
	
	//별점 평점 높은순
	public List<ReviewBean> listStarde(ReviewBean reviewBean){
		List<ReviewBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("listStarde",reviewBean);
		session.close();
		return list;
	}
	
	//별점 평점 낮은순
	public List<ReviewBean> listStarac(ReviewBean reviewBean){
		List<ReviewBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("listStarac",reviewBean); 
		session.close();
		return list;
	}

	//유저별 리스트내용
	public List<ReviewBean> listUser(String member_id){
		List<ReviewBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("listUser",member_id); 
		session.close();
		return list;
	}
	
	//리뷰데이터리스트
	public List<ReviewBean> selReviewID(int review_id) {
		List<ReviewBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("selReviewID",review_id);
		session.close();
		return list;
	}
	
	//BestReview 3개만
	public List<ReviewBean> listBest(String rooms_nm){
		List<ReviewBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("listBest",rooms_nm);
		session.close();
		return list;
	}
	
	public List<ReviewBean> listDel(int page, int limit){
		int startrow = (page - 1) * 10 + 1; //읽기 시작할 row 번호
		int endrow = startrow + limit - 1; //읽을 마지막 row번호
		Map map = new HashMap();
		map.put( "startrow", startrow );
		map.put( "endrow", endrow );
		List<ReviewBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("listDel", map);
		session.close();
		return list;
	}
	
	//modifyListAction listRecent값 
	public List<ReviewBean> listUser2(int page, int limit, String member_id){
		int startrow = (page - 1) * 10 + 1; //읽기 시작할 row 번호
		int endrow = startrow + limit - 1; //읽을 마지막 row번호
		System.out.println("/////////////////");
		System.out.println(page);
		System.out.println(limit);
		System.out.println(startrow);
		System.out.println(endrow);
		Map map = new HashMap();
		map.put( "startrow", startrow );
		map.put( "endrow", endrow );
		map.put("member_id",member_id);
		List<ReviewBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("listUser2", map);
		session.close();
		return list;
	}
	
	//modify 유저 카운트
	public int userCount(String member_id) {
		int count = 0;
		SqlSession session = sqlSessionFactory.openSession();
		count = session.selectOne("userCount", member_id); 
		session.close();
		return count;
	}
	
	//리뷰데이터 넣기
	public void reviewInsert(ReviewBean reviewBean) {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("insert",reviewBean);
		session.commit();
		session.close();
	}
	
	//사진없이 리뷰데이터
	public void reviewInsert2(ReviewBean reviewBean) {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("insert2",reviewBean);
		session.commit();
		session.close();
	}
	
	//전체 후기 작성
	public int reviewCount(ReviewBean reviewBean) {
		int count = 0;
		SqlSession session = sqlSessionFactory.openSession();
		count = session.selectOne("reviewCount", reviewBean); 
		session.close();
		return count;
	}
	
	//별점 평점
	public float startAvg(ReviewBean reviewBean) {
		float avg = 0;
		SqlSession session = sqlSessionFactory.openSession();
		avg = session.selectOne("startAvg", reviewBean); 
		session.close();
		return avg;
	}
	
	//review_id 삭제
	public void delReview(int review_id) {
		SqlSession session = sqlSessionFactory.openSession();
		session.delete("delReview",review_id); session.commit(); 
		session.close();
	}
	
	//review update1
	public void reviewUpdate(ReviewBean reviewBean) {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("reviewUpdate",reviewBean); session.commit();
		session.close();
	}
	
	//review update2
	public void reviewUpdate2(ReviewBean reviewBean) {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("reviewUpdate2",reviewBean); session.commit();
		session.close();	
	}
}
