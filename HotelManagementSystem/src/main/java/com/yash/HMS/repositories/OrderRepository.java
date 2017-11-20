package com.yash.HMS.repositories;

import org.springframework.data.repository.CrudRepository;

import com.yash.HMS.models.Order;

public interface OrderRepository extends CrudRepository<Order,Integer>,OrderRepositoryCustom{

}
