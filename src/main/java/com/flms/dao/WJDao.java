package com.flms.dao;

import com.flms.pojo.Wj;

import java.util.List;

/*
 *
 *@author:flms
 *@time:2020-10-26
 *
 */

public interface WJDao {
    //插入
    void insertWJ(Wj wj);
    // 更新
    void updateWJ(Wj wj);
    // 删除
    void deleteWjById(Integer id);

    // 全部查找
    List<Wj> selectWJAll();

    // 查找工号
    List<String> selectWnoOfWj();

    // 通过工号查找
    Wj selectWJByWno(String wno);
}
