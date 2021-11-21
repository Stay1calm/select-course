package com.wm.colloge.entity;

import lombok.Data;

@Data//自动生成get和set方法
public class Colloge {
    private Integer collogeId;
    private String collogeName;
    private Integer orderNum;
}
