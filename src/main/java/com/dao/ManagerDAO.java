package com.dao;

import com.actionForm.ManagerForm;
import com.core.ConnDB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class ManagerDAO {
    private ConnDB conn = new ConnDB();

    //��ѯ���
    public Collection query(String queryif) {
        ManagerForm managerForm = null;
        Collection managercoll = new ArrayList();
        String sql = "";
        if (queryif == null || queryif == "" || queryif == "all") {
            //�˴���ҪӦ��������
            sql = "select m.*,p.sysset,p.readerset,p.bookset,p.borrowback,p.sysquery from tb_manager m left join tb_purview p on m.id=p.id";
        } else {
            sql = "select m.*,p.sysset,p.readerset,p.bookset,p.borrowback,p.sysquery from tb_manager m left join tb_purview p on m.id=p.id where m.name='" + queryif + "'";
        }
        ResultSet rs = conn.executeQuery(sql);
        int a = 0;
        try {
            while (rs.next()) {
                managerForm = new ManagerForm();
                managerForm.setId(Integer.valueOf(rs.getString(1)));
                managerForm.setName(rs.getString(2));
                managerForm.setPwd(rs.getString(3));
                managerForm.setSysset(rs.getInt(4));
                managerForm.setReaderset(rs.getInt(5));
                managerForm.setBookset(rs.getInt(6));
                managerForm.setBorrowback(rs.getInt(7));
                managerForm.setSysquery(rs.getInt(8));
                managercoll.add(managerForm);
                a++;
            }
            System.out.println("��¼����" + a);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conn.close();
        }
        return managercoll;
    }

    /**
     * *****************************************************
     */
    public ManagerForm query_p(String str) {
        ManagerForm managerForm1 = null;
        String sql = "select m.*,p.sysset,p.readerset,p.bookset,p.borrowback,p.sysquery from tb_manager m left join tb_purview p on m.id=p.id where m.name=?";

        ResultSet rs = conn.executeQuery(sql,str);
        try {
            while (rs.next()) {
                managerForm1 = new ManagerForm();
                managerForm1.setId(Integer.valueOf(rs.getString(1)));
                managerForm1.setName(rs.getString(2));
                managerForm1.setPwd(rs.getString(3));
                managerForm1.setSysset(rs.getInt(4));
                managerForm1.setReaderset(rs.getInt(5));
                managerForm1.setBookset(rs.getInt(6));
                managerForm1.setBorrowback(rs.getInt(7));
                managerForm1.setSysquery(rs.getInt(8));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return managerForm1;
    }


    //����Ա�����֤
    public int checkManager(ManagerForm managerForm) {
        int flag = 0;
        String sql = "SELECT * FROM tb_manager where name=?";
        ResultSet rs = conn.executeQuery(sql, managerForm.getName());
        try {
            if (rs.next()) {
                String pwd = managerForm.getPwd();
                if (pwd.equals(rs.getString(3))) {
                    flag = 1;
                    rs.last();
                    int rowSum = rs.getRow();
                    rs.first();
                    if (rowSum != 1) {
                        flag = 0;
                        System.out.print("��ȡ��row��ֵ��" + sql + rowSum);
                    }
                } else {
                    flag = 0;
                }
            } else {
                flag = 0;
            }
        } catch (SQLException ex) {
            flag = 0;
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return flag;
    }

    //�޸�ʱӦ�õĲ�ѯ����
    public ManagerForm query_update(ManagerForm managerForm) {
        ManagerForm managerForm1 = null;
        String sql = "select m.*,p.sysset,p.readerset,p.bookset,p.borrowback,p.sysquery from tb_manager m left join tb_purview p on m.id=p.id where m.id=?";

        ResultSet rs = conn.executeQuery(sql, managerForm.getId());
        try {
            while (rs.next()) {
                managerForm1 = new ManagerForm();
                managerForm1.setId(Integer.valueOf(rs.getString(1)));
                managerForm1.setName(rs.getString(2));
                managerForm1.setPwd(rs.getString(3));
                managerForm1.setSysset(rs.getInt(4));
                managerForm1.setReaderset(rs.getInt(5));
                managerForm1.setBookset(rs.getInt(6));
                managerForm1.setBorrowback(rs.getInt(7));
                managerForm1.setSysquery(rs.getInt(8));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return managerForm1;
    }

    //��Ŀ���ʱӦ�õĲ�ѯ����
    public ManagerForm query_pwd(ManagerForm managerForm) {
        ManagerForm managerForm1 = null;
        String sql = "SELECT * FROM tb_manager WHERE name=?";
        ResultSet rs = conn.executeQuery(sql, managerForm.getName());
        try {
            while (rs.next()) {
                managerForm1 = new ManagerForm();
                managerForm1.setId(Integer.valueOf(rs.getString(1)));
                managerForm1.setName(rs.getString(2));
                managerForm1.setPwd(rs.getString(3));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return managerForm1;
    }

    //������
    public int insert(ManagerForm managerForm) {
        String sql1 = "SELECT * FROM tb_manager WHERE name=?";
        ResultSet rs = conn.executeQuery(sql1,managerForm.getName());
        String sql = "";
        int falg = 0;
        try {
            if (rs.next()) {
                falg = 2;
            } else {
                sql = "INSERT INTO tb_manager (name,pwd) values(?, ?)";
                falg = conn.executeUpdate(sql,managerForm.getName(),managerForm.getPwd());
                System.out.println("��ӹ���Ա��Ϣ��SQL��" + sql);
                conn.close();
            }
        } catch (SQLException ex) {
            falg = 0;
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            conn.close();
        }
        return falg;
    }

    //�޸����
    public int update(ManagerForm managerForm) {
        String sql1 = "SELECT * FROM tb_purview WHERE id=?";
        ResultSet rs = conn.executeQuery(sql1, managerForm.getId());
        String sql = "";
        int falg = 0;
        try {
            if (rs.next()) {
                sql = "Update tb_purview set sysset=?,readerset=?,bookset=?,borrowback=?,sysquery=? where id=?";
                falg = conn.executeUpdate(sql,managerForm.getSysset(),managerForm.getReaderset(),managerForm.getBookset(),managerForm.getBorrowback(),managerForm.getSysquery(),managerForm.getId());
            } else {
                sql = "INSERT INTO tb_purview values(?,?,?,?,?,?)";
                falg = conn.executeUpdate(sql,managerForm.getId(),managerForm.getSysset(),managerForm.getReaderset(),managerForm.getBookset(),managerForm.getBorrowback(),managerForm.getSysquery());
            }

        } catch (SQLException ex) {
            falg = 0;
            ex.printStackTrace();
        } finally {
            conn.close();
        }
        return falg;
    }

    //�޸Ĺ���Ա����
    public int updatePwd(ManagerForm managerForm) {
        String sql = "UPDATE tb_manager SET pwd=? where name=?";
        try {
            int ret = conn.executeUpdate(sql, managerForm.getPwd(),managerForm.getName());
            System.out.println("�޸Ĺ���Ա����ʱ��SQL��" + sql);
            return ret;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }

    //ɾ�����
    public int delete(ManagerForm managerForm) {
        String sql = "DELETE FROM tb_manager where id=?";
        try {
            int flag = conn.executeUpdate(sql, managerForm.getId());
            if (flag != 0) {
                String sql1 = "DELETE FROM tb_purview where id=?";
                conn.executeUpdate(sql1,managerForm.getId());
            }
            return flag;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }
}
