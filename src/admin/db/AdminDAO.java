package admin.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public AdminDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			return;
		}
	}

	public Date stringToDate(MemberBean member)
    {
        String year = member.getBirthyy();
        String month = member.getBirthmm();
        String day = member.getBirthdd();
        
        Date birthday  = null;
        
        if(year != null && month != null && day != null)
            birthday = Date.valueOf(year+"-"+month+"-"+day);
        
        return birthday;
        
    } // end stringToDate()
	
	public int isMember(MemberBean member) {
		String sql = "select password from member where member_id=?";
		int result = -1;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMember_id());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("password").equals(member.getPassword())) {
					result = 1;
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return result;
	}

	public boolean joinMember(MemberBean member) {
		String sql = "INSERT INTO MEMBER VALUES (?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		int result = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			stringToDate(member);
			pstmt.setString(1, member.getMember_id());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getMember_name());
			pstmt.setString(4, member.getGender());
			pstmt.setDate(5, stringToDate(member));
			pstmt.setString(6, member.getMail());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getAddress());
			result = pstmt.executeUpdate();

			if (result != 0) {
				return true;
			}
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return false;
	}
	
	public List getMemberList() {
		String sql = "select * from member";
		List memberlist = new ArrayList();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberBean mb = new MemberBean();
				mb.setMember_id(rs.getString("member_id"));
				mb.setPassword(rs.getString("password"));
				mb.setMember_name(rs.getString("member_name"));
				mb.setGender(rs.getString("gender"));
//				mb.setBirth(rs.getDate("birth"));
				mb.setBirthyy(rs.getDate("birth").toString());	
				mb.setMail(rs.getString("mail"));
				mb.setPhone(rs.getString("phone"));
				mb.setAddress(rs.getString("address"));
				mb.setReg(rs.getDate("reg"));
				memberlist.add(mb);
			}
			return memberlist;
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return null;
	}
	
	public List getMemberList(int page, int limit) {
		List memberlist = new ArrayList();
		try {
			con = ds.getConnection();
			int startrow = (page - 1) * 10 + 1 ; //읽기 시작할 row 번호
			int endrow = startrow + limit - 1; //읽을 마지가 row 번호
			pstmt = con.prepareStatement("select * from (select rownum rnum, member_id, member_name, phone, mail from ( select * from  member order by member_name )) where rnum >=? and rnum <=?");
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberBean mb = new MemberBean();
				mb.setMember_id(rs.getString("member_id"));
				mb.setMember_name(rs.getString("member_name"));
				mb.setPhone(rs.getString("phone"));
				mb.setMail(rs.getString("mail"));
				memberlist.add(mb);
			}
			return memberlist;
		} catch (Exception ex) {
			System.out.println("getMemberLis 에러 : " + ex);
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
	
	public int getListCount() {
		int x = 0;
		try {
			con = ds.getConnection();
			System.out.println("getConnection");
			pstmt = con.prepareStatement("select count(*) from member");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount 에러:" + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	public List getSearchList(String sc, String st, int page, int limit) {
		List memberlist = new ArrayList();

		int startrow = (page - 1) * 10 + 1; // 읽기 시작할 row 번호
		int endrow = startrow + limit - 1; // 읽을 마지가 row 번호
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(
					"select * from (select rownum rnum, member_id, member_name, phone, mail from ( select * from  member order by member_name )) where "
							+ sc + " like ? and rnum >=? and rnum <=?");
			pstmt.setString(1, "%" + st + "%");
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberBean mb = new MemberBean();
				mb.setMember_id(rs.getString("member_id"));
				mb.setMember_name(rs.getString("member_name"));
				mb.setPhone(rs.getString("phone"));
				mb.setMail(rs.getString("mail"));
				memberlist.add(mb);
			}
			return memberlist;
		} catch (Exception ex) {
			System.out.println("getSearchList 에러 : " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return null;
	}

	public MemberBean getDetailMember(String id) {
		String sql = "SELECT * FROM MEMBER WHERE MEMBER_ID=?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			
            String birthday = rs.getDate("birth").toString();
            String year = birthday.substring(0, 4);
            String month = birthday.substring(5, 7);
            String day = birthday.substring(8, 10);
			
			MemberBean mb = new MemberBean();
			mb.setMember_id(rs.getString("Member_id"));
			mb.setPassword(rs.getString("password"));
			mb.setMember_name(rs.getString("Member_name"));
			mb.setGender(rs.getString("gender"));
            mb.setBirthyy(year);
            mb.setBirthmm(month);
            mb.setBirthdd(day);
			mb.setMail(rs.getString("mail"));
			mb.setPhone(rs.getString("phone"));
			mb.setAddress(rs.getString("address"));
			mb.setReg(rs.getDate("reg"));
			return mb;
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return null;
	}

	public int updateMember(MemberBean member) {
		String sql = "UPDATE member SET password=?, mail=?, phone=?, address=? WHERE member_id=?";
		int result = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getMail());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getMember_id());
			result = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return result;
	}

	public boolean deleteMember(String id) {
		String sql2 = "DELETE FROM MEMBER WHERE MEMBER_ID=?";
		boolean isSuccess = false;
		int result1 = 0;
		int result2 = 0;
		boolean result = false;
		System.out.println("deleteId=" + id);
		try {
			con = ds.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, id);
			result2 = pstmt.executeUpdate();
			if (result1 > 0 && result2 > 0) {
				result = true;
			}
			isSuccess = true;
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			try {
				if (isSuccess) {
					con.commit();
				} else {
					con.rollback();
				}
			} catch (Exception e) {
			}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return result;
	}
}
