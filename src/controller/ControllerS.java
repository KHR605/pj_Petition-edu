package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.BoardListAction;
import vo.ActionForward;

@WebServlet("*.do")
public class ControllerS extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
	
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
	
	
		//System.out.println("ReqeustURI: " +RequestURI);
		//System.out.println("contextPath: " +contextPath);
		//System.out.println("command: "+command);

		
		String param = (String)request.getParameter("param");
		
		try {
		if(param.equals("ins")) {
			InsertPeti insert = InsertPeti.instance();
			
				String data = insert.InsertPeti(request, response);
				request.getRequestDispatcher(data).forward(request, response);
			
		
		}
		else if(param.equals("select")) {
			PetitionListImp show = PetitionListImp.instance();
			
				String view = show.showData(request, response);
				request.getRequestDispatcher(view).forward(request, response);

		}
		else if(param.equals("maximum")) {
			PetitionListSortImp show = PetitionListSortImp.instance();
				String view = show.showData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
		}
		else if(param.equals("latest")) {
			PetitionListLatestImp show = PetitionListLatestImp.instance();
			
				String view = show.showData(request, response);
				request.getRequestDispatcher(view).forward(request, response);

		}
		
		
		else {
			
		}
		}catch(Exception e) {
			
		}
		}
		
}
