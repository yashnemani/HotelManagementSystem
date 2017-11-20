package com.yash.HMS.repositories;

import org.springframework.data.repository.CrudRepository;

import com.yash.HMS.models.OrderItem;

public interface OrderItemRepository extends CrudRepository<OrderItem,Integer>{

}
