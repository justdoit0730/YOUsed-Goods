package controller.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import utily.SecuriyPassword;


@WebServlet("/login.do")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


    String url="";
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("login/login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = SecuriyPassword.encoding(request.getParameter("pw"));
		
		MemberDAO mdao = new MemberDAO();
		
		int result = mdao.memberIdPwSearch(id, pw);
		
		HttpSession session = request.getSession();
		
		String nickname= null;
		
		if(result == 1) {
			session.setAttribute("userid", id);
			
			nickname = mdao.memberNickSelect(id);
			
			session.setAttribute("nickname", nickname);
			response.sendRedirect("main.do");
		}else if(result == 0) {
			request.setAttribute("msg", "비밀번호를 확인하세요");
			url="login/login.jsp";
			fff(request, response);
		}else if(result == -1) {
			request.setAttribute("msg", "일치하는 회원이 없습니다");
			url="login/login.jsp";
			fff(request, response);
		}
	}
	
	protected void fff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

};