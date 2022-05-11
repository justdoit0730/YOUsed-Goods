package controller.pds;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PdsDAO;
import dao.PortfolioDAO;
import dto.PdsVO;


@WebServlet("/pdswrite.do")
public class pdsWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public pdsWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("pds/pdswrite.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String savepath = "upload"; //저장경로 "c:\\upload
		int maxPostSize = 20 * 1024 * 1024; //파일 저장 최대 용량
		String enctype="utf-8";
		
		ServletContext context = getServletContext();
		String path = context.getRealPath(savepath);
		System.out.println("서버상의 실제 디렉토리 : "+path);
		
		MultipartRequest multi = new MultipartRequest(
				request, //request 객체 
				path, //서버상의 업로드 되는 실제 디렉토리
				maxPostSize, //최대 업로드 크기
				enctype, //인코딩 방법
				new DefaultFileRenamePolicy() //동일한 이름이 존재하면 새로운 이름이 부여된다
				);
		//객체 생성하면서 업로드가 끝남
		
		String fileName = multi.getOriginalFileName("file"); //원본파일
		String fileRealName = multi.getFilesystemName("file"); //실제로 업로드된 파일의 이름 구하기
		System.out.println(fileRealName);
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String writer = multi.getParameter("writer");
				
		PdsVO pvo = new PdsVO();
		
		pvo.setTitle(title);
		pvo.setContent(content);
		pvo.setFilename(fileName);
		pvo.setFilerealname(fileRealName);
		pvo.setWriter(writer);
		
		PdsDAO pdao = PdsDAO.getInstance();
		
		pdao.pdsInsert(pvo);
		
		response.sendRedirect("pds.do");
	}

}
