package ch14;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class OrderMgr {
	
	private DBConnectionMgr pool = null;
	
	public OrderMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Connection fail : "+e);
		}
	}//OrderMgr end
	
	//주문목록 조회
	public Vector getOrderList() throws SQLException{
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector vResult = new Vector();
		
		try {
			con = pool.getConnection();
			stmt = con.createStatement();
			String sql = "select * from shop_order order by o_date desc";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setM_id(rs.getString("m_id"));
				ob.setO_quantity(rs.getInt("o_quantity"));
				ob.setO_date(rs.getString("o_date"));
				ob.setO_no(rs.getInt("o_no"));
				ob.setO_state(rs.getInt("o_state"));
				ob.setP_no(rs.getInt("p_no"));
				vResult.add(ob);
			}//while
		} catch (Exception e) {
			System.out.println("getOrderList Exception : "+e);
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		return vResult;
	}//getOrderList end
	
	//주문상세조회
	public OrderBean getOrderDetail(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrderBean ob = null;
		
		try {
			con = pool.getConnection();
			String sql = "select * from shop_order where o_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ob = new OrderBean();
				ob.setM_id(rs.getString("m_id"));
				ob.setO_quantity(rs.getInt("o_quantity"));
				ob.setO_date(rs.getString("o_date"));
				ob.setO_no(rs.getInt("o_no"));
				ob.setO_state(rs.getInt("o_state"));
				ob.setP_no(rs.getInt("p_no"));
			}//if
		} catch (Exception e) {
			System.out.println("getOrderDetail Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return ob;
	}//getOrderDetail end
	
	//주문내역 수정
	public boolean updateOrder(String no, String state) {
		boolean result = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = pool.getConnection();
			String sql = "update shop_order set o_state = ? where o_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, state);
			pstmt.setInt(2, Integer.parseInt(no));
			
			int count = pstmt.executeUpdate();
			if(count == 1) result = true;
		} catch (Exception e) {
			System.out.println("updateOrder Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return result;
	}//updateOrder end
	
	//주문내역 삭제
	public boolean deleteOrder(String no) {
		boolean result = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = pool.getConnection();
			String sql = "delete from shop_order where o_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(no));
			
			int count = pstmt.executeUpdate();
			if(count == 1) result = true;
		} catch (Exception e) {
			System.out.println("deleteOrder Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return result;
	}//deleteOrder end
	
	//insert Order
	public void insertOrder(OrderBean ob) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = pool.getConnection();
			String sql = "insert into shop_order(m_id, p_no, o_quantity, o_date, o_state)"+
			" values(?, ?, ?, now(), 1)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ob.getM_id());
			pstmt.setInt(2, ob.getP_no());
			pstmt.setInt(3, ob.getO_quantity());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertOrder Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}//updateOrder end
	
	//회원의 주문 목록 가져오기
	public Vector getOrder(String id) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vResult = new Vector();
		
		try {
			con = pool.getConnection();
			String sql = "select * from shop_order where m_id=? order by o_date desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setM_id(rs.getString("m_id"));
				ob.setO_quantity(rs.getInt("o_quantity"));
				ob.setO_date(rs.getString("o_date"));
				ob.setO_no(rs.getInt("o_no"));
				ob.setO_state(rs.getInt("o_state"));
				ob.setP_no(rs.getInt("p_no"));
				vResult.add(ob);
			}//while
		} catch (Exception e) {
			System.out.println("getOrder Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vResult;
	}//getOrder end
	
}//class end
