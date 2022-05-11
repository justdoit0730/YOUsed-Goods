package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


@WebServlet("/certicompare.do")
public class certiCompareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public certiCompareServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String certinumber = request.getParameter("certinumber");
		//data:{"certinumber":certinumber} 넘어온 데이터 요청
		String AuthenticationKey = (String)request.getSession().getAttribute("AuthenticationKey");
		//saveKey.setAttribute("AuthenticationKey", AuthenticationKey); 세션에 저장시킨 값
		
		JSONObject obj = new JSONObject();
		
		if(!AuthenticationKey.equals(certinumber)) {
			obj.put("msg", "인증번호가 일치하지 않습니다!");
			obj.put("check","nok");
		}else {
			obj.put("msg", "마이페이지에 입장합니다!");
			obj.put("check","ok");
			// {msg:"회원정보를 수정 합니다",check:"ok"}
		}
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("allplication/x-json, charset=utf-8");
		response.getWriter().print(obj);
	}

}
