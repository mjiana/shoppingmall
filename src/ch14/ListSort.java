package ch14;

import java.sql.*;
import java.util.Vector;

public class ListSort {
	private DBConnectionMgr pool = null;
	
	public ListSort() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Connection fail : "+e);
		}
	}// end
	
	//목록 정렬
	public Vector ProductSortList(String sort) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector vProduct = new Vector();
		
		try {
			con = pool.getConnection();
			
			String sql = "select * from shop_product order by "+sort;
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println(sql);
			while(rs.next()) {
				ProductBean pb = new ProductBean();
				pb.setP_no(rs.getInt("p_no"));
				pb.setP_name(rs.getString("p_name"));
				pb.setP_price(rs.getInt("p_price"));
				pb.setP_detail(rs.getString("p_detail"));
				pb.setP_date(rs.getString("p_date"));
				pb.setP_stock(rs.getInt("p_stock"));
				vProduct.add(pb);
			}//while
		} catch (Exception e) {
			System.out.println("ListSort Exception : "+e);
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		return vProduct;
	}// end
}
