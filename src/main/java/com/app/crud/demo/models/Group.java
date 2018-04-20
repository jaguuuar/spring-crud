package com.app.crud.demo.models;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "group_table")
public class Group {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String name;

    @ManyToMany(mappedBy = "groupsList")
    private Set<User> usersList = new HashSet<>();

    public Group() {
    }

    public Group(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<User> getUsersList() {
        return usersList;
    }

    public void addUser(User user) {
        this.usersList.add(user);
    }

    public void removeUser(User user) {
        this.getUsersList().remove(user);
    }

    public void clearUsers() {
        this.getUsersList().clear();
    }
}
