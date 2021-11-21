package com.wm.colloge.entity;


import lombok.Data;

@Data
public class CollogeParm {
    //关键字
    private String collogeName;
    //当前第几页
    private int page;
    // 每页查询的条数
    private int limit;
}
