package com.yash.HMS.repositories;

import org.springframework.data.repository.CrudRepository;

import com.yash.HMS.models.User;

public interface UserRepository extends CrudRepository<User,Integer>,UserRepositoryCustom{

}
