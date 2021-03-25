package rooms.db.admin;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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

	public static List<RoomsBean> roomsList() {
		List<RoomsBean> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("roomsList");
		session.close();
		return list;
	}

	public static List<RoomsBean> roomsSearchList(String searchString, String selectName) {
		List<RoomsBean> list = null;
		Map<String, Object> map = new HashMap<String, Object>();
		SqlSession session = sqlSessionFactory.openSession();
		map.put("searchString", searchString);

		if (selectName.equals("contents")) {
			list = session.selectList("roomsSearchContents", map);
		} else if (selectName.equals("date")) {
			list = session.selectList("roomsSearchDate", map);
		} else {
			list = session.selectList("roomsSearchName", map);
		}
		session.close();
		return list;
	}

	public static RoomsBean roomsInfo(String rooms_nm) {
		RoomsBean rooms = null;
		SqlSession session = sqlSessionFactory.openSession();
		rooms = (RoomsBean) session.selectOne("roomsInfo", rooms_nm);
		session.close();
		return rooms;
	}

	public static String roomsName(String rooms_nm) {
		SqlSession session = sqlSessionFactory.openSession();
		rooms_nm = session.selectOne("nameCheck", rooms_nm);
		session.close();
		return rooms_nm;
	}

	public static int roomsInsert(RoomsBean rooms) {
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();
		result = session.insert("roomsInsert", rooms);
		session.commit();
		session.close();
		return result;
	}

	public static int roomsUpdate(RoomsBean rooms) {
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();
		result = session.update("roomsuUpdate", rooms);
		session.commit();
		session.close();
		return result;
	}

	public static int roomsDelete(String rooms_nm) {
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();
		result = session.delete("roomsDelete", rooms_nm);
		session.commit();
		session.close();
		return result;
	}
}
