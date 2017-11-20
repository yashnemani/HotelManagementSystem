package com.yash.HMS.services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.yash.HMS.models.Room;
import com.yash.HMS.repositories.RoomRepositoryCustom;

@Repository
public class RoomRepositoryImpl implements RoomRepositoryCustom{
@Autowired
private DataSource dataSource;
private JdbcTemplate jdbcTemplate;
public void setJdbcTemplate(DataSource ds) {
	this.jdbcTemplate = new JdbcTemplate(ds);
}
@Override
public List<Room> getAvailableRooms(Date date1, Date date2) {
	java.sql.Date dateN1 = new java.sql.Date(date1.getTime());
	java.sql.Date dateN2 = new java.sql.Date(date2.getTime());
	System.out.println("Date1: "+dateN1+" Date2: "+dateN2);
	String sql = "select * from rooms as r"
			+ " where r.room_no not in (select room from active_reservations where (start<=? and end>=?) or (start<=? and end>=?))";
	setJdbcTemplate(dataSource);
	PreparedStatementSetter prepsetter = new PreparedStatementSetter() {
		@Override
		public void setValues(java.sql.PreparedStatement prepstatement) throws SQLException {
			prepstatement.setDate(1, dateN1);
			prepstatement.setDate(2, dateN1);
			prepstatement.setDate(3, dateN2);
			prepstatement.setDate(4, dateN2);
		}};
	return jdbcTemplate.query(sql,prepsetter, new roomMapper());
}
private static final class roomMapper implements RowMapper<Room>{

	@Override
	public Room mapRow(ResultSet rs, int rowNum) throws SQLException {
	Room room = new Room();
	room.setNum(rs.getInt(1));
		return room;
	}
 	   
    }
@Override
public void setStatus(int room, String status) {
	setJdbcTemplate(dataSource);
	String sql = "update rooms set status=? where room_no=?";
	PreparedStatementSetter prepsetter = new PreparedStatementSetter() {
		@Override
		public void setValues(java.sql.PreparedStatement prepstatement) throws SQLException {
			prepstatement.setString(1, status);
			prepstatement.setInt(2, room);
		}};
	jdbcTemplate.update(sql, prepsetter);
}

}
