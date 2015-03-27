package com.dao;

import com.actionForm.BookCaseForm;
import com.core.ConnDB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class BookCaseDAO {
    private ConnDB conn = new ConnDB();

    //
    public Collection query(String strif) {
        BookCaseForm bookCaseForm1 = null;
        Collection bookcaseColl = new ArrayList();
        String sql = "";
        if (strif != "all" && strif != null && strif != "") {
            sql = "select * from tb_bookcase where " + strif + "";
        } else {
            sql = "select * from tb_bookcase";
        }
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                bookCaseForm1 = new BookCaseForm();
                bookCaseForm1.setId(Integer.valueOf(rs.getString(1)));
                bookCaseForm1.setName(rs.getString(2));
                bookcaseColl.add(bookCaseForm1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return bookcaseColl;
    }

    //ĵĲ
    public BookCaseForm queryM(BookCaseForm bookCaseForm) {
        BookCaseForm bookCaseForm1 = null;
        String sql = "select * from tb_bookcase where id=?";
        System.out.println("SQL:" + sql);
        ResultSet rs = conn.executeQuery(sql,bookCaseForm.getId());
        try {
            while (rs.next()) {
                bookCaseForm1 = new BookCaseForm();
                bookCaseForm1.setId(Integer.valueOf(rs.getString(1)));
                bookCaseForm1.setName(rs.getString(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return bookCaseForm1;
    }

    //
    public int insert(BookCaseForm bookCaseForm) {
        String sql1 = "SELECT * FROM tb_bookcase WHERE name=?";
        ResultSet rs = conn.executeQuery(sql1, bookCaseForm.getName());
        String sql = "";
        int falg = 0;
        try {
            if (rs.next()) {
                falg = 2;
            } else {
                sql = "Insert into tb_bookcase (name) values(?)";
                falg = conn.executeUpdate(sql, bookCaseForm.getName());
                System.out.println("SQL:" + sql);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        System.out.println("falg:" + falg);
        return falg;
    }

    //
    public int update(BookCaseForm bookCaseForm) {
        String sql = "Update tb_bookcase set name=? where id=?";
        try {
            int falg = conn.executeUpdate(sql,bookCaseForm.getName(),bookCaseForm.getId());
            System.out.println("SQL:" + sql);
            return falg;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }

    //
    public int delete(BookCaseForm bookCaseForm) {
        String sql = "Delete from tb_bookcase where id=?";
        try {
            int falg = conn.executeUpdate(sql, bookCaseForm.getId());
            System.out.println("SQL:" + sql);
            return falg;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }

}
