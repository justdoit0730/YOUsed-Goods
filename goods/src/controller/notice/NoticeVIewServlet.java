package controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CmtDAO;
import dao.NoticeDAO;
import dto.CmtVO;
import dto.NoticeVO;
import utily.Criteria;


@WebServlet("/noticeview.do")
public class NoticeVIewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public NoticeVIewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		Criteria cri = new Criteria(pageNum, amount);
		
		NoticeDAO ndao = new NoticeDAO();
		CmtDAO cdao = new CmtDAO();
		List<CmtVO> clist = cdao.selectCmt(bno);		
		
		NoticeVO  nvo = ndao.noticeView(bno);
		NoticeVO prevo = ndao.preByBno(bno);
		NoticeVO nextvo = ndao.nextByBno(bno);
		
		request.setAttribute("view", nvo);
		request.setAttribute("prev", prevo);
		request.setAttribute("next", nextvo);
		request.setAttribute("cri", cri);
		request.setAttribute("cmtList", clist);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("notice/noticeview.jsp");
		rd.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
