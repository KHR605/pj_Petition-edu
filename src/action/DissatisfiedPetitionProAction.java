package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DissatisfiedDAO;
import model.PageInfo;
import model.PetitionDTO;
import vo.ActionForward;

public class DissatisfiedPetitionProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int page = 1;
		int limit = 8;
		String search = request.getParameter("search_txt");
		if(request.getParameter("page")!=null){
			page = Integer.parseInt(request.getParameter("page"));
			//System.out.println(page);
		}
		
		if(search != null) {
			DissatisfiedDAO dissatisfiedPetiList = new DissatisfiedDAO();
			System.out.println(search);
			int listCount = dissatisfiedPetiList.selectListDissatisfiedCount(search); 
		   	ArrayList<PetitionDTO> article = dissatisfiedPetiList.selectDissatisfiedPetitionList(page, limit, search);
		   	int maxPage=(int)((double)listCount/limit+0.95); 
	   		int startPage = (((int) ((double)page / 8 + 0.9)) - 1) * 8 + 1;
	   	    int endPage = startPage+8-1;
	   	    
	   	    if (endPage> maxPage) endPage= maxPage;

			PageInfo pageInfo = new PageInfo();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);	
			request.setAttribute("pageInfo", pageInfo);
		   	//String page = (String)request.getParameter("page");
		   	//request.setAttribute("page", page);
		   	request.setAttribute("dissatisfiedList", article);
		   	
		   	ActionForward forward = new ActionForward();
	   		forward.setPath("/dissatisfied.jsp");
	   		
	   		return forward;
		}
		
		DissatisfiedDAO dissatisfiedPetiList = new DissatisfiedDAO();
		int listCount = dissatisfiedPetiList.selectListDissatisfiedCount(); 
	   	ArrayList<PetitionDTO> article = dissatisfiedPetiList.selectDissatisfiedPetitionList(page, limit);
	   	int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 8 + 0.9)) - 1) * 8 + 1;
   	    int endPage = startPage+8-1;
   	    
   	    if (endPage> maxPage) endPage= maxPage;

		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
	   	//String page = (String)request.getParameter("page");
	   	//request.setAttribute("page", page);
	   	request.setAttribute("dissatisfiedList", article);
	   	
	   	ActionForward forward = new ActionForward();
   		forward.setPath("/dissatisfied.jsp");
   		
   		return forward;
	}

}
