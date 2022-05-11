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
import dto.CommentVO;
import dto.PortfolioVO;


@WebServlet("/portfolioview.do")
public class PortfolioView extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PortfolioView() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		PortfolioDAO pdao = new PortfolioDAO();
		PortfolioVO nvo = pdao.PortfolioView(bno);
		
		
		//댓글
		List<CommentVO> clist = pdao.commentView(bno);
		
		request.setAttribute("pview", nvo);
		request.setAttribute("cview", clist);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/portfolio/portfolioview.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
