package com.app.crud.demo.services;

import com.app.crud.demo.models.User;
import org.springframework.data.repository.CrudRepository;

public interface UserService extends CrudRepository<User, Integer>{
}
