package controller.qa;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PortfolioDAO;
import dto.PortfolioVO;


@WebServlet("/qaview.do")
public class qaview extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public qaview() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
int bno = Integer.parseInt(request.getParameter("bno"));
		
		PortfolioDAO qdao = new PortfolioDAO();
		PortfolioVO qvo = qdao.PortfolioView(bno);
		
		request.setAttribute("qview", qvo);
			
		RequestDispatcher rd = request.getRequestDispatcher("qna/qawrite.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
