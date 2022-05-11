package controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
//서블릿이란 : 자바를 이용하여 웹에서 실행되는 프로그램을 작성하는 기술
import dto.NoticeVO;
import dto.PageVO;
import utily.Criteria;

@WebServlet("/notice.do")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String sel="";
		String word="";
		String query="";
		
		int pageNum = 1;
		int amount = 10;
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		
		if(request.getParameter("sel") != null && !request.getParameter("word").equals("")) {
			sel = request.getParameter("sel"); //title
			word = request.getParameter("word"); //일본
			query = sel + " like '%" + word + "%'"; //title like '%일본%'
		}
		
		
		NoticeDAO ndao = new NoticeDAO();
		
		Criteria cri = new Criteria();

		cri.setPageNum(pageNum);
		cri.setAmount(amount);
		cri.setType(sel);
		cri.setKeyword(word);
		
		List<NoticeVO> list = ndao.getListWithPaging(cri, query);
		
		int count = ndao.noticeAllCount(query);
		
		PageVO pvo = new PageVO(cri, count);
		
		request.setAttribute("pageMaker", pvo);
		request.setAttribute("noticeList", list);
		request.setAttribute("count", count);
		
		RequestDispatcher rd = request.getRequestDispatcher("notice/notice.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
