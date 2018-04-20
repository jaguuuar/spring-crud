package com.app.crud.demo.controllers;

import com.app.crud.demo.models.Group;
import com.app.crud.demo.models.User;
import com.app.crud.demo.services.GroupService;
import com.app.crud.demo.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GroupController {

    @Autowired
    UserService userService;

    @Autowired
    GroupService groupService;

    @RequestMapping("/group")
    public ModelAndView groupHome() {
        ModelAndView mv = new ModelAndView("group/index");
        mv.addObject("groups", groupService.findAll());
        return mv;
    }

    @RequestMapping(value = "/group/save", method = RequestMethod.POST)
    public ModelAndView addGroup(@RequestParam("id") String id,
                               @RequestParam("name") String name) {

        ModelAndView mv = new ModelAndView("redirect:/group");
        Group group;

        if(!id.isEmpty()) {
            group = (Group) groupService.findById(Integer.parseInt(id)).orElse(null);
        } else {
            group = new Group();
        }
        group.setName(name);

        groupService.save(group);
        return mv;
    }

    @RequestMapping( value = "/group/view/{id}", method = RequestMethod.GET)
    public ModelAndView viewGroupDetails(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("group/view");
        mv.addObject("group", groupService.findById(id).orElse(null));
        mv.addObject("allUsers", userService.findAll());
        return mv;
    }

    @RequestMapping( value = "/group/delete/{id}", method = RequestMethod.GET)
    public ModelAndView deleteGroup(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("redirect:/group");
        Group group = groupService.findById(id).orElse(null);
        group.getUsersList().stream().
                forEach(user -> {
                    user.deleteGroup(group);
                    userService.save(user);
                });
        groupService.deleteById(id);
        return mv;
    }

    @RequestMapping( value = "/group/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editGroup(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("group/edit");
        mv.addObject("group", groupService.findById(id).orElse(null));
        return mv;
    }

    @RequestMapping(value = "/group/view/{id}/add", method = RequestMethod.POST)
    public ModelAndView addUserToGroup(@RequestParam("userId") String userId,
                                @RequestParam("groupId") String groupId) {

        ModelAndView mv = new ModelAndView("redirect:/group/view/{id}");
        User user = userService.findById(Integer.parseInt(userId)).orElse(null);
        Group group = groupService.findById(Integer.parseInt(groupId)).orElse(null);

        user.addGroup(group);
        userService.save(user);
        return mv;
    }

    @RequestMapping(value = "/group/view/{groupId}/remove/{userId}", method = RequestMethod.GET)
    public ModelAndView removeUserFromGroup(@PathVariable("userId") int userId,
                                    @PathVariable("groupId") int groupId) {

        ModelAndView mv = new ModelAndView("redirect:/group/view/{groupId}");
        User user = userService.findById(userId).orElse(null);
        Group group = groupService.findById(groupId).orElse(null);

        user.deleteGroup(group);
        userService.save(user);
        return mv;
    }


}

