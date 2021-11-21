package com.wm.colloge.entity;

import lombok.Data;

@Data
public class TableData<T> {
    private int code;//code为0
    private String msg;
    private T data;
    private long count;

}

