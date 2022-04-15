package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ScrapDAO;
import model.ScrapDTO;
import vo.ActionForward;

public class RegistScrapProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward=null;
		ScrapDTO scrap = null;
		HttpSession session = request.getSession();
		String petition_seq = (String)request.getParameter("seq");
		String sessionID = (String)session.getAttribute("SessionUserId");
		//System.out.println(sessionID);

		if(sessionID == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("history.back();");
			out.println("</script>");
		}else {
			scrap = new ScrapDTO();
			scrap.setPetition_seq(petition_seq);
			scrap.setUser_id(sessionID);
			
			ScrapDAO scrapDAO = ScrapDAO.getInstance();
			int cnt = scrapDAO.insertScrap(scrap);
			if(cnt > 0) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('등록되었습니다.')");
				out.println("</script>");
			
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("ingpetiView.jsp?seq="+petition_seq+"");
			}
			
		}
		return forward;
	}

}
