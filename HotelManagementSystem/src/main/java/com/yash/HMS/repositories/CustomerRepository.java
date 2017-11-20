package com.yash.HMS.repositories;

import org.springframework.data.repository.CrudRepository;

import com.yash.HMS.models.Customer;

public interface CustomerRepository extends CrudRepository<Customer,Integer>,CustomerRepositoryCustom{

}
