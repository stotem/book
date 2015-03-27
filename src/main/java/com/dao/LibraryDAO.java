package com.dao;

import com.actionForm.LibraryForm;
import com.core.ConnDB;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * <p>Title: LibraryManage</p>
 * <p/>
 * <p>Description: </p>
 * <p/>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p/>
 * <p>Company:mr </p>
 *
 * @author:wgh
 */
public class LibraryDAO {
    ConnDB conn = null;

    public LibraryDAO() {
        conn = new ConnDB();
    }

    public LibraryForm query() {
        LibraryForm libraryForm1 = null;
        String sql = "select * from tb_library where id=1";
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                libraryForm1 = new LibraryForm();
                libraryForm1.setId(Integer.valueOf(rs.getString(1)));
                libraryForm1.setLibraryname(rs.getString(2));
                libraryForm1.setCurator(rs.getString(3));
                libraryForm1.setTel(rs.getString(4));
                libraryForm1.setAddress(rs.getString(5));
                libraryForm1.setEmail(rs.getString(6));
                libraryForm1.setUrl(rs.getString(7));
                libraryForm1.setCreateDate(rs.getString(8));
                libraryForm1.setIntroduce(rs.getString(9));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return libraryForm1;
    }

    public int update(LibraryForm libraryForm) {
        String sql = "UPDATE tb_library SET libraryname=?,curator=?,tel=?,address=?,email=?,url=?,createDate=?,introduce=? where id=1";
        try {
            int ret = conn.executeUpdate(sql,libraryForm.getLibraryname(),libraryForm.getCurator(),libraryForm.getTel(),libraryForm.getAddress(),libraryForm.getEmail(),libraryForm.getUrl(),libraryForm.getCreateDate(),libraryForm.getIntroduce());
            System.out.println("�޸�ͼ�����Ϣʱ��SQL��" + sql);
            return ret;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }


}
