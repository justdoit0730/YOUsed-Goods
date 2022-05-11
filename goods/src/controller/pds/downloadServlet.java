package controller.pds;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/download.do")
public class downloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public downloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String fileName = request.getParameter("file");
		
		String directory = this.getServletContext().getRealPath("upload");
		System.out.println(directory);
		//upload 폴더의 절대경로를 구한다
		
		File file = new File(directory+"\\"+fileName);
		//java.io 패키지는 기존의 파일이나 폴더에 대한 제어를 사용하는 file 클래스를 제공한다
		
		String mimeType = getServletContext().getMimeType(file.toString());
		//File 클래스 객체의 toString() 메서드는 자신이 가진 해당 경로값을 리턴한다
		
		if(mimeType == null) {
			response.setContentType("application/octet-stream");
		}
		
		String downloadName= null;
		
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			//request.getHeader("user-agent")를 이용한 웹 브라우저 종류 확인하기
			downloadName = new String(fileName.getBytes("UTF-8"),"8859_1");
			//브라우저에 따른 한글 인코딩 문제 처리
		}else {
			downloadName = new String(fileName.getBytes("EUC-KR"),"8859_1");
		}
		
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
