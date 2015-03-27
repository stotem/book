package com.dao;

import com.actionForm.BookForm;
import com.actionForm.BorrowForm;
import com.actionForm.ReaderForm;
import com.core.ConnDB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

public class BorrowDAO {
    ConnDB conn = new ConnDB();

    //***********************************************************
    public int insertBorrow(ReaderForm readerForm, BookForm bookForm, String operator) {
        //ȡϵͳ
        String sql1 = "select t.days from tb_bookinfo b left join tb_booktype t on b.typeid=t.id where b.id=?";
        ResultSet rs = conn.executeQuery(sql1, bookForm.getId());
        try {
            int days = 0;
            try {
                if (rs.next()) {
                    days = rs.getInt(1);
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DAY_OF_MONTH,days);
            String sql = "Insert into tb_borrow (readerid,bookid,borrowTime,backTime,operator) values(?,?,?,?,?)";
            int falg = conn.executeUpdate(sql,readerForm.getId(),bookForm.getId(),new java.sql.Date(System.currentTimeMillis()),new  java.sql.Date(calendar.getTime().getTime()),operator);
            System.out.println("SQL:" + sql);
            return falg;
        } finally {
            conn.close();
        }
    }

    //*************************************̽*********************************
    public int renew(int id) {
        String sql0 = "SELECT bookid FROM tb_borrow WHERE id=?";
        ResultSet rs1 = conn.executeQuery(sql0,id);
        int flag = 0;
        int bookid = 0;
        try {
            if (rs1.next()) {
                bookid = rs1.getInt(1);
            }
        }catch (SQLException e) {
            e.printStackTrace();
            return flag;
        } finally {
            try {
                rs1.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        try {
            //ȡϵͳ
            Date dateU = new Date();
            java.sql.Date date = new java.sql.Date(dateU.getTime());
            String sql1 = "select t.days from tb_bookinfo b left join tb_booktype t on b.typeid=t.id where b.id=?";
            ResultSet rs = conn.executeQuery(sql1,bookid);
            int days = 0;
            try {
                if (rs.next()) {
                    days = rs.getInt(1);
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }finally {
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
            //黹
            String date_str = String.valueOf(date);
            String dd = date_str.substring(8, 10);
            String DD = date_str.substring(0, 8) +
                    String.valueOf(Integer.parseInt(dd) + days);
            java.sql.Date backTime = java.sql.Date.valueOf(DD);

            String sql = "UPDATE tb_borrow SET backtime=? where id=?";
            flag = conn.executeUpdate(sql,backTime,id);

        } catch (NumberFormatException ex1) {
            ex1.printStackTrace();
        } finally {
            conn.close();
        }
        return flag;
    }

    //*************************************黹*********************************
    public int back(int id, String operator) {
        String sql0 = "SELECT readerid,bookid FROM tb_borrow WHERE id=?";
        ResultSet rs1 = conn.executeQuery(sql0,id);
        int flag = 0;
        int bookid = 0;
        int readerid = 0;
        try {
            if (rs1.next()) {
                readerid = rs1.getInt(1);
                bookid = rs1.getInt(2);
            }
        }catch (SQLException e) {
            e.printStackTrace();
            return flag;
        } finally {
            try {
                rs1.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        try {
            //ȡϵͳ
            Date dateU = new Date();
            java.sql.Date date = new java.sql.Date(dateU.getTime());
            String sql1 = "INSERT INTO tb_giveback (readerid,bookid,backTime,operator) VALUES(?,?,?,?)";
            int ret = conn.executeUpdate(sql1,readerid,bookid,date,operator);
            if (ret == 1) {
                String sql2 = "UPDATE tb_borrow SET ifback=1 where id=?";
                flag = conn.executeUpdate(sql2,id);
            } else {
                flag = 0;
            }
        } catch (NumberFormatException ex1) {
            ex1.printStackTrace();
        } finally {
            conn.close();
        }
        return flag;
    }

    //*****************************************************
    public Collection borrowinfo(String str) {
        String sql = "select borr.*,book.bookname,book.price,pub.pubname,bs.name bookcasename,r.barcode from (select * from tb_borrow where ifback=0) as borr left join tb_bookinfo book on borr.bookid=book.id join tb_publishing pub on book.isbn=pub.isbn join tb_bookcase bs on book.bookcase=bs.id join tb_reader r on borr.readerid=r.id where r.barcode=?";
        ResultSet rs = conn.executeQuery(sql,str);
        Collection coll = new ArrayList();
        BorrowForm form = null;
        try {
            while (rs.next()) {
                form = new BorrowForm();
                form.setId(Integer.valueOf(rs.getInt(1)));
                form.setBorrowTime(rs.getString(4));
                form.setBackTime(rs.getString(5));
                form.setBookName(rs.getString(8));
                form.setPrice(Float.valueOf(rs.getFloat(9)));
                form.setPubName(rs.getString(10));
                form.setBookcaseName(rs.getString(11));
                form.setBookId(rs.getInt(3));
                coll.add(form);
            }
        } catch (SQLException ex) {
            System.out.println("" + ex.getMessage());
        } finally {
            conn.close();
        }
        return coll;
    }

    //*******************************************************************
    public Collection bremind() {

        ResultSet rs = conn.executeQuery("select remindDay from tb_parameter where id=1");
        int day = 5;
        try {
            rs.next();
            day = rs.getInt("remindDay");
        }catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        Calendar calc = Calendar.getInstance();
        calc.add(Calendar.DAY_OF_MONTH, day);
        String sql = "select borr.borrowTime,borr.backTime,book.barcode,book.bookname,r.name readername,r.barcode readerbarcode from tb_borrow borr join tb_bookinfo book on book.id=borr.bookid join tb_reader r on r.id=borr.readerid where borr.ifBack=0 and borr.backTime <=?";
        rs = conn.executeQuery(sql,new java.sql.Date(calc.getTime().getTime()));
        System.out.println("ѵSQL:" + sql);
        Collection coll = new ArrayList();
        BorrowForm form = null;
        try {
            while (rs.next()) {
                form = new BorrowForm();
                form.setBorrowTime(rs.getString(1));
                form.setBackTime(rs.getString(2));
                form.setBookBarcode(rs.getString(3));
                form.setBookName(rs.getString(4));
                form.setReaderName(rs.getString(5));
                form.setReaderBarcode(rs.getString(6));
                coll.add(form);
                System.out.println("룺" + rs.getString(3));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            conn.close();
        }
        return coll;
    }

    //*************************Ĳ******************************************
    public Collection borrowQuery(String strif) {
        String sql = "";
        if (strif != "all" && strif != null && strif != "") {
            sql = "select * from (select borr.borrowTime,borr.backTime,book.barcode,book.bookname,r.name readername,r.barcode readerbarcode,borr.ifback from tb_borrow borr join tb_bookinfo book on book.id=borr.bookid join tb_reader r on r.id=borr.readerid) as borr where borr." + strif + "";
        } else {
            sql = "select * from (select borr.borrowTime,borr.backTime,book.barcode,book.bookname,r.name readername,r.barcode readerbarcode,borr.ifback from tb_borrow borr join tb_bookinfo book on book.id=borr.bookid join tb_reader r on r.id=borr.readerid) as borr";
        }
        ResultSet rs = conn.executeQuery(sql);
        System.out.println("ĲSQL:" + sql);
        Collection coll = new ArrayList();
        BorrowForm form = null;
        try {
            while (rs.next()) {
                form = new BorrowForm();
                form.setBorrowTime(rs.getString(1));
                form.setBackTime(rs.getString(2));
                form.setBookBarcode(rs.getString(3));
                form.setBookName(rs.getString(4));
                form.setReaderName(rs.getString(5));
                form.setReaderBarcode(rs.getString(6));
                form.setIfBack(rs.getInt(7));
                coll.add(form);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            conn.close();
        }
        return coll;
    }

    //*******************************************************************
    public Collection bookBorrowSort() {
        String sql = "select * from (SELECT bookid,count(bookid) as degree FROM tb_borrow group by bookid) as borr join (select b.*,c.name as bookcaseName,p.pubname,t.typename from tb_bookinfo b left join tb_bookcase c on b.bookcase=c.id join tb_publishing p on b.ISBN=p.ISBN join tb_booktype t on b.typeid=t.id where b.del=0) as book on borr.bookid=book.id order by borr.degree desc limit 10 ";
        System.out.println("У" + sql);
        Collection coll = new ArrayList();
        BorrowForm form = null;
        ResultSet rs = conn.executeQuery(sql);

        try {
            while (rs.next()) {
                form = new BorrowForm();
                form.setBookId(rs.getInt(1));
                form.setDegree(rs.getInt(2));
                form.setBookBarcode(rs.getString(3));
                form.setBookName(rs.getString(4));
                form.setAuthor(rs.getString(6));
                form.setPrice(Float.valueOf(rs.getString(9)));
                form.setStorage(rs.getInt(12));
                form.setBookcaseName(rs.getString(17));
                form.setPubName(rs.getString(18));
                form.setBookType(rs.getString(19));
                coll.add(form);
                System.out.print("RS" + rs.getString(4));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            conn.close();
        }
        return coll;
    }

    //***********************߽*************************************
    public Collection readerBorrowSort() {
        String sql = "select * from (SELECT readerid,count(readerid) as degree FROM tb_borrow group by readerid) as borr join (select r.*,t.name as typename,t.number from tb_reader r left join tb_readertype t on r.typeid=t.id) as reader on borr.readerid=reader.id order by borr.degree desc limit 10";
        Collection coll = new ArrayList();
        BorrowForm form = null;
        ResultSet rs = conn.executeQuery(sql);
        try {
//            if (rs != null) {
            while (rs.next()) {
                form = new BorrowForm();
                form.setReaderId(rs.getInt(1));
                form.setDegree(rs.getInt(2));
                form.setReaderName(rs.getString(4));
                form.setSex(rs.getString(5));
                form.setReaderBarcode(rs.getString(6));
                form.setBirthday(rs.getString(8));
                form.setPaperType(rs.getString(9));
                form.setPaperNo(rs.getString(10));
                form.setTel(rs.getString(11));
                form.setReaderType(rs.getString(17));
                coll.add(form);
            }
//            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            conn.close();
        }
        return coll;
    }
}
