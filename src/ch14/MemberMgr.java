package ch14;

import java.util.*;
import java.sql.*;

//DAO
public class MemberMgr {
	private DBConnectionMgr pool = null;
	
	public MemberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Ŀ�ؼ� ���� : "+e);
		}
	}//������ end
	
	//ID�ߺ�üũ
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean checkCon = false;
		
		try {
			con = pool.getConnection();
			String strQuery = "select id from member where id = ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			checkCon = rs.next();
		} catch (Exception e) {
			System.out.println("Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return checkCon;
	}//checkId end
	
	//�����ȣ
	public Vector zipcodeRead(String area3) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		
		try {
			con = pool.getConnection();
			// ?�� ����� �� ����. stmt�� ����ص� ����
			String strQuery = 
					"select * from zipcode where area3 like '"+area3+"%'";
			pstmt = con.prepareStatement(strQuery);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipcodeBean tempZipcode = new ZipcodeBean();
				tempZipcode.setZipcode(rs.getString("zipcode"));
				tempZipcode.setArea1(rs.getString("area1"));
				tempZipcode.setArea2(rs.getString("area2"));
				tempZipcode.setArea3(rs.getString("area3"));
				tempZipcode.setArea4(rs.getString("area4"));
				vecList.addElement(tempZipcode);
			}//while end
		} catch (Exception e) {
			System.out.println("zipcode Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vecList;
	}
	
	//ȸ������ �޼���
	public boolean memberInsert(RegisterBean regBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			String strQuery = "insert into member value(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1, regBean.getMem_id() );
			pstmt.setString(2, regBean.getMem_passwd() );
			pstmt.setString(3, regBean.getMem_name() );
			pstmt.setString(4, regBean.getMem_num1() );
			pstmt.setString(5, regBean.getMem_num2() );
			pstmt.setString(6, regBean.getMem_email() );
			pstmt.setString(7, regBean.getMem_phone() );
			pstmt.setString(8, regBean.getMem_zipcode() );
			pstmt.setString(9, regBean.getMem_address() );
			pstmt.setString(10, regBean.getMem_job() );
			int count = pstmt.executeUpdate();
			
			if(count > 0) flag = true;
 		} catch (Exception e) {
			System.out.println("memberInsert Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//�α��� üũ
	public boolean loginCheck(String id, String passwd) {
		Connection con = null; //DB������ �������� ���尴ü
		PreparedStatement pstmt = null; //���� �ۼ� �� ���ఴü
		ResultSet rs = null; //select�� ���� ���� �� ���ó�� ��ü 
		boolean loginCon = false;//�Լ� ��ȯ��
		
		try {
			con = pool.getConnection(); //DBCP�� pool�� ����� ����̹� �ε�
			String strQuery = "select id,passwd from member where id=? and passwd=?"; //select ������
			pstmt = con.prepareStatement(strQuery); //������ �̸� ������ �Ѵ�.
			pstmt.setString(1, id);//���� �����Ͱ� ����
			pstmt.setString(2, passwd);//���� �����Ͱ� ����
			rs = pstmt.executeQuery(); //���� ����
			loginCon = rs.next(); //���� �ִٸ� true ��ȯ
		} catch (Exception e) {
			System.out.println("loginCheck Exception : "+e); //�����߻� �� ��µǴ� �޽���
		} finally {
			pool.freeConnection(con, pstmt, rs); //pool ��ȯ
		}
		return loginCon; //��ȯ��
	}
	
	//ȸ������ �ҷ�����
	public RegisterBean memberView(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RegisterBean rb = new RegisterBean();
		
		try {
			con = pool.getConnection();
			String strQuery = "select * from member where id=?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rb.setMem_id(rs.getString("id"));
				rb.setMem_name(rs.getString("name"));
				rb.setMem_num1(rs.getString("mem_num1"));
				rb.setMem_num2(rs.getString("mem_num2"));
				rb.setMem_email(rs.getString("e_mail"));
				rb.setMem_phone(rs.getString("phone"));
				rb.setMem_zipcode(rs.getString("zipcode"));
				rb.setMem_address(rs.getString("address"));
				rb.setMem_job(rs.getString("job"));
			}
		} catch (Exception e) {
			System.out.println("memberView Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return rb;
	}
	
	//ȸ����� �ҷ�����
	public List memberList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = new ArrayList();
		
		try {
			con = pool.getConnection();
			String strQuery = 
					"select * from member order by id asc";
			pstmt = con.prepareStatement(strQuery);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RegisterBean rb = new RegisterBean();
				rb.setMem_id(rs.getString("id"));
				rb.setMem_name(rs.getString("name"));
				list.add(rb);
			}//while end
		} catch (Exception e) {
			System.out.println("memberList Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
	
	//��й�ȣ üũ
	public boolean passwordCheck(String id, String pwd) throws SQLException{
		boolean chk = false;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			stmt = con.createStatement();
			String sql = "select passwd from member where id="+id;
			rs = stmt.executeQuery(sql);
			rs.next();
			
			String pwd2 = rs.getString("passwd");
			pwd = pwd.trim(); //������ �Ѿ�� �� �յ� ��������
			pwd2 = pwd2.trim(); //DB���� ������ ��ȣ�� �յ� ��������
			if(pwd.equals(pwd2)) chk = true;
		}catch (Exception e) {
			System.out.println("passwordCheck Exception : "+e);
		} finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			pool.freeConnection(con);
		}
		return chk;
	}//passwordCheck end
	
	public boolean memberUpdate(RegisterBean regBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try {
			con = pool.getConnection();
			//System.out.println("id="+regBean.getMem_id());
			String sql = "update member "
					+"set name=?, mem_num1=?, mem_num2=?, e_mail=?, phone=?, zipcode=?, address=?, job=? "
					+"where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, regBean.getMem_name() );
			pstmt.setString(2, regBean.getMem_num1() );
			pstmt.setString(3, regBean.getMem_num2() );
			pstmt.setString(4, regBean.getMem_email() );
			pstmt.setString(5, regBean.getMem_phone() );
			pstmt.setString(6, regBean.getMem_zipcode() );
			pstmt.setString(7, regBean.getMem_address() );
			pstmt.setString(8, regBean.getMem_job() );
			pstmt.setString(9, regBean.getMem_id());
			
			int count = pstmt.executeUpdate();
			if(count == 1) result = true;
			//System.out.println("result="+result);
 		} catch (Exception e) {
			System.out.println("memberUpdate Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return result;
	}
}
