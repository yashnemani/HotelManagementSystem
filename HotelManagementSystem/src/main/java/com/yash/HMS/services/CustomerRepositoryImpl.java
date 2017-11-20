package com.yash.HMS.services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.yash.HMS.models.Customer;
import com.yash.HMS.repositories.CustomerRepositoryCustom;
@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom{
	@Autowired
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(DataSource ds) {
		this.jdbcTemplate = new JdbcTemplate(ds);
	}
	@Override
	public Customer findCustomer(String phone) {
		 setJdbcTemplate(dataSource);
		 String sql= "select * from customers where phone=?";
		 PreparedStatementSetter prepsetter = new PreparedStatementSetter() {
				@Override
				public void setValues(java.sql.PreparedStatement prepstatement) throws SQLException {
					prepstatement.setString(1, phone);
				}};
				List<Customer> customers = new ArrayList<>();
				
				customers = jdbcTemplate.query(sql, prepsetter, new customerMapper());
				if(customers.isEmpty())
					return null;
				else
					return customers.get(0);
	}
	private static final class customerMapper implements RowMapper<Customer>{

		@Override
		public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
	Customer cus = new Customer();
	cus.setId(rs.getInt(1));
		cus.setfName(rs.getString(2));
		cus.setlName(rs.getString(3));
			return cus;
		}
	 	   
	    }

}
