package com.yash.HMS.services;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.yash.HMS.models.User;
import com.yash.HMS.repositories.UserRepositoryCustom;
@Repository
public class UserRepositoryImpl implements UserRepositoryCustom{
	@Autowired
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(DataSource ds) {
		this.jdbcTemplate = new JdbcTemplate(ds);
	}
	@Override
	public User verifyLogin(String user, String pass) {
		setJdbcTemplate(dataSource);
		String sql = "select pass from users where user=?";
		PreparedStatementSetter prepsetter = new PreparedStatementSetter() {
			@Override
			public void setValues(java.sql.PreparedStatement prepstatement) throws SQLException {
				prepstatement.setString(1, user);
			}};
			String p;
			User u = new User();
			try{
				 p = jdbcTemplate.queryForObject(sql, new Object[] {user}, String.class);
			}
			 catch (EmptyResultDataAccessException e) {
				  p = null;
				}
	
		if(p==null){
			u=null;
			return u;	
		}
		if(p.equals(pass)){
			String s = "select  * from users where user=?";
			u = (User) jdbcTemplate.queryForObject(s, new Object[] {user},new RowMapper() {
				public Object mapRow(ResultSet r, int rowNum) throws SQLException {
				User us = new User();
				us.setId(r.getInt(1));
				us.setfName(r.getString(2));
				us.setlName(r.getString(3));
				us.setUser(r.getString(4));
				us.setPass(r.getString(5));
				us.setRole(r.getString(6));
				return us;
				}
			});
			return u;
		}
		else
			return u;
	}

}
