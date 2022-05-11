package controller.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dto.NoticeVO;


@WebServlet("/noticemodify.do")
public class NoticeModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public NoticeModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		NoticeDAO dao = new NoticeDAO();
		
		NoticeVO nvo = dao.noticeModify(bno);
		
		request.setAttribute("mvo", nvo);
		
		RequestDispatcher rd = request.getRequestDispatcher("notice/noticemodify.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		NoticeVO nvo = new NoticeVO();
		
		nvo.setBno(Integer.parseInt(request.getParameter("bno")));
		nvo.setTitle(request.getParameter("title"));
		nvo.setContent(request.getParameter("content"));
		
		NoticeDAO dao = new NoticeDAO();
		
		dao.noticeModifyPro(nvo);
		
		response.sendRedirect("notice.do");
	}

}
