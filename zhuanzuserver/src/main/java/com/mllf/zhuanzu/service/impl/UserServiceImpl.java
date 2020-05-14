package com.mllf.zhuanzu.service.impl;

/**
 * @description: 用户表
 * @author: jolly
 * @time: 2020/5/14 10:08
 */

import com.mllf.zhuanzu.entity.User;
import com.mllf.zhuanzu.mapper.UserMapper;
import com.mllf.zhuanzu.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;


/*    @Override
    public ReturnT<String> insert(User user) {

        // valid
        if (user == null) {
            return new ReturnT<String>(ReturnT.FAIL_CODE, "必要参数缺失");
        }

        userMapper.insert(user);
        return ReturnT.SUCCESS;
    }*/


/*    @Override
    public ReturnT<String> delete(int id) {
        int ret = userMapper.delete(id);
        return ret>0?ReturnT.SUCCESS:ReturnT.FAIL;
    }*/


/*    @Override
    public ReturnT<String> update(User user) {
        int ret = userMapper.update(user);
        return ret>0?ReturnT.SUCCESS:ReturnT.FAIL;
    }*/


    @Override
    public User load(int id) {
        return userMapper.load(id);
    }


    @Override
    public Map<String,Object> pageList(int offset, int pagesize) {

        List<User> pageList = userMapper.pageList(offset, pagesize);
        int totalCount = userMapper.pageListCount(offset, pagesize);

        // result
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("pageList", pageList);
        result.put("totalCount", totalCount);

        return result;
    }

}
