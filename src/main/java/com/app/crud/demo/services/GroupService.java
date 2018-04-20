package com.app.crud.demo.services;

import com.app.crud.demo.models.Group;
import org.springframework.data.repository.CrudRepository;

public interface GroupService extends CrudRepository<Group, Integer>{
}
