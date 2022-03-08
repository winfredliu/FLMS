package com.flms.pojo;

import java.util.List;

/*
 *
 *@author:flms
 *@time:2022-3-5
 *分页实体类
 */
public class Page<T> {
    private int currentPage;//当前页数
    private int pageSize;//每页显示的记录数
    private int totalCount;//总记录数
    private int totalPage;//总页数
    private List<T> datas;//每页显示的数据

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getDatas() {
        return datas;
    }

    public void setDatas(List<T> datas) {
        this.datas = datas;
    }
}
