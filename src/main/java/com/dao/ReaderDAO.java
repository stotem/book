package com.dao;

import com.actionForm.ReaderForm;
import com.core.ConnDB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.logging.Logger;

public class ReaderDAO {
    private ConnDB conn = new ConnDB();

    //
    public Collection query(String strif) {
        ReaderForm readerForm = null;
        Collection readerColl = new ArrayList();
        String sql = "";
        if (strif != "all" && strif != null && strif != "") {
            sql = "select r.*,t.name as typename,t.number from tb_reader r left join tb_readertype t on r.typeid=t.id where " + strif + "";
        } else {
            sql = "select r.*,t.name as typename,t.number from tb_reader r left join tb_readertype t on r.typeid=t.id";
        }
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                readerForm = new ReaderForm();
                readerForm.setId(Integer.valueOf(rs.getString(1)));
                readerForm.setName(rs.getString(2));
                readerForm.setSex(rs.getString(3));
                readerForm.setBarcode(rs.getString(4));
                readerForm.setVocation(rs.getString(5));
                readerForm.setBirthday(rs.getString(6));
                readerForm.setPaperType(rs.getString(7));
                readerForm.setPaperNO(rs.getString(8));
                readerForm.setTel(rs.getString(9));
                readerForm.setEmail(rs.getString(10));
                readerForm.setCreateDate(rs.getString(11));
                readerForm.setOperator(rs.getString(12));
                readerForm.setRemark(rs.getString(13));
                readerForm.setTypeid(rs.getInt(14));
                readerForm.setTypename(rs.getString(15));
                readerForm.setNumber(rs.getInt(16));
                readerColl.add(readerForm);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return readerColl;
    }

    //ĵĲ
    public ReaderForm queryM(ReaderForm readerForm) {
        ReaderForm readerForm1 = null;
        String sql = "";
        if (readerForm.getId() != null) {
            sql = "select r.*,t.name as typename,t.number from tb_reader r left join tb_readertype t on r.typeid=t.id where r.id=" + readerForm.getId() + "";
        } else if (readerForm.getBarcode() != null) {
            sql = "select r.*,t.name as typename,t.number from tb_reader r left join tb_readertype t on r.typeid=t.id where r.barcode=" + readerForm.getBarcode() + "";
        }
        Logger.getLogger(getClass().getName()).info("ĶSQL:" + sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                readerForm1 = new ReaderForm();
                readerForm1.setId(Integer.valueOf(rs.getString(1)));
                readerForm1.setName(rs.getString(2));
                readerForm1.setSex(rs.getString(3));
                readerForm1.setBarcode(rs.getString(4));
                readerForm1.setVocation(rs.getString(5));
                readerForm1.setBirthday(rs.getString(6));
                readerForm1.setPaperType(rs.getString(7));
                readerForm1.setPaperNO(rs.getString(8));
                readerForm1.setTel(rs.getString(9));
                readerForm1.setEmail(rs.getString(10));
                readerForm1.setCreateDate(rs.getString(11));
                readerForm1.setOperator(rs.getString(12));
                readerForm1.setRemark(rs.getString(13));
                readerForm1.setTypeid(rs.getInt(14));
                readerForm1.setTypename(rs.getString(15));
                readerForm1.setNumber(rs.getInt(16));
                Logger.getLogger(getClass().getName()).info(rs.getString(2));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return readerForm1;
    }

    //
    public int insert(ReaderForm readerForm) {
        String sql1 = "SELECT * FROM tb_reader WHERE barcode=?";
        ResultSet rs = conn.executeQuery(sql1,readerForm.getBarcode());
        String sql = "";
        int falg = 0;
        try {
            if (rs.next()) {
                falg = 2;
            } else {
                sql = "Insert into tb_reader (name,sex,barcode,vocation,birthday,paperType,paperNO,tel,email,createDate,operator,remark,typeid) values('" + readerForm.getName() + "','" + readerForm.getSex() + "','" + readerForm.getBarcode() + "','" + readerForm.getVocation() + "','" + readerForm.getBirthday() + "','" + readerForm.getPaperType() + "','" + readerForm.getPaperNO() + "','" + readerForm.getTel() + "','" + readerForm.getEmail() + "','" + readerForm.getCreateDate() + "','" + readerForm.getOperator() + "','" + readerForm.getRemark() + "'," + readerForm.getTypeid() + ")";
                falg = conn.executeUpdate(sql);
                Logger.getLogger(getClass().getName()).info("SQL:" + sql);
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
    public int update(ReaderForm readerForm) {
        String sql = "Update tb_reader set sex='" + readerForm.getSex() + "',barcode='" + readerForm.getBarcode() + "',vocation='" + readerForm.getVocation() + "',birthday='" + readerForm.getBirthday() + "',paperType='" + readerForm.getPaperType() + "',paperNO='" + readerForm.getPaperNO() + "',tel='" + readerForm.getTel() + "',email='" + readerForm.getEmail() + "',remark='" + readerForm.getRemark() + "',typeid=" + readerForm.getTypeid() + " where id=" + readerForm.getId() + "";
        try {
            int falg = conn.executeUpdate(sql);
            Logger.getLogger(getClass().getName()).info("SQL:" + sql);
            return falg;
        } finally {
            conn.close();
        }
    }

    //
    public int delete(ReaderForm readerForm) {
        String sql = "Delete from tb_reader where id=?";
        try {
            int falg = conn.executeUpdate(sql,readerForm.getId());
            Logger.getLogger(getClass().getName()).info("SQL:" + sql);
            return falg;
        } finally {
            conn.close();
        }
    }
}
