package controller.portfolio;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PortfolioDAO;

@WebServlet("/protfolioDelete.do")
public class PortfolioDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public PortfolioDelete() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		PortfolioDAO dao = new PortfolioDAO();
		dao.portfolioDelete(bno);
		response.sendRedirect("protfolio.do");
		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
