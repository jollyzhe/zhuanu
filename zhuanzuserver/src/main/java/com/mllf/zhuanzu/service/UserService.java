package com.mllf.zhuanzu.service;

import com.mllf.zhuanzu.entity.User;

import java.util.Map;
/**
 * @description:用户表
 * @author: jolly
 * @time: 2020/5/14 10:07
 */




public interface UserService {

    /**
     * 新增
     */
 //   public ReturnT<String> insert(User user);

    /**
     * 删除
     */
//    public ReturnT<String> delete(int id);

    /**
     * 更新
     */
//    public ReturnT<String> update(User user);

    /**
     * 根据主键 id 查询
     */
    public User load(int id);

    /**
     * 分页查询
     */
    public Map<String,Object> pageList(int offset, int pagesize);

}
