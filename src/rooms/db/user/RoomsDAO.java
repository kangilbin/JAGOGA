package rooms.db.user;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import rooms.db.user.RoomsBean;

public class RoomsDAO {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("./rooms/resource/SqlMapConfig.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (IOException e) {
			throw new RuntimeException("SqlSessionFactory instance." + e, e);
		}
	}

	public static int roomsListCount(PageBean pageBean) {
		int count = 0;
		SqlSession session = sqlSessionFactory.openSession();
		
		if (pageBean.getSearch_Param().equals("내용")) {
			count = session.selectOne("roomsListCountContents", pageBean);
		} else if (pageBean.getSearch_Param().equals("날짜")) {
			count = session.selectOne("roomsListCountDate", pageBean);
		} else {
			count = session.selectOne("roomsListCountName", pageBean);
		}
		session.close();
		return count;
	}

	public static List<RoomsBean> userRoomsList(PageBean pageBean) {
		List<RoomsBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		if (pageBean.getSearch_Param().equals("내용")) {
			list = session.selectList("userRoomsContents", pageBean);
		} else if (pageBean.getSearch_Param().equals("날짜")) {
			list = session.selectList("userRoomsDate", pageBean);
		} else {
			list = session.selectList("userRoomsName", pageBean);
		}
		session.close();
		return list;
	}

	public static RoomsBean userRoomsInfo(String rooms_nm) {
		RoomsBean rooms = null;
		SqlSession session = sqlSessionFactory.openSession();
		rooms = (RoomsBean) session.selectOne("userRoomsInfo", rooms_nm);
		session.close();
		return rooms;
	}
	
	public static List<RoomsBean> roomsNameList() {
		List<RoomsBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("roomsNameList");
		session.close();
		return list;
	}
	
	public static List<RoomsBean> indexRanmdomList(){
		List<RoomsBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("indexRanmdomList");
		session.close();
		return list;
	}
}
