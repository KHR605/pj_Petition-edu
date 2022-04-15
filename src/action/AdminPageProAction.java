package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import dao.ToAnswerPetitionDAO;
import model.PageInfo;
import model.PetitionDTO;
import vo.ActionForward;

public class AdminPageProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward=null;
		ArrayList<PetitionDTO> ToAnswerList=new ArrayList<PetitionDTO>();
	  	int page=1;
		int limit=10;

		String petition_seq = (String)request.getParameter("seq");
		
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		
		ToAnswerPetitionDAO toAnswer = new ToAnswerPetitionDAO();
		int listCount=toAnswer.selectListToAnswerPeitionCount();
		ToAnswerList = toAnswer.selectToAnswerpetitionList(page,limit);
   		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   	    int endPage = startPage+10-1;
   	    
   	    
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
		request.setAttribute("toAnswerList", ToAnswerList);
		
		//System.out.println(pageInfo.getEndPage());
		
		forward= new ActionForward();
   		forward.setPath("admin_main.jsp");
   		
		return forward;
	}

}
