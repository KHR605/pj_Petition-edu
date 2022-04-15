package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.BoardDTO;
import vo.ActionForward;


public class BoardModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		String seq=request.getParameter("seq");
		Controller boardDetailService = new Controller();	
	   	BoardDTO article =boardDetailService.selectOne(seq);
	   	//String page = (String)request.getParameter("page");
	   	//request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("/board_modify_form.jsp");
   		return forward;
	}

}
