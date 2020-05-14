package com.mllf.zhuanzu.mapper;

/**
 * @description:用户表
 * @author: jolly
 * @time: 2020/5/14 10:09
 */

import com.mllf.zhuanzu.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import java.util.List;


@Mapper
@Repository
public interface UserMapper {

    /**
     * [新增]
     * @author jolly
     * @date 2020/05/14
     **/
    int insert(User user);

    /**
     * [刪除]
     * @author jolly
     * @date 2020/05/14
     **/
    int delete(int id);

    /**
     * [更新]
     * @author jolly
     * @date 2020/05/14
     **/
    int update(User user);

    /**
     * [查询] 根据主键 id 查询
     * @author jolly
     * @date 2020/05/14
     **/
    User load(int id);

    /**
     * [查询] 分页查询
     * @author jolly
     * @date 2020/05/14
     **/
    List<User> pageList(int offset,int pagesize);

    /**
     * [查询] 分页查询 count
     * @author jolly
     * @date 2020/05/14
     **/
    int pageListCount(int offset,int pagesize);

}

