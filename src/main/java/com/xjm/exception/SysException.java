package com.xjm.exception;

public class SysException extends Exception{

    //存储提示信息的
    private String message;

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public SysException(String message){
        this.message=message;
    }
}