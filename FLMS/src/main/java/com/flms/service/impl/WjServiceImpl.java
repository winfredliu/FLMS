package com.flms.service.impl;

import com.flms.dao.WJDao;
import com.flms.pojo.Wj;
import com.flms.service.WjService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/*
 *
 *@author:flms
 *@time:2020-10-26
 *
 */
@Service
@Transactional
public class WjServiceImpl implements WjService {

    @Autowired
    private WJDao wjDao;

    //添加员工职位
    @Override
    public void addWj(Wj wj) {
        wjDao.insertWJ(wj);
    }

    //删除员工职位
    @Override
    public void deleteWj(Integer[] id) {

        for (int i = 0; i < id.length; i++) {
            wjDao.deleteWjById(id[i]);
        }
    }

    //更新员工职位
    @Override
    public void updateWj(Wj wj) {

        wjDao.updateWJ(wj);
    }


    @Override
    public List<String> findWnoOfWj() {
        return wjDao.selectWnoOfWj();
    }

    @Override
    public Wj findWJByWno(String wno) {
        return wjDao.selectWJByWno(wno);
    }

}
