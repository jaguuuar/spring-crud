package com.app.crud.demo.models;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "user_table")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "user_name")
    private String userName;

    @Column(name = "password")
    private String password;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "date_of_birth")
    @Type(type="date")
    private Date birthDate;

    @ManyToMany(cascade = { CascadeType.ALL })
    @JoinTable(name = "user_group_table",
               joinColumns = { @JoinColumn(name = "user_id") },
               inverseJoinColumns = { @JoinColumn(name = "group_id") })
    private Set<Group> groupsList = new HashSet<>();

    public User() {
    }

    public User(String userName, String password, String firstName, String lastName, Date birthDate) {
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthDate = birthDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public Set<Group> getGroupsList() {
        return groupsList;
    }

    public void addGroup(Group group) {
        this.groupsList.add(group);
    }

    public void deleteGroup(Group group) {
        this.getGroupsList().remove(group);
    }

    public void clearGroups() {
        this.getGroupsList().clear();
    }

}
