package com.dao;

import com.actionForm.ParameterForm;
import com.core.ConnDB;

import java.sql.ResultSet;
import java.util.logging.Logger;

public class ParameterDAO {
    ConnDB conn = null;

    public ParameterDAO() {
        conn = new ConnDB();
    }

    public ParameterForm query() {
        ParameterForm libraryForm1 = null;
        String sql = "select * from tb_parameter where id=1";
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                libraryForm1 = new ParameterForm();
                libraryForm1.setId(Integer.valueOf(rs.getString(1)));
                libraryForm1.setCost(rs.getInt(2));
                libraryForm1.setValidity(rs.getInt(3));
                libraryForm1.setRemindDay(rs.getInt(4));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return libraryForm1;
    }

    public int update(ParameterForm parameterForm) {
        String sql = "UPDATE tb_parameter SET cost=?,validity=?,remindDay=? where id=1";
        try {
            int ret = conn.executeUpdate(sql,parameterForm.getCost(),parameterForm.getValidity(),parameterForm.getRemindDay());
            Logger.getLogger(getClass().getName()).info("修改系统参数:" + sql);
            return ret;
        } finally {
            conn.close();

        }
    }

}
