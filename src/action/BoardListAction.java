package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDTO;
import model.PageInfo;
import svc.BoardListService;
import vo.ActionForward;



 public class BoardListAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		// System.out.println("BoardListAction start");
		ArrayList<BoardDTO> articleList=new ArrayList<BoardDTO>();
	  	int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		String search = request.getParameter("boardSearch");
		
		if(search != null) {
			System.out.println(search);
			BoardListService boardListService = new BoardListService();
			int listCount=boardListService.getListBoardSearchCount(search);
			articleList = boardListService.getArticleBoardSearchList(page,limit, search);
	   		int maxPage=(int)((double)listCount/limit+0.95); 
	   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
	   	    int endPage = startPage+10-1;
	   	    
	   	  
	   	   // System.out.println("page:"+page);
	   	    System.out.println("listCount:"+listCount);
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
	   		forward.setPath("/board.jsp?search='"+search+"'");
	   		return forward;
		}
		
		BoardListService boardListService = new BoardListService();
		int listCount=boardListService.getListCount();
		articleList = boardListService.getArticleList(page,limit);
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
   		forward.setPath("/board.jsp");
   		return forward;
   		
	 }
	 
 }