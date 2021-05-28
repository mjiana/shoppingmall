package ch14;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Vector;;

public class ProductMgr {
	private DBConnectionMgr pool = null;
	
	public ProductMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Connection fail : "+e);
		}
	}//ProductMgr()
	
	//상품 추가
	public boolean insertProduct(HttpServletRequest req) {
		boolean result = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			String uploadDir = "C:\\java_bigdata\\mywork_jsp\\shopmall\\WebContent\\images";
			MultipartRequest multi = 
					new MultipartRequest(req, uploadDir, 5*1024*1024, "euc-kr", 
							new DefaultFileRenamePolicy());
			con = pool.getConnection();
			String sql = "insert into shop_product(p_name, p_price, p_detail, p_date, p_stock, p_image)"
					+"values(?,?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, multi.getParameter("price"));
			pstmt.setString(3, multi.getParameter("detail"));
			pstmt.setString(4, multi.getParameter("stock"));
			
			String img =  multi.getFilesystemName("image");
			System.out.println(img);
			if(img == null) pstmt.setString(5, "ready.png");
			else pstmt.setString(5, img);
			
			int count = pstmt.executeUpdate();
			if(count == 1) result = true;
		} catch (Exception e) {
			System.out.println("insertProduct() Exception "+e);
		} finally {
			pool.freeConnection(con,pstmt);
		}
		return result;
	}//insertProduct() end
	
	//상품 목록
	public Vector getProductList() throws SQLException{
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector vProduct = new Vector();
		
		try {
			con = pool.getConnection();
			stmt = con.createStatement();
			sql = "select * from shop_product order by p_no desc";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ProductBean pb = new ProductBean();
				pb.setP_no(rs.getInt("p_no"));
				pb.setP_name(rs.getString("p_name"));
				pb.setP_price(rs.getString("p_price"));
				pb.setP_detail(rs.getString("p_detail"));
				pb.setP_date(rs.getString("p_date"));
				pb.setP_stock(rs.getString("p_stock"));
				pb.setP_image(rs.getString("p_image"));
				vProduct.add(pb);
			}//while
		} catch (Exception e) {
			System.out.println("getProductList Exception : "+e);
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		return vProduct;
	}//getProductList end
}
