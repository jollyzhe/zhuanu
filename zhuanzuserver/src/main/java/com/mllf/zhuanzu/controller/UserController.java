package com.mllf.zhuanzu.controller;

/**
 * @description:用户表
 * @author: jolly
 * @time: 2020/5/14 10:06
 */
import com.mllf.zhuanzu.entity.User;
import com.mllf.zhuanzu.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping(value = "/User")
public class UserController {

    @Resource
    private UserService userService;

    /**
     * [新增]
     * @author jolly
     * @date 2020/05/14
     **/
/*    @RequestMapping("/insert")
    public String insert(User user){
        return userService.insert(user);
    }*/

    /**
     * [刪除]
     * @author jolly
     * @date 2020/05/14
     **/
/*    @RequestMapping("/delete")
    public ReturnT<String> delete(int id){
        return userService.delete(id);
    }*/

    /**
     * [更新]
     * @author jolly
     * @date 2020/05/14
     **/
/*    @RequestMapping("/update")
    public ReturnT<String> update(User user){
        return userService.update(user);
    }*/

    /**
     * [查询] 根据主键 id 查询
     * @author jolly
     * @date 2020/05/14
     **/
/*    @RequestMapping("/load")
    public ReturnT<String> load(int id){
        return userService.load(id);
    }*/

    /**
     * [查询] 分页查询
     * @author jolly
     * @date 2020/05/14
     **/
    @RequestMapping("/pageList")
    public Map<String, Object> pageList(@RequestParam(required = false, defaultValue = "0") int offset,
                                        @RequestParam(required = false, defaultValue = "10") int pagesize) {
        return userService.pageList(offset, pagesize);
    }

}
