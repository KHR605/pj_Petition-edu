package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AnswerDAO;
import model.AnswerDTO;
import model.PetitionDTO;
import vo.ActionForward;

public class InsertAnswerProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward=null;
		AnswerDTO answer = null;
	
		String petition_seq = (String)request.getParameter("seq");
		String answer_content = (String)request.getParameter("content");
		//System.out.println(sessionID);

		
			answer = new AnswerDTO();
			answer.setPetition_seq(petition_seq);
			answer.setAnswer_content(answer_content);
			
			AnswerDAO answerDAO = AnswerDAO.getInstance();
			int cnt = answerDAO.insertAnswer(answer);
			if(cnt > 0) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('답변 입력 성공.')");
				out.println("</script>");
			
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("writeAnswer.jsp?seq="+petition_seq+"");
			}
			
		return forward;
	}

}
