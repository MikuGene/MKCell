package com.MK.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MKserve {
	private Connection conn;
	private ResultSet rs;
	private Statement stm;
	private PreparedStatement pstm;
	public void open() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mkcellsql?useSSL=false&serverTimezone=UTC","MKcell","mk624805549");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ResultSet execute(String sql) {
		try {
			stm = conn.createStatement();
			rs = stm.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public PreparedStatement exeUpdate(String sql) {
		try {
			pstm=conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pstm;
	}

	public void close() {
		try {
			stm.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
