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


@WebServlet("/qa.do")
public class qaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public qaServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		request.setCharacterEncoding("utf-8");
		
		QaDAO qdao = new QaDAO();
		QaVO qlist = qdao.qaView(bno);
		
		request.setAttribute("qaList", qlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("qna/qa.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
