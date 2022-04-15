package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.BoardDTO;
import vo.ActionForward;

public class BoardModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		BoardDTO dto = new BoardDTO();
		Controller control = new Controller();
		ActionForward forward = null;
		int cnt = 0;
		String seq = request.getParameter("seq");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		dto.setSeq(seq);
		dto.setContent(content);
		dto.setTitle(title);
		
		cnt = control.boardUpdate(dto);
		
		if(cnt < 0) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('failed to update');");
			out.println("history.back()");
			out.println("</script>");
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('success');");
			out.println("</script>");
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("view.jsp?seq="+dto.getSeq());
		}
		
		return forward;
	}

}
