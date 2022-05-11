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
import dto.NoticeVO;
import dto.PortfolioVO;


@WebServlet("/portfolioSearch.do")
public class PortfolioSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public PortfolioSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  request.setCharacterEncoding("UTF-8");

		     String sel="";
		     String word="";
		     String query="";
		     if(request.getParameter("sel") != null && !request.getParameter("word").equals("")) {
		       sel = request.getParameter("sel");
		       word = request.getParameter("word");
		       
		       if(sel.equals("1")) {
		    	   sel="title ";
		       }else if(sel.equals("2")){
		    	   sel="content ";
		       }
		     
		       query =  sel +" LIKE '%" + word + "%'";
		     }

		     PortfolioDAO ndao = new PortfolioDAO();
		     List<PortfolioVO> list = ndao.PortfolioSelect(query);
		     
		 	request.setAttribute("portfolioList", list);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("portfolio/portfolio.jsp");
			rd.forward(request, response);
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
