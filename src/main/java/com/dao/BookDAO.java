package com.dao;

import com.actionForm.BookForm;
import com.core.ConnDB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.logging.Logger;

public class BookDAO {
    private ConnDB conn = new ConnDB();

    //
    public Collection query(String strif) {
        BookForm bookForm = null;
        Collection bookColl = new ArrayList();
        String sql = "";
        if (strif != "all" && strif != null && strif != "") {
            sql = "select * from (select b.*,c.name as bookcaseName,p.pubname as publishing,t.typename from tb_bookinfo b left join tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN join tb_booktype t on b.typeid=t.id where b.del=0)  as book where book." + strif + "'";
        } else {
            sql = "select b.*,c.name as bookcaseName,p.pubname as publishing,t.typename from tb_bookinfo b left join tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN join tb_booktype t on b.typeid=t.id where b.del=0";
        }
        Logger.getLogger(getClass().getName()).info("SQL:" + sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                bookForm = new BookForm();
                bookForm.setBarcode(rs.getString(1));
                bookForm.setBookName(rs.getString(2));
                bookForm.setTypeId(rs.getInt(3));
                bookForm.setAuthor(rs.getString(4));
                bookForm.setTranslator(rs.getString(5));
                bookForm.setIsbn(rs.getString(6));
                bookForm.setPrice(Float.valueOf(rs.getString(7)));  //˴ת
                bookForm.setPage(rs.getInt(8));
                bookForm.setBookcaseid(rs.getInt(9));
                bookForm.setStorage(rs.getInt(10));
                bookForm.setInTime(rs.getString(11));
                bookForm.setOperator(rs.getString(12));
                bookForm.setDel(rs.getInt(13));
                bookForm.setId(Integer.valueOf(rs.getString(14)));
                bookForm.setBookcaseName(rs.getString(15));
                bookForm.setPublishing(rs.getString(16));
                bookForm.setTypeName(rs.getString(17));
                bookColl.add(bookForm);
                System.out.print(bookForm.getTypeName());
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return bookColl;
    }

    //ĵĲ
    public BookForm queryM(BookForm bookForm) {
        BookForm bookForm1 = null;
        String sql = "select b.*,c.name as bookcaseName,p.pubname as publishing,t.typename from tb_bookinfo b left join tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN join tb_booktype t on b.typeid=t.id where b.id=?";
        Logger.getLogger(getClass().getName()).info("SQL:" + sql);
        ResultSet rs = conn.executeQuery(sql,bookForm.getId());
        try {
            while (rs.next()) {
                bookForm1 = new BookForm();
                bookForm1.setBarcode(rs.getString(1));
                bookForm1.setBookName(rs.getString(2));
                bookForm1.setTypeId(rs.getInt(3));
                bookForm1.setAuthor(rs.getString(4));
                bookForm1.setTranslator(rs.getString(5));
                bookForm1.setIsbn(rs.getString(6));
                bookForm1.setPrice(Float.valueOf(rs.getString(7)));  //˴ת
                bookForm1.setPage(rs.getInt(8));
                bookForm1.setBookcaseid(rs.getInt(9));
                bookForm1.setStorage(rs.getInt(10));
                bookForm1.setInTime(rs.getString(11));
                bookForm1.setOperator(rs.getString(12));
                bookForm1.setDel(rs.getInt(13));
                bookForm1.setId(Integer.valueOf(rs.getString(14)));
                bookForm1.setBookcaseName(rs.getString(15));
                bookForm1.setPublishing(rs.getString(16));
                bookForm1.setTypeName(rs.getString(17));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return bookForm1;
    }

    public Collection queryByKeyword(String f, String key) {
        Collection collection = new ArrayList();
        BookForm bookForm1 = null;
        String sql = "select b.*,c.name as bookcaseName,p.pubname as publishing,t.typename from tb_bookinfo b left join tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN join tb_booktype t on b.typeid=t.id where b." + f + " like '" + key + "%'";
        Logger.getLogger(getClass().getName()).info("SQL:"+ sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                bookForm1 = new BookForm();
                bookForm1.setBarcode(rs.getString(1));
                bookForm1.setBookName(rs.getString(2));
                bookForm1.setTypeId(rs.getInt(3));
                bookForm1.setAuthor(rs.getString(4));
                bookForm1.setTranslator(rs.getString(5));
                bookForm1.setIsbn(rs.getString(6));
                bookForm1.setPrice(Float.valueOf(rs.getString(7)));  //˴ת
                bookForm1.setPage(rs.getInt(8));
                bookForm1.setBookcaseid(rs.getInt(9));
                bookForm1.setStorage(rs.getInt(10));
                bookForm1.setInTime(rs.getString(11));
                bookForm1.setOperator(rs.getString(12));
                bookForm1.setDel(rs.getInt(13));
                bookForm1.setId(Integer.valueOf(rs.getString(14)));
                bookForm1.setBookcaseName(rs.getString(15));
                bookForm1.setPublishing(rs.getString(16));
                bookForm1.setTypeName(rs.getString(17));
                collection.add(bookForm1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return collection;
    }

    public BookForm queryB(String f, String key) {
        BookForm bookForm1 = null;
        String sql = "select b.*,c.name as bookcaseName,p.pubname as publishing,t.typename from tb_bookinfo b left join tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN join tb_booktype t on b.typeid=t.id where b." + f + "='" + key + "'";
        Logger.getLogger(getClass().getName()).info("SQL:"+ sql);
        ResultSet rs = conn.executeQuery(sql);
        try {
            if (rs.next()) {
                bookForm1 = new BookForm();
                bookForm1.setBarcode(rs.getString(1));
                bookForm1.setBookName(rs.getString(2));
                bookForm1.setTypeId(rs.getInt(3));
                bookForm1.setAuthor(rs.getString(4));
                bookForm1.setTranslator(rs.getString(5));
                bookForm1.setIsbn(rs.getString(6));
                bookForm1.setPrice(Float.valueOf(rs.getString(7)));  //˴ת
                bookForm1.setPage(rs.getInt(8));
                bookForm1.setBookcaseid(rs.getInt(9));
                bookForm1.setStorage(rs.getInt(10));
                bookForm1.setInTime(rs.getString(11));
                bookForm1.setOperator(rs.getString(12));
                bookForm1.setDel(rs.getInt(13));
                bookForm1.setId(Integer.valueOf(rs.getString(14)));
                bookForm1.setBookcaseName(rs.getString(15));
                bookForm1.setPublishing(rs.getString(16));
                bookForm1.setTypeName(rs.getString(17));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return bookForm1;
    }

    //
    public int insert(BookForm bookForm) {
        String sql1 = "SELECT * FROM tb_bookinfo WHERE barcode=? or bookname=?";
        ResultSet rs = conn.executeQuery(sql1,bookForm.getBarcode(),bookForm.getBookName());
        String sql = "";
        int falg = 0;
        try {
            if (rs.next()) {
                falg = 2;
            } else {
                sql = "Insert into tb_bookinfo (barcode,bookname,typeid,author,translator,isbn,price,page,bookcase,storage,inTime,operator) " +
                        "values(?,?,?,?,?,?,?,?,?,?,?,?)";
                falg = conn.executeUpdate(sql,bookForm.getBarcode(),bookForm.getBookName(),bookForm.getTypeId(),bookForm.getAuthor(),bookForm.getTranslator(),bookForm.getIsbn(),bookForm.getPrice(),bookForm.getPage(),bookForm.getBookcaseid(),bookForm.getStorage(),bookForm.getInTime(),bookForm.getOperator());
                Logger.getLogger(getClass().getName()).info("SQL:" + sql);
            }
        } catch (SQLException ex) {
            falg = 0;
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        Logger.getLogger(getClass().getName()).info("falg:" + falg);
        return falg;
    }

    //
    public int update(BookForm bookForm) {
        String sql = "Update tb_bookinfo set typeid=?,author=?,translator=?,isbn=?,price=?,page=?,bookcase=?,storage=? where id=?";
        try {
            int falg = conn.executeUpdate(sql,bookForm.getTypeId(),bookForm.getAuthor(),bookForm.getTranslator(),bookForm.getIsbn(),bookForm.getPrice(),bookForm.getPage(),bookForm.getBookcaseid(),bookForm.getStorage(),bookForm.getId());
            Logger.getLogger(getClass().getName()).info("SQL:" + sql);
            return falg;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }

    //
    public int delete(BookForm bookForm) {
        String sql = "UPDATE tb_bookinfo SET del=1 where id=?";
        try {
            int falg = conn.executeUpdate(sql,bookForm.getId());
            Logger.getLogger(getClass().getName()).info("SQL:" + sql);
            return falg;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }

}
