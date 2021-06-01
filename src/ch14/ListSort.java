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
	
	//상품목록 정렬
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
			//System.out.println(sql);
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
			System.out.println("ProductSortList Exception : "+e);
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		return vProduct;
	}// end
	
	//주문목록 정렬
		public Vector OrderSortList(String sort) {
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
			Vector vProduct = new Vector();
			
			try {
				con = pool.getConnection();
				
				String sql = "select * from shop_order order by "+sort;
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				//System.out.println(sql);
				while(rs.next()) {
					OrderBean ob = new OrderBean();
					ob.setM_id(rs.getString("m_id"));
					ob.setO_quantity(rs.getInt("o_quantity"));
					ob.setO_date(rs.getString("o_date"));
					ob.setO_no(rs.getInt("o_no"));
					ob.setO_state(rs.getInt("o_state"));
					ob.setP_no(rs.getInt("p_no"));
					vProduct.add(ob);
				}//while
			} catch (Exception e) {
				System.out.println("OrderSortList Exception : "+e);
			} finally {
				pool.freeConnection(con, stmt, rs);
			}
			return vProduct;
		}// end
}
