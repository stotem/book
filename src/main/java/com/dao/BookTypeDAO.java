package com.dao;

import com.actionForm.BookTypeForm;
import com.core.ConnDB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class BookTypeDAO {
    private ConnDB conn = new ConnDB();

    //
    public Collection query(String strif) {
        BookTypeForm bookTypeForm = null;
        Collection bookTypeColl = new ArrayList();
        String sql = "";
        if (strif != "all" && strif != null && strif != "") {
            sql = "select * from tb_booktype where " + strif + "";
        } else {
            sql = "select * from tb_booktype";
        }
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                bookTypeForm = new BookTypeForm();
                bookTypeForm.setId(Integer.valueOf(rs.getString(1)));
                bookTypeForm.setTypeName(rs.getString(2));
                bookTypeForm.setDays(rs.getInt(3));
                bookTypeColl.add(bookTypeForm);
                System.out.print(bookTypeForm.getTypeName());
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return bookTypeColl;
    }

    //ĵĲ
    public BookTypeForm queryM(BookTypeForm bookTypeForm) {
        BookTypeForm bookTypeForm1 = null;
        String sql = "select * from tb_booktype where id=?";
        System.out.println("SQL:" + sql);
        ResultSet rs = conn.executeQuery(sql,bookTypeForm.getId());
        try {
            while (rs.next()) {
                bookTypeForm1 = new BookTypeForm();
                bookTypeForm1.setId(Integer.valueOf(rs.getString(1)));
                bookTypeForm1.setTypeName(rs.getString(2));
                bookTypeForm1.setDays(rs.getInt(3));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return bookTypeForm1;
    }

    //
    public int insert(BookTypeForm bookTypeForm) {
        String sql1 = "SELECT * FROM tb_booktype WHERE typename=?";
        ResultSet rs = conn.executeQuery(sql1,bookTypeForm.getTypeName());
        String sql = "";
        int falg = 0;
        try {
            if (rs.next()) {
                falg = 2;
            } else {
                sql = "Insert into tb_booktype (typename,days) values(?,?)";
                falg = conn.executeUpdate(sql,bookTypeForm.getTypeName(),bookTypeForm.getDays());
                System.out.println("͵SQL:" + sql);
            }
        } catch (SQLException ex) {
            falg = 0;
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        System.out.println("falg:" + falg);
        return falg;
    }

    //
    public int update(BookTypeForm bookTypeForm) {
        String sql = "Update tb_booktype set typename=?,days=? where id=?";
        try {
            int falg = conn.executeUpdate(sql,bookTypeForm.getTypeName(),bookTypeForm.getDays(),bookTypeForm.getId());
            System.out.println("SQL:" + sql);
            return falg;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }

    //
    public int delete(BookTypeForm bookTypeForm) {
        String sql = "Delete from tb_booktype where id=?";
        try {
            int falg = conn.executeUpdate(sql,bookTypeForm.getId());
            System.out.println("SQL:" + sql);
            return falg;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }
}
