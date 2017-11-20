package com.yash.HMS.repositories;
import org.springframework.data.repository.CrudRepository;

import com.yash.HMS.models.Room;

public interface RoomRepository extends CrudRepository<Room , Integer>, RoomRepositoryCustom{
}