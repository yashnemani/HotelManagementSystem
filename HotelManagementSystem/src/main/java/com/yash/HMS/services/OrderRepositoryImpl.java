package com.yash.HMS.services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.yash.HMS.repositories.OrderRepositoryCustom;

@Repository
public class OrderRepositoryImpl implements OrderRepositoryCustom{
	@Autowired
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(DataSource ds) {
		this.jdbcTemplate = new JdbcTemplate(ds);
	}
	@Override
	public int getlastId() {
		setJdbcTemplate(dataSource);
		String sql ="select max(id) from orders";
		int id;
		  id = jdbcTemplate.queryForObject(sql, Integer.class);	 
		  return id;
	}
	@Override
	public double getOrdersTotal(int res_id) {
		setJdbcTemplate(dataSource);
		String sql = "select sum(total) from orders where res_id=?";
		double d = 0;
		try{d = jdbcTemplate.queryForObject(sql, Double.class, new Object[] {res_id});}
		catch(NullPointerException e) {
		}
			return d;
	}
}
 	   
