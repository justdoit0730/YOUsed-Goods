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


@WebServlet("/member.do")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("member/member.jsp");
		rd.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청
		request.setCharacterEncoding("utf-8");
		
		MemberVO mvo = new MemberVO();
		//vo에 담고
		mvo.setName(request.getParameter("name"));
		mvo.setId(request.getParameter("id"));
		mvo.setNickname(request.getParameter("nickname"));
		mvo.setPw(SecuriyPassword.encoding(request.getParameter("pw1")));
		mvo.setPhone(request.getParameter("phone"));
		mvo.setEmail(request.getParameter("email"));
		
		//매서드 처리 
		
		MemberDAO mdao = new MemberDAO();
		
		mdao.memberInsert(mvo);
		
		//인덱스 페이지 이동
		
		response.sendRedirect("main.do");
		
	}

}
