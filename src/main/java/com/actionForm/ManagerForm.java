package com.actionForm;

import org.apache.struts.action.ActionForm;

public class ManagerForm extends ActionForm {
    private Integer id = new Integer(-1);  //ID
    private String name = "";   //
    private String pwd = "";  //
    private int sysset = 0;  //ϵͳ
    private int readerset = 0;   //߹
    private int bookset = 0;   //
    private int borrowback = 0;   //軹
    private int sysquery = 0;    //ϵͳ

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setSysset(int sysset) {
        this.sysset = sysset;
    }

    public int getSysset() {
        return sysset;
    }

    public int getReaderset() {
        return readerset;
    }

    public void setReaderset(int readerset) {
        this.readerset = readerset;
    }

    public void setBookset(int bookset) {
        this.bookset = bookset;
    }

    public int getBookset() {
        return bookset;
    }

    public void setBorrowback(int borrowback) {
        this.borrowback = borrowback;
    }

    public int getBorrowback() {
        return borrowback;
    }

    public void setSysquery(int sysquery) {
        this.sysquery = sysquery;
    }

    public int getSysquery() {
        return sysquery;
    }
}
