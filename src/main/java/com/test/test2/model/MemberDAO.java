package com.test.test2.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public static Connection getConnection() throws Exception{
		
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		return con;
	}
	public List<MemberDTO> salesMember() throws Exception{
		con = getConnection();
		String sql = "select m.custno, m.custname, "
				+ "        case when m.grade='A' then 'VIP' "
				+ "             when m.grade='B' then '일반' "
				+ "             when m.grade='C' then '직원' "
				+ "        end as 고객등급, "
				+ "        sum(s.price) as sales "
				+ "    from member_tbl_02 m, money_tbl_02 s where m.custno = s.custno "
				+ "    group by m.custno, m.custname, m.grade order by sales desc ";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		List<MemberDTO> mList = new ArrayList<>();
		for (;rs.next();) {
			MemberDTO m = new MemberDTO();
			m.setCustno(rs.getString(1));
			m.setCustname(rs.getString(2));
			m.setGrade(rs.getString(3));
			m.setSales(rs.getString(4));
			mList.add(m);
		}
		return mList;
		
	}
	
	public int updateMember(String custno, String custname, String phone, String address, String joindate, String grade, String city) throws Exception {
		con = getConnection();
		String sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, joindate);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);
		pstmt.setString(7, custno);
		
		int result = pstmt.executeUpdate();
		System.out.println(result);
		return result; 
	}
	public MemberDTO findByCustno(String custno) throws Exception{
		con = getConnection();
		String sql ="select custno, custname, phone, address, to_char(joindate,'YYYY-MM-DD'), grade, city from member_tbl_02 where custno=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, custno);
		rs=pstmt.executeQuery();
		MemberDTO m = new MemberDTO();
		if(rs.next()) {
			m.setCustno(rs.getString(1));
			m.setCustname(rs.getString(2));
			m.setPhone(rs.getString(3));
			m.setAddress(rs.getString(4));
			m.setJoindate(rs.getString(5));
			m.setGrade(rs.getString(6));
			m.setCity(rs.getString(7));
		}
		return m;
		
	}
	public List<MemberDTO> findMember() throws Exception{
		con = getConnection();
		String sql = "select custno, custname,phone,address,to_char(joindate,'YYYY-MM-DD'),"
				+ "decode(grade,'A','VIP','B','일반','C','직원') grade,city"
				+ " from member_tbl_02";
		List<MemberDTO> mList = new ArrayList<>();
		pstmt = con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		for(;rs.next();) {
			MemberDTO m = new MemberDTO();
			m.setCustno(rs.getString(1));
			m.setCustname(rs.getString(2));
			m.setPhone(rs.getString(3));
			m.setAddress(rs.getString(4));
			m.setJoindate(rs.getString(5));
			m.setGrade(rs.getString(6));
			m.setCity(rs.getString(7));
			mList.add(m);
		}
		return mList;
	}
	public int saveMember(String custno,String custname, String phone, String address, String joindate, String grade, String city) throws Exception {
		con = getConnection();
		String sql = "insert into member_tbl_02 values (?,?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, joindate);
		pstmt.setString(6, grade);
		pstmt.setString(7, city);
		
		int result =pstmt.executeUpdate();
		return result; 
	}
	public int findLastCustno() throws Exception {
		con = getConnection();
		String sql = "select max(custno) from member_tbl_02";
		pstmt = con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		int lastCustno=0;
		if(rs.next())
			lastCustno =  rs.getInt(1)+1;
		return lastCustno;
	}

}
