package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import dao.SearchDAO;
import model.PageInfo;
import model.PetitionDTO;
import svc.BoardListService;
import vo.ActionForward;

public class EndPetitionListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		Controller endPetiList = new Controller();
		
		int page = 1;
		int limit = 8;
		String search = request.getParameter("search_txt");
		if(request.getParameter("page")!=null){
			page = Integer.parseInt(request.getParameter("page"));
			//System.out.println(page);
		}
		
		if(search != null) {
			//System.out.println(search);
			SearchDAO searchlist = new SearchDAO();
			int listCount = searchlist.selectListEndPetiSearchCount(search); 
		   	ArrayList<PetitionDTO> article = searchlist.selectEndPetitionSearchList(page, limit, search);
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
		   	request.setAttribute("article", article);
		   	
		   	ActionForward forward = new ActionForward();
	   		forward.setPath("/endPetitionList.jsp");
	   		
	   		return forward;
			}
		
		int listCount = endPetiList.selectListCountEndpeti(); 
	   	ArrayList<PetitionDTO> article = endPetiList.selectEndPeti(page, limit);
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
	   	request.setAttribute("article", article);
	   	
	   	ActionForward forward = new ActionForward();
   		forward.setPath("/endPetitionList.jsp");
   		
   		return forward;
	}

}
