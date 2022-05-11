package controller.portfolio;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PortfolioDAO;
import dto.PortfolioVO;


@WebServlet("/portfolioUpdate.do")
public class PortfolioUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String bno = request.getParameter("bno");
			
			PortfolioDAO pDao = PortfolioDAO.getInstance();
			PortfolioVO pVo = pDao.PortfolioView(bno);
			
			request.setAttribute("product", "pVo");
			RequestDispatcher dispatcher = request.getRequestDispatcher("portfolio/portfolioUpdate.jsp");
			dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}
}
