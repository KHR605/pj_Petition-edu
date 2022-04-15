package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MypetitionDAO;
import vo.ActionForward;

public class DeletePetitionProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		String petition_seq = (String)request.getParameter("seq");
		MypetitionDAO petitionDeleteProService = new MypetitionDAO();
		
		int cnt = petitionDeleteProService.deletePetition(petition_seq);

		if(cnt < 1){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('fail');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}

		else{
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제완료');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			
			forward= new ActionForward();
	   		forward.setPath("/myPetition.jsp");
			
		}


		return forward;
	}

}
