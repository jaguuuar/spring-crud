package com.app.crud.demo.controllers;

import com.app.crud.demo.models.Group;
import com.app.crud.demo.models.User;
import com.app.crud.demo.services.GroupService;
import com.app.crud.demo.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    GroupService groupService;

    @RequestMapping("/user")
    public ModelAndView userHome() {
        ModelAndView mv = new ModelAndView("user/index");
        mv.addObject("users", userService.findAll());
        return mv;
    }

    @RequestMapping(value = "/user/save", method = RequestMethod.POST)
    public ModelAndView addUser(@RequestParam("id") String id,
                               @RequestParam("user_name") String userName,
                               @RequestParam("password") String password,
                               @RequestParam("first_name") String firstName,
                               @RequestParam("last_name") String lastName,
                               @RequestParam("date_of_birth") @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateTime){

        ModelAndView mv = new ModelAndView("redirect:/user");
        User user;

        if(!id.isEmpty()) {
            user = (User)userService.findById(Integer.parseInt(id)).orElse(null);
        } else {
            user = new User();
        }
        user.setUserName(userName);
        user.setPassword(password);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setBirthDate(dateTime);

        userService.save(user);
        return mv;
    }

    @RequestMapping( value = "/user/view/{id}", method = RequestMethod.GET)
    public ModelAndView viewUserDetails(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("user/view");
        mv.addObject("user", userService.findById(id).orElse(null));
        mv.addObject("allGroups", groupService.findAll());
        return mv;
    }

    @RequestMapping( value = "/user/delete/{id}", method = RequestMethod.GET)
    public ModelAndView deleteUser(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("redirect:/user");
        User user = userService.findById(id).orElse(null);
        user.clearGroups();
        userService.save(user);
        userService.deleteById(id);
        return mv;
    }

    @RequestMapping( value = "/user/edit/{id}", method = RequestMethod.GET)
    public ModelAndView doEdit(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("user/edit");
        mv.addObject("lists", userService.findById(id).orElse(null));
        return mv;
    }

    @RequestMapping(value = "/user/view/{id}/join", method = RequestMethod.POST)
    public ModelAndView joinUserToGroup(@RequestParam("userId") String userId,
                                  @RequestParam("groupId") String groupId) {

        ModelAndView mv = new ModelAndView("redirect:/user/view/{id}");
        User user = userService.findById(Integer.parseInt(userId)).orElse(null);
        Group group = groupService.findById(Integer.parseInt(groupId)).orElse(null);

        user.addGroup(group);
        userService.save(user);
        return mv;
    }

    @RequestMapping(value = "/user/view/{userId}/leave/{groupId}", method = RequestMethod.GET)
    public ModelAndView leaveGroup(@PathVariable("userId") int userId,
                                    @PathVariable("groupId") int groupId) {

        ModelAndView mv = new ModelAndView("redirect:/user/view/{userId}");
        User user = userService.findById(userId).orElse(null);
        Group group = groupService.findById(groupId).orElse(null);

        user.deleteGroup(group);
        userService.save(user);
        return mv;
    }



}
