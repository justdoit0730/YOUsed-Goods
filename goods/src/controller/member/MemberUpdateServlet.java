package controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberVO;
import utily.SecuriyPassword;


@WebServlet("/memberupdate.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = (String)request.getSession().getAttribute("userid");
		
		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = mdao.memberIdSelect(id);
		
		request.setAttribute("mupdate", mvo);
		
		RequestDispatcher rd = request.getRequestDispatcher("member/memberupdate.jsp");
		rd.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("utf-8");

		MemberVO mvo = new MemberVO();
		//vo에 담고
	
		mvo.setBno(Integer.parseInt(request.getParameter("bno")));
		mvo.setName(request.getParameter("name"));
		mvo.setNickname(request.getParameter("nickname"));
		String pw = request.getParameter("pw1");
		if(pw != null) {
			mvo.setPw(SecuriyPassword.encoding(request.getParameter("pw1")));
		}
		mvo.setPhone(request.getParameter("phone"));
		mvo.setEmail(request.getParameter("email"));
		
		//매서드 처리 
		
		MemberDAO mdao = new MemberDAO();
		
		mdao.memberUpdate(mvo);
		
		//인덱스 페이지 이동
		
		response.sendRedirect("main.do");
	}

}
