package board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	DataSource ds; 		Connection con;
	PreparedStatement pstmt; ResultSet rs;
	
	public BoardDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			
		} catch(Exception ex) {
			System.out.println("DB 연결 실패 : " + ex); return;
		}
	}
	
	//글의 개수 구하기
	public int getListCount() {
		int x = 0;
		try {
			con = ds.getConnection();
			System.out.println("getConnection");
			pstmt = con.prepareStatement("select count(*) from reservation");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount 에러:" + ex);
		} finally {
			if(rs != null)
				try { rs.close();} catch (SQLException ex) {}
			if(pstmt != null)
				try { pstmt.close();} catch (SQLException ex) {}
			if(con != null)
				try { con.close();} catch (SQLException ex) {}
		}
		return x;
	}
	
	//글 목록 보기
	public  List getBoardList(int page, int limit) {
		   List list = new ArrayList();
		   
		int startrow = (page - 1) * 10 + 1 ; //읽기 시작할 row 번호
		int endrow = startrow + limit - 1; //읽을 마지가 row 번호
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from(select rownum rnum, rs.res_ord, rs.rooms_type, rs.id, rs.MEMBER_NAME, rs.startday, rs.endday, rs.rooms_pay from (select rownum, res.res_ord, res.rooms_type, res.id, m.MEMBER_NAME, res.startday, res.endday, r.rooms_pay from member m, reservation res, rooms r where m.MEMBER_ID = res.id and res.rooms_type = r.rooms_nm order by res.res_ord desc, startday desc)rs) where  rnum>=? and rnum<=?");
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				 BoardBean board = new BoardBean();
		            board.setRes_ord(rs.getInt("res_ord"));
		            board.setRooms_type(rs.getString("rooms_type"));
		            board.setId(rs.getString("id"));
		            board.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
		            board.setStartday(rs.getDate("startday"));
		            board.setEndday(rs.getDate("endday"));
		            board.setRooms_pay(rs.getInt("rooms_pay"));
		            list.add(board);
		}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
		} finally {
			if(rs != null)
				try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null)
				try { pstmt.close(); } catch(SQLException ex) {}
			if(con != null)
				try { con.close(); } catch(SQLException ex) {}
		}
		return null;
	}
	//검색 리스트
	public  List getSearchList(String sc, String st, int page, int limit) {
		List list = new ArrayList();
		
		int startrow = (page - 1) * 10 + 1 ; //읽기 시작할 row 번호
		int endrow = startrow + limit - 1; //읽을 마지가 row 번호
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from(select rownum rnum, rs.res_ord, rs.rooms_type, rs.id, rs.MEMBER_NAME, rs.startday, rs.endday, rs.rooms_pay from (select rownum, res.res_ord, res.rooms_type, res.id, m.MEMBER_NAME, res.startday, res.endday, r.rooms_pay from member m, reservation res, rooms r where m.MEMBER_ID = res.id and res.rooms_type = r.rooms_nm order by res.res_ord desc, startday desc)rs) where "+ sc +" like ? and rnum >= ? and rnum<=?");
			pstmt.setString(1,"%"+ st + "%");
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean board = new BoardBean();
				board.setRes_ord(rs.getInt("res_ord"));
				board.setRooms_type(rs.getString("rooms_type"));
				board.setId(rs.getString("id"));
				board.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
				board.setStartday(rs.getDate("startday"));
				board.setEndday(rs.getDate("endday"));
				board.setRooms_pay(rs.getInt("rooms_pay"));
				list.add(board);
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getSearchList 에러 : " + ex);
		} finally {
			if(rs != null)
				try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null)
				try { pstmt.close(); } catch(SQLException ex) {}
			if(con != null)
				try { con.close(); } catch(SQLException ex) {}
		}
		return null;
	}
	//글 내용 보기
	public BoardBean getDetail(int num) throws Exception {
		BoardBean board = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from  reservation"
					+ " where res_ord =? ");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			 if (rs.next()) {
		            board = new BoardBean();
		            board.setRes_ord(rs.getInt("Res_ord"));
		            board.setRooms_type(rs.getString("rooms_type"));
		            board.setId(rs.getString("setId"));
		            board.setStartday(rs.getDate("startday"));
		            board.setEndday(rs.getDate("endday"));
		         }

			return board;
		} catch (Exception ex) {
			 System.out.println("getDetail 에러 : " + ex);
		 } finally {
	         if (rs != null)
	            try { rs.close(); } catch (SQLException ex) {}
	         if (pstmt != null)
	            try { pstmt.close(); } catch (SQLException ex) {}
	         if (con != null)
	            try { con.close(); } catch (SQLException ex) {}
	      }
	      return null;
	}
	//회원 리스트 보기
	public  List getClientList(String id) {
		   String sql = "select res.res_ord, res.rooms_type, res.startday, res.endday, r.rooms_pay from reservation res, rooms r where res.rooms_type = r.rooms_nm and res.id= ? "
		   		+ "order by res_ord desc";   
		   List list = new ArrayList();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				 BoardBean board = new BoardBean();
				 	board.setRes_ord(rs.getInt("res_ord"));
		            board.setRooms_type(rs.getString("rooms_type"));
		            board.setStartday(rs.getDate("startday"));
		            board.setEndday(rs.getDate("endday"));
		            board.setRooms_pay(rs.getInt("rooms_pay"));
		            list.add(board);
		}
			return list;
		} catch (Exception ex) {
			System.out.println("getClientList 에러 : " + ex);
		} finally {
			if(rs != null)
				try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null)
				try { pstmt.close(); } catch(SQLException ex) {}
			if(con != null)
				try { con.close(); } catch(SQLException ex) {}
		}
		return null;
	}

		public boolean boardInsert(BoardBean board) {
			int num = 0;  String sql = "";
			int result = 0;
			try {
		         con = ds.getConnection();
		         pstmt = con.prepareStatement("select max(res_ord) from reservation");
		         rs = pstmt.executeQuery();
		         if (rs.next()) num = rs.getInt(1) + 1;
		         else num = 1;

				
				sql = "insert into  reservation (res_ord, rooms_type, id,";
				sql += "startday, endday)" 
					+ " values(?,?,?,?,?)";
						pstmt = con.prepareStatement(sql); 
						pstmt.setInt(1, num); 
						pstmt.setString(2, board.getRooms_type()); 
						pstmt.setString(3, board.getId()); 
						pstmt.setDate(4, board.getStartday()); 
						pstmt.setDate(5, board.getEndday()); 
						
						result = pstmt.executeUpdate(); 
						if (result == 0) return false;
						return true; 
					} catch (Exception ex) {
						System.out.println("boardInsert 에러 : " + ex);
					} finally {
						if(rs != null)
							try { rs.close(); } catch(SQLException ex) {}
						if(pstmt != null)
							try { pstmt.close(); } catch(SQLException ex) {}
						if(con != null)
							try { con.close(); } catch(SQLException ex) {}
					}
					return false;
				}

		public boolean boardModify (BoardBean modifyboard) throws Exception { 
			String sql = "update reservation set rooms_type=?, startday=?,endday=?"
					+ " where res_ord=?";
		 try {
		con = ds.getConnection(); 
		pstmt = con.prepareStatement(sql); 
		pstmt.setString(1, modifyboard.getRooms_type()); 
		pstmt.setDate(2, modifyboard.getStartday()); 
		pstmt.setDate(3, modifyboard.getEndday()); 
		pstmt.setInt(4, modifyboard.getRes_ord()); 
		pstmt.executeUpdate();
		return true; 
		} catch (Exception ex) {
		System.out.println("boardModify 에러: " + ex);
		} finally {
			if(rs != null)
				try { rs.close(); } catch(SQLException ex) {}
			if(pstmt != null)
				try { pstmt.close(); } catch(SQLException ex) {}
			if(con != null)
				try { con.close(); } catch(SQLException ex) {}
		}
		return false;
	}
		
		public boolean boardDelete(int num) {
			String board_delete_sql = "delete from reservation where res_ord=?"; 
			int result = 0; 
			try {
			con = ds.getConnection(); 
			pstmt = con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, num); 
			result = pstmt.executeUpdate(); 
			if (result == 0) return false;
			return true; 
			} catch (Exception ex) {
			System.out.println("boardDelete 에러: " + ex); 
			} finally { 
				try { 
					if (pstmt != null) pstmt.close(); 
					if (con != null) con.close();
				} catch (Exception ex) {}
			}
			return false;
		}

//		
		//글쓴이인지 확인
		public boolean isBoardwriter(int ord, String id) {
			String board_sql = "select * from reservation where res_ord=?"; 
			try {
			con = ds.getConnection(); 
			pstmt = con.prepareStatement(board_sql);
			pstmt.setInt(1, ord); rs = pstmt.executeQuery(); 
			rs.next(); 
			if (id.equals(rs.getString("id"))) {
			return true;
			}
		} catch (SQLException ex) {
			System.out.println("isBoardWriter 에러 : " + ex); 
		} finally { 
			try {
			if (pstmt != null) pstmt.close(); 
			if (con != null) con.close(); 
			} catch (Exception ex) {}
		}
			return false;
		}
}
		

		
		
		
		
