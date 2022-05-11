package controller.gallery;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.GalleryDAO;
import dto.GalleryVO;


@WebServlet("/gallerywrite.do")
public class GalleryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public GalleryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDO(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDO(request, response);
	}
	
	protected void actionDO(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI(); // /hanulso/gallery.do
		System.out.println(uri);
		String conPath = request.getContextPath(); // /hanulso
		System.out.println(conPath);
		String com = uri.substring(conPath.length()); // /gallery.do
		System.out.println(conPath.length());
		System.out.println("com : " + com);
		
		String viewPage = null;
		
		GalleryDAO dao = new GalleryDAO();
		
		switch(com) {
		case "/gallery/gallery.do":
			//제어명령문
			List<GalleryVO> list = dao.getGallerySelect();
			request.setAttribute("glist", list);
			
			viewPage="gallery/gallery.jsp";
			break;
			
		case "/gallerywrite.do":
			//제어명령문
			viewPage="gallery/gallerywrite.jsp";
			break;
		case "/gallery/gallerywritepro.do":
			//제어명령문
			request.setCharacterEncoding("utf-8");
			
			String saveDirectory = "upload"; //업로드 하는 폴더 따로 만들어 처리 하시오
			
			ServletContext context = request.getServletContext();
			String path = context.getRealPath(saveDirectory);
			int maxPostSize = 20 * 1024 * 1024;
			String enctype="utf-8";
			
			
			MultipartRequest multi = new MultipartRequest(
					request, 
					path, 
					maxPostSize,
					enctype,
					new DefaultFileRenamePolicy()
					); //객체 생성하면서 업로드 완료 된다
			
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String imgurl = multi.getFilesystemName("imgurl");
			
			GalleryVO gvo = new GalleryVO();
			
			gvo.setTitle(title);
			gvo.setContent(content);
			gvo.setImgurl(imgurl);
			
			dao.galleryWrite(gvo);
			
			response.sendRedirect("gallery.do");
			
			break;
		case "/viewcount.do":
			int bno = Integer.parseInt(request.getParameter("bno"));
			int result = dao.setAddCount(bno);
			
			if(result > 0) {
				int count = dao.getAddCount(bno);
				PrintWriter out = response.getWriter();
				out.print(count);
			}
			break;
			
		} //case
		
		if(viewPage != null) {
			RequestDispatcher rd = request.getRequestDispatcher(viewPage);
			rd.forward(request, response);
		}
		
		
		
		
	}

}
