package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.BoardDTO;
import model.PageInfo;
import model.PetitionDTO;
import svc.BoardListService;
import vo.ActionForward;

public class IndexProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ArrayList<PetitionDTO> articleList=new ArrayList<PetitionDTO>();
	  	int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		String search = request.getParameter("search_txt");
		
		if(search != null) {
			System.out.println(search);
			Controller allpetition = new Controller();
			int listCount=allpetition.selectListCountpeti(search);
			articleList = allpetition.selectAllPeti(page,limit, search);
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
			request.setAttribute("articleList", articleList);

			
			//System.out.println(pageInfo.getEndPage());
			
			ActionForward forward= new ActionForward();
	   		forward.setPath("index.jsp");
	   		return forward;
		}
		
		Controller allpetition = new Controller();
		int listCount=allpetition.selectListCountpeti();
		articleList = allpetition.selectAllPeti(page,limit);
   		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   	    int endPage = startPage+10-1;
   	    
   	    
   	   // System.out.println("page:"+page);
   	    //System.out.println("listCount:"+listCount);
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
		request.setAttribute("articleList", articleList);
		
		//System.out.println(pageInfo.getEndPage());
		
		ActionForward forward= new ActionForward();
   		forward.setPath("/index.jsp");
   		return forward;
	}

}
