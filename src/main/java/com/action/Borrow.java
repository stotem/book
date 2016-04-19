package com.action;

import com.actionForm.BookForm;
import com.actionForm.BorrowForm;
import com.actionForm.ReaderForm;
import com.dao.BookDAO;
import com.dao.BorrowDAO;
import com.dao.ReaderDAO;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;
import java.util.logging.Logger;

public class Borrow extends Action {
    private BorrowDAO borrowDAO = null;
    private ReaderDAO readerDAO = null;
    private BookDAO bookDAO = null;
    private ReaderForm readerForm = new ReaderForm();

    public Borrow() {
        this.borrowDAO = new BorrowDAO();
        this.readerDAO = new ReaderDAO();
        this.bookDAO = new BookDAO();
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        BorrowForm borrowForm = (BorrowForm) form;
        String action = request.getParameter("action");
        Logger.getLogger(getClass().getName()).info("\nborrow*********************action=" + action);
        if (action == null || "".equals(action)) {
            request.setAttribute("error", "您的操作有误！");
            return mapping.findForward("error");
        }
        if ("bookBorrowSort".equals(action)) {
            return bookBorrowSort(mapping, form, request, response);
        }
        if ("readerBorrowSort".equals(action)) {
            return readerBorrowSort(mapping, form, request, response);
        }
        if ("bookborrow".equals(action)) {
            return bookborrow(mapping, form, request, response);
        }
        if ("bookrenew".equals(action)) {
            return bookrenew(mapping, form, request, response);
        }
        if ("bookback".equals(action)) {
            return bookback(mapping, form, request, response);
        }
        if ("Bremind".equals(action)) {
            return bremind(mapping, form, request, response);
        }
        if ("borrowQuery".equals(action)) {
            return borrowQuery(mapping, form, request, response);
        }
        if ("addBookborrow".equals(action)) {
            return addBookborrow(mapping, form, request, response);
        }

        request.setAttribute("error", "操作失败！");
        return mapping.findForward("error");
    }

    /**
     * ******************图书借阅排行**********************
     */
    private ActionForward bookBorrowSort(ActionMapping mapping, ActionForm form,
                                         HttpServletRequest request,
                                         HttpServletResponse response) {
        request.setAttribute("bookBorrowSort", borrowDAO.bookBorrowSort());
        return mapping.findForward("bookBorrowSort");

    }

    /**
     * ******************图书借阅查询**********************
     */
    private ActionForward borrowQuery(ActionMapping mapping, ActionForm form,
                                      HttpServletRequest request,
                                      HttpServletResponse response) {
        String str = null;
        String flag[] = request.getParameterValues("flag");
        String f = request.getParameter("f");
        String key = request.getParameter("key");
        if (flag != null) {
            String aa = flag[0];
            if ("a".equals(aa)) {
                if (f != null && key != null) {
                    str = f + " like '" + key + "%'";
                }
            }
            if ("b".equals(aa)) {
                String sdate = request.getParameter("sdate");
                String edate = request.getParameter("edate");
                if (sdate != null && edate != null) {
                    str = "borrowTime between '" + sdate + "' and '" + edate +
                            "'";
                }
                Logger.getLogger(getClass().getName()).info("日期" + str);
            }
            //同时选择日期和条件进行查询
            if (flag.length == 2) {
                if (f != null && key != null) {
                    str = f + " like '" + key+ "%'";
                }
                Logger.getLogger(getClass().getName()).info("日期和条件");
                String sdate = request.getParameter("sdate");
                String edate = request.getParameter("edate");
                String str1 = null;
                if (sdate != null && edate != null) {
                    str1 = "borrowTime between '" + sdate + "' and '" + edate +
                            "'";
                }
                str = str + " and borr." + str1;
                Logger.getLogger(getClass().getName()).info("条件和日期：" + str);
            }
        }
        request.setAttribute("borrowQuery", borrowDAO.borrowQuery(str));
        System.out.print("条件查询图书借阅信息时的str:" + str);
        return mapping.findForward("borrowQuery");
    }

    /**
     * ******************到期提醒**********************
     */
    private ActionForward bremind(ActionMapping mapping, ActionForm form,
                                  HttpServletRequest request,
                                  HttpServletResponse response) {
        request.setAttribute("Bremind", borrowDAO.bremind());
        return mapping.findForward("Bremind");
    }

    /**
     * ******************读者借阅排行**********************
     */
    private ActionForward readerBorrowSort(ActionMapping mapping, ActionForm form,
                                           HttpServletRequest request,
                                           HttpServletResponse response) {
        request.setAttribute("readerBorrowSort", borrowDAO.readerBorrowSort());
        return mapping.findForward("readerBorrowSort");
    }

    /**
     * ******************图书借阅**********************
     */
    private ActionForward bookborrow(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
        //查询读者信息
        //ReaderForm readerForm=(ReaderForm)form;  //此处一定不能使用该语句进行转换
        readerForm.setBarcode(request.getParameter("barcode"));
        ReaderForm reader = (ReaderForm) readerDAO.queryM(readerForm);
        request.setAttribute("readerinfo", reader);
        //查询读者的借阅信息
        Collection borrowInfo = borrowDAO.borrowinfo(request.getParameter("barcode"));
        request.setAttribute("borrowinfo", borrowInfo);
        //完成借阅
        String f = request.getParameter("f");
        String key = request.getParameter("inputkey");
        if (key != null && !key.equals("")) {
            request.setAttribute("inputkey", key);
            Collection books = bookDAO.queryByKeyword(f, key);
            if (books != null && !books.isEmpty() && borrowInfo != null && !borrowInfo.isEmpty()) {
                BookForm tmpBookForm = null;
                BorrowForm tmpBorrowForm = null;
                for (Object tmpObject : books.toArray()) {
                    tmpBookForm = (BookForm) tmpObject;
                    for (Object borrowObject : borrowInfo) {
                        tmpBorrowForm = (BorrowForm) borrowObject;
                        if (tmpBorrowForm.getBookId() == tmpBookForm.getId()) {
                            books.remove(tmpObject);
                        }
                    }
                }
            }
            request.setAttribute("bookinfo", books);
        }
        return mapping.findForward("bookborrow");
    }

    private ActionForward addBookborrow(ActionMapping mapping, ActionForm form,
                                           HttpServletRequest request,
                                           HttpServletResponse response) {
        ReaderForm reader = (ReaderForm) readerDAO.queryM(readerForm);
        request.setAttribute("readerinfo", reader);
        request.setAttribute("f",request.getParameter("f"));
        request.setAttribute("inputkey",request.getParameter("inputkey"));
        String operator = request.getParameter("operator");
        String bookId = request.getParameter("bookId");
        if (bookId == null || bookId.trim().length() == 0) {
            request.setAttribute("error", "未查找到借阅的书籍!");
            return mapping.findForward("error");
        }
        BookForm bookForm = new BookForm();
        bookForm.setId(Integer.valueOf(bookId.trim()));
        int ret = borrowDAO.insertBorrow(reader, bookForm, operator);
        if (ret == 1) {
            request.setAttribute("bar", request.getParameter("barcode"));
            return mapping.findForward("bookborrowok");

        } else {
            request.setAttribute("error", "添加借阅信息失败!");
            return mapping.findForward("error");
        }
    }

    /**
     * ******************图书继借**********************
     */
    private ActionForward bookrenew(ActionMapping mapping, ActionForm form,
                                    HttpServletRequest request,
                                    HttpServletResponse response) {
        //查询读者信息
        readerForm.setBarcode(request.getParameter("barcode"));
        ReaderForm reader = (ReaderForm) readerDAO.queryM(readerForm);
        request.setAttribute("readerinfo", reader);
        //查询读者的借阅信息
        request.setAttribute("borrowinfo", borrowDAO.borrowinfo(request.getParameter("barcode")));
        if (request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (id > 0) { //执行继借操作
                int ret = borrowDAO.renew(id);
                if (ret == 0) {
                    request.setAttribute("error", "图书继借失败!");
                    return mapping.findForward("error");
                } else {
                    request.setAttribute("bar", request.getParameter("barcode"));
                    return mapping.findForward("bookrenewok");
                }
            }
        }
        return mapping.findForward("bookrenew");
    }

    /**
     * ******************图书归还**********************
     */
    private ActionForward bookback(ActionMapping mapping, ActionForm form,
                                   HttpServletRequest request,
                                   HttpServletResponse response) {
        //查询读者信息
        readerForm.setBarcode(request.getParameter("barcode"));
        ReaderForm reader = (ReaderForm) readerDAO.queryM(readerForm);
        request.setAttribute("readerinfo", reader);
        //查询读者的借阅信息
        request.setAttribute("borrowinfo", borrowDAO.borrowinfo(request.getParameter("barcode")));
        if (request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            String operator = request.getParameter("operator");
            if (id > 0) { //执行归还操作
                int ret = borrowDAO.back(id, operator);
                if (ret == 0) {
                    request.setAttribute("error", "图书归还失败!");
                    return mapping.findForward("error");
                } else {
                    request.setAttribute("bar", request.getParameter("barcode"));
                    return mapping.findForward("bookbackok");
                }
            }
        }
        return mapping.findForward("bookback");
    }
}
