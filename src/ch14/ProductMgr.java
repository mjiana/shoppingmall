package ch14;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import java.io.File;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Vector;;

public class ProductMgr {
	private DBConnectionMgr pool = null;
	// 역슬래쉬 두번은 한번의 슬래쉬와 동일하다.  \\ = /
	String uploadDir = "C:\\java_bigdata\\mywork_jsp\\shopmall\\WebContent\\images\\";
	
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
			// 역슬래쉬 두번은 한번의 슬래쉬와 동일하다.  \\ = /
			MultipartRequest multi = 
					new MultipartRequest(req, uploadDir, 5*1024*1024, "euc-kr", 
							new DefaultFileRenamePolicy());
			con = pool.getConnection();
			String sql = "insert into shop_product(p_name, p_price, p_detail, p_date, p_stock, p_image)"
					+"values(?,?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
			pstmt.setString(3, multi.getParameter("detail"));
			pstmt.setInt(4, Integer.parseInt(multi.getParameter("stock")));
			
			String img =  multi.getFilesystemName("image");
			//System.out.println(img);
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
				//int price = Integer.parseInt(df.format(rs.getString("p_price")));
				//System.out.println(rs.getString("p_price")+"/"+price);
				pb.setP_price(rs.getInt("p_price"));
				pb.setP_detail(rs.getString("p_detail"));
				pb.setP_date(rs.getString("p_date"));
				pb.setP_stock(rs.getInt("p_stock"));
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
	
	//상품 상세보기
	public ProductBean getProduct(String no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ProductBean pb = null;
		
		try {
			con = pool.getConnection();
			sql = "select * from shop_product where p_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pb = new ProductBean();
				pb.setP_no(rs.getInt("p_no"));
				pb.setP_name(rs.getString("p_name"));
				//int price = Integer.parseInt(df.format(rs.getString("p_price")));
				//System.out.println(rs.getString("p_price")+"/"+price);
				pb.setP_price(rs.getInt("p_price"));
				pb.setP_detail(rs.getString("p_detail"));
				pb.setP_date(rs.getString("p_date"));
				pb.setP_stock(rs.getInt("p_stock"));
				pb.setP_image(rs.getString("p_image"));
			}//if
		} catch (Exception e) {
			System.out.println("getProduct Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return pb;
	}//getProduct end
	
	//Update
	public boolean updateProduct(HttpServletRequest req) {
		boolean result = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = pool.getConnection();
			MultipartRequest multi = 
					new MultipartRequest(req, uploadDir, 5*1024*1024, "euc-kr", 
							new DefaultFileRenamePolicy());
			String img =  multi.getFilesystemName("image");
			if(img == null) {
				sql = "update shop_product set p_name=?, p_price=?, p_detail=?, p_stock=? where p_no=? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
				pstmt.setString(3, multi.getParameter("detail"));
				pstmt.setInt(4, Integer.parseInt(multi.getParameter("stock")));
				pstmt.setString(5, multi.getParameter("no"));
			}else {
				sql = "update shop_product set p_name=?, p_price=?, p_detail=?, p_stock=?, p_image=? where p_no=? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
				pstmt.setString(3, multi.getParameter("detail"));
				pstmt.setInt(4, Integer.parseInt(multi.getParameter("stock")));
				pstmt.setString(5, img);
				pstmt.setString(6, multi.getParameter("no"));
			}
			
			int count = pstmt.executeUpdate();
			if(count == 1) result = true;
		} catch (Exception e) {
			System.out.println("updateProduct() Exception "+e);
		} finally {
			pool.freeConnection(con,pstmt);
		}
		return result;
	}//updateProduct() end
	
	//Delete
	public boolean deleteProduct(String no) {
		boolean result = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = pool.getConnection();
			//file delete
			sql = "select p_image from shop_product where p_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			rs.next();
			String imgName = rs.getString("p_image");
			java.io.File file = new File(uploadDir+imgName);
			//System.out.println(file);
			if(file.exists() && !imgName.equals("ready.png")) file.delete();
			pstmt.close();
			//DB data delete
			sql = "delete from shop_product where p_no=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			
			int count = pstmt.executeUpdate();
			if(count == 1) result = true;
		} catch (Exception e) {
			System.out.println("deleteProduct() Exception "+e);
		} finally {
			pool.freeConnection(con,pstmt, rs);
		}
		return result;
	}//deleteProduct() end
}
