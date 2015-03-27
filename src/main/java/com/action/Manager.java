package com.action;

import com.actionForm.ManagerForm;
import com.dao.ManagerDAO;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Manager extends Action {
    private ManagerDAO managerDAO = null;

    public Manager() {
        this.managerDAO = new ManagerDAO();
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        String action = request.getParameter("action");
        System.out.println("获取的查询字符串：" + action);
        if (action == null || "".equals(action)) {
            return mapping.findForward("error");
        } else if ("login".equals(action)) {
            return managerLogin(mapping, form, request,
                    response);
        } else if ("managerAdd".equals(action)) {
            return managerAdd(mapping, form, request, response);
        } else if ("managerQuery".equals(action)) {
            return managerQuery(mapping, form, request, response);
        } else if ("managerModifyQuery".equals(action)) {
            return managerModifyQuery(mapping, form, request, response);
        } else if ("managerModify".equals(action)) {
            return managerModify(mapping, form, request, response);
        } else if ("managerDel".equals(action)) {
            return managerDel(mapping, form, request, response);
        } else if ("querypwd".equals(action)) {
            return pwdQuery(mapping, form, request, response);
        } else if ("modifypwd".equals(action)) {
            return modifypwd(mapping, form, request, response);
        }
        request.setAttribute("error", "操作失败！");
        return mapping.findForward("error");
    }

    //管理员身份验证

    public ActionForward managerLogin(ActionMapping mapping, ActionForm form,
                                      HttpServletRequest request,
                                      HttpServletResponse response) {
        ManagerForm managerForm = (ManagerForm) form;
        managerForm.setName(managerForm.getName());
        managerForm.setPwd(managerForm.getPwd());
        int ret = managerDAO.checkManager(managerForm);
        System.out.print("验证结果ret的值:" + ret);
        if (ret == 1) {
            HttpSession session = request.getSession();
            session.setAttribute("manager", managerForm.getName());
            return mapping.findForward("managerLoginok");
        }
        request.setAttribute("error", "您输入的管理员名称或密码错误！");
        return mapping.findForward("error");

    }

    //查询管理员信息
    private ActionForward managerQuery(ActionMapping mapping, ActionForm form,
                                       HttpServletRequest request,
                                       HttpServletResponse response) {
        String str = null;
        request.setAttribute("managerQuery", managerDAO.query(str));
        return mapping.findForward("managerQuery");
    }

    //添加管理员信息
    private ActionForward managerAdd(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
        ManagerForm managerForm = (ManagerForm) form;
        managerForm.setName(managerForm.getName());
        managerForm.setPwd(managerForm.getPwd());
        int ret = managerDAO.insert(managerForm);
        System.out.println("返回值ret：" + ret);
        if (ret == 1) {
            return mapping.findForward("managerAdd");
        } else if (ret == 2) {
            request.setAttribute("error", "该管理员信息已经添加！");
            return mapping.findForward("error");
        } else {
            request.setAttribute("error", "添加管理员信息失败！");
            return mapping.findForward("error");
        }
    }

    //查询修改管理员信息
    private ActionForward managerModifyQuery(ActionMapping mapping, ActionForm form,
                                             HttpServletRequest request,
                                             HttpServletResponse response) {
        ManagerForm managerForm = (ManagerForm) form;
        managerForm.setId(Integer.valueOf(request.getParameter("id")));
        System.out.print("查询到的id:" + request.getParameter("id"));
        request.setAttribute("managerQueryif",
                managerDAO.query_update(managerForm));
        return mapping.findForward("managerQueryModify");
    }

    //修改密码时查询
    private ActionForward pwdQuery(ActionMapping mapping, ActionForm form,
                                   HttpServletRequest request,
                                   HttpServletResponse response) {
        ManagerForm managerForm = (ManagerForm) form;
        HttpSession session = request.getSession();
        String manager = (String) session.getAttribute("manager");
        managerForm.setName(manager);
        System.out.print("查询到的manager:" + manager);
        request.setAttribute("pwdQueryif",
                managerDAO.query_pwd(managerForm));
        return mapping.findForward("pwdQueryModify");
    }

    //修改管理员信息
    private ActionForward managerModify(ActionMapping mapping, ActionForm form,
                                        HttpServletRequest request,
                                        HttpServletResponse response) {
        ManagerForm managerForm = (ManagerForm) form;
        managerForm.setId(managerForm.getId());
        managerForm.setName(managerForm.getName());
        managerForm.setPwd(managerForm.getPwd());
        managerForm.setSysset(managerForm.getSysset());
        managerForm.setReaderset(managerForm.getReaderset());
        managerForm.setBookset(managerForm.getBookset());
        managerForm.setBorrowback(managerForm.getBorrowback());
        managerForm.setSysquery(managerForm.getSysquery());
        int ret = managerDAO.update(managerForm);
        if (ret == 0) {
            request.setAttribute("error", "修改管理员信息失败！");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("managerModify");
        }
    }

    //删除管理员信息
    private ActionForward managerDel(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
        ManagerForm managerForm = (ManagerForm) form;
        managerForm.setId(Integer.valueOf(request.getParameter("id")));
        int ret = managerDAO.delete(managerForm);
        if (ret == 0) {
            request.setAttribute("error", "删除管理员信息失败！");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("managerDel");
        }
    }

    //修改管理员密码
    private ActionForward modifypwd(ActionMapping mapping, ActionForm form,
                                    HttpServletRequest request,
                                    HttpServletResponse response) {
        ManagerForm managerForm = (ManagerForm) form;
        managerForm.setName(managerForm.getName());
        managerForm.setPwd(managerForm.getPwd());
        int ret = managerDAO.updatePwd(managerForm);
        if (ret == 0) {
            request.setAttribute("error", "更改口令失败！");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("pwdModify");
        }
    }
}
