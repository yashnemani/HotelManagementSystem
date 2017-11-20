package com.yash.HMS.repositories;

import com.yash.HMS.models.User;

public interface UserRepositoryCustom {
public User verifyLogin(String user, String pass);
}
