package reserve;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import reserve.Reserve;
import user.User;

public class ReserveDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ReserveDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:XE";
			String dbID = "chan";
			String dbPassword = "1111";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Reserve> getSearch(String searchText, String searchType){
		String SQL = " SELECT * FROM RESERVE WHERE "+ searchType.trim() + " LIKE '%" + searchText.trim() + "%'";
		ArrayList<Reserve> list = new ArrayList<Reserve>();
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reserve reserve = new Reserve();
				reserve.setPOST_NUM(rs.getString(1));
				reserve.setEMAIL(rs.getString(2));
				reserve.setPOST_TITLE(rs.getString(3));
				reserve.setPRICE(rs.getString(4));
				reserve.setRESERVE_DATE(rs.getString(5));
				reserve.setRESERVE_NUM(rs.getString(6));
				reserve.setRENT_USEREMAIL(rs.getString(7));
				list.add(reserve);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int reserveDelete(int reserveNumber) {
		String SQL = "DELETE FROM RESERVE WHERE RESERVE_NUM = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, reserveNumber);
			rs = pstmt.executeQuery();
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int reserve(Reserve reserve) {
		String SQL = "INSERT INTO RESERVE VALUES (?, ?, ?, ?, ?, RESERVE_SEQ.NEXTVAL, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, reserve.getPOST_NUM());
			pstmt.setString(2, reserve.getEMAIL());
			pstmt.setString(3, reserve.getPOST_TITLE());
			pstmt.setString(4, reserve.getPRICE());
			pstmt.setString(5, reserve.getRESERVE_DATE());
			pstmt.setString(6, reserve.getRENT_USEREMAIL());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
