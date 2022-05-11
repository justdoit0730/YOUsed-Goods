package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

@WebServlet("/checkUserNickname.do")
public class CheckUserNickname extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckUserNickname() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String nickname = request.getParameter("nickname");
		System.out.println(nickname);
		int result = new MemberDAO().memberNickCheck(nickname);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}

}
