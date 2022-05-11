package controller.pds;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PdsDAO;
import dto.PdsVO;


@WebServlet("/pds.do")
public class pdsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public pdsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		PdsDAO pdao = PdsDAO.getInstance();
		
		List<PdsVO> list = pdao.pdsSelect();
		
		request.setAttribute("pdslist", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("pds/pds.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
