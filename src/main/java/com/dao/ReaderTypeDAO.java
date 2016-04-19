package com.dao;

import com.actionForm.ReaderTypeForm;
import com.core.ConnDB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.logging.Logger;

public class ReaderTypeDAO {
    private ConnDB conn = new ConnDB();

    //
    public Collection query(String strif) {
        ReaderTypeForm readerTypeForm = null;
        Collection readerTypeColl = new ArrayList();
        String sql = "";
        if (strif != "all" && strif != null && strif != "") {
            sql = "select * from tb_readertype where " + strif + "";
        } else {
            sql = "select * from tb_readertype";
        }
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                readerTypeForm = new ReaderTypeForm();
                readerTypeForm.setId(Integer.valueOf(rs.getString(1)));
                readerTypeForm.setName(rs.getString(2));
                readerTypeForm.setNumber(rs.getInt(3));
                readerTypeColl.add(readerTypeForm);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return readerTypeColl;
    }

    //ĵĲ
    public ReaderTypeForm queryM(ReaderTypeForm readerTypeForm) {
        ReaderTypeForm readerTypeForm1 = null;
        String sql = "select * from tb_readertype where id=?";
        Logger.getLogger(getClass().getName()).info("SQL:" + sql);
        ResultSet rs = conn.executeQuery(sql,readerTypeForm.getId());
        try {
            while (rs.next()) {
                readerTypeForm1 = new ReaderTypeForm();
                readerTypeForm1.setId(Integer.valueOf(rs.getString(1)));
                readerTypeForm1.setName(rs.getString(2));
                readerTypeForm1.setNumber(rs.getInt(3));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return readerTypeForm1;
    }

    //
    public int insert(ReaderTypeForm readerTypeForm) {
        String sql1 = "SELECT * FROM tb_readertype WHERE name=?";
        ResultSet rs = conn.executeQuery(sql1,readerTypeForm.getName());
        String sql = "";
        int falg = 0;
        try {
            if (rs.next()) {
                falg = 2;
            } else {
                sql = "Insert into tb_readertype (name,number) values(?,?)";
                falg = conn.executeUpdate(sql,readerTypeForm.getName(),readerTypeForm.getNumber());
                Logger.getLogger(getClass().getName()).info("͵SQL:" + sql);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            falg = 0;
        } finally {
            conn.close();

        }
        Logger.getLogger(getClass().getName()).info("falg:" + falg);
        return falg;
    }

    //
    public int update(ReaderTypeForm readerTypeForm) {
        String sql = "Update tb_readertype set name=?,number=? where id=?";
        try {
            int falg = conn.executeUpdate(sql,readerTypeForm.getName(),readerTypeForm.getNumber(),readerTypeForm.getId() );
            Logger.getLogger(getClass().getName()).info("SQL:" + sql);
            return falg;
        } finally {
            conn.close();
        }
    }

    //
    public int delete(ReaderTypeForm readerTypeForm) {
        String sql = "Delete from tb_readertype where id=?";
        try {
            int falg = conn.executeUpdate(sql,readerTypeForm.getId() );
            Logger.getLogger(getClass().getName()).info("SQL:" + sql);
            return falg;
        } finally {
            conn.close();
        }
    }

}
