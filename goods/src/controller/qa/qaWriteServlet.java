package controller.qa;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QaDAO;
import dto.QaVO;


@WebServlet("/qawrite.do")
public class qaWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public qaWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("qna/qawrite.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
				request.setCharacterEncoding("utf-8");
				
				QaVO qvo = new QaVO();
				
				qvo.setNickname(request.getParameter("nickname"));
				qvo.setTitle(request.getParameter("title"));
				qvo.setContent(request.getParameter("content"));
				
				QaDAO dao = QaDAO.getInstance();
				
				dao.qaInsert(qvo);
				
				response.sendRedirect("qa.do");
	}

}
