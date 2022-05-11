package controller.notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.CmtDAO;
import dto.CmtVO;
@WebServlet("/noticeCmt.do")
public class NoticeCmtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeCmtServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//cmtList
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-json; charset=UTF-8");
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		CmtDAO cdao = new CmtDAO();
		ArrayList<CmtVO> cList = cdao.selectCmt(bno);
		System.out.println("cList : "+cList);
		
		Gson gson = new Gson();
		String cmtList =gson.toJson(cList);
		System.out.println("cmtList : "+cmtList);
		
		PrintWriter out = response.getWriter();
		out.print(cmtList);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//cmtWrite
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-json; charset=UTF-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		CmtVO cvo = new CmtVO();
		cvo.setBno(bno);
		cvo.setWriter(writer);
		cvo.setContent(content);
		
		CmtDAO cdao = new CmtDAO();
		int cmtResult = cdao.cmtInsert(cvo);
		
		PrintWriter out = response.getWriter();
		out.print(cmtResult);
	}

}
