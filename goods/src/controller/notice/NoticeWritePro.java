package controller.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dto.NoticeVO;


@WebServlet("/noticewritepro.do")
public class NoticeWritePro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public NoticeWritePro() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request encoding
		request.setCharacterEncoding("utf-8");
		
		NoticeVO nvo = new NoticeVO();
		
		nvo.setWriter(request.getParameter("writer"));
		nvo.setTitle(request.getParameter("title"));
		nvo.setContent(request.getParameter("content"));
		
		NoticeDAO dao = new NoticeDAO();
		
		dao.noticeInsert(nvo);
		
		response.sendRedirect("notice.do");
		
		
	}

}
