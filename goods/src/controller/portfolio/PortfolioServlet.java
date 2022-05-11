package controller.portfolio;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PortfolioDAO;
import dto.PortfolioVO;


@WebServlet("/portfolio.do")
public class PortfolioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PortfolioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		PortfolioDAO ndao = new PortfolioDAO();
		
		List<PortfolioVO> list = ndao.portfolioSelect();
		
		request.setAttribute("portfolioList", list);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("portfolio/portfolio.jsp");
		rd.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
