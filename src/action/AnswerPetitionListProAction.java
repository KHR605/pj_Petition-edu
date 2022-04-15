package action;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AnswerDAO;
import model.AnsweredDTO;
import model.PageInfo;
import model.PetitionDTO;
import svc.MypetitionListService;
import vo.ActionForward;

public class AnswerPetitionListProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward=null;
		ArrayList<AnsweredDTO> answeredpetitionList=new ArrayList<AnsweredDTO>();
	  	int page=1;
		int limit=8;

		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		
		AnswerDAO answerPetitionList = new AnswerDAO();
		int listCount=answerPetitionList.selectAnsweredPetitionListCount();
		answeredpetitionList = answerPetitionList.selectAnsweredPetitionList(page,limit);
   		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 8 + 0.9)) - 1) * 8 + 1;
   	    int endPage = startPage+8-1;
   	    
   	    
   	   // System.out.println("page:"+page);
   	   // System.out.println("listCount:"+listCount);
   	    //System.out.println("maxpage: "+maxPage);
   	    //System.out.println("startPage: "+startPage);
   	    //System.out.println("endPage: "+endPage);
   	
   	    
   		if (endPage> maxPage) endPage= maxPage;

   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("answeredpetitionList", answeredpetitionList);
		
		//System.out.println(pageInfo.getEndPage());
		
		forward= new ActionForward();
   		forward.setPath("/answerPetition.jsp");
   		
		return forward;
	}

}
