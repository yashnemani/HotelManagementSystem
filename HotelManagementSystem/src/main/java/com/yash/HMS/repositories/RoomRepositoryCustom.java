package com.yash.HMS.repositories;

import java.util.Date;
import java.util.List;

import com.yash.HMS.models.Room;

public interface RoomRepositoryCustom {
public List<Room> getAvailableRooms(Date date1, Date date2);
public void setStatus(int room, String status);
}