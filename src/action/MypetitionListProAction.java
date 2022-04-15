package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PageInfo;
import model.PetitionDTO;
import svc.MypetitionListService;
import vo.ActionForward;

public class MypetitionListProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward=null;
		ArrayList<PetitionDTO> mypetitonList=new ArrayList<PetitionDTO>();
	  	int page=1;
		int limit=8;
		HttpSession session = request.getSession();
		String sessionID = (String)session.getAttribute("SessionUserId");
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		if(sessionID == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("history.back();");
			out.println("</script>");
		}else {
		
		MypetitionListService mypetitionListService = new MypetitionListService();
		int listCount=mypetitionListService.getListCountMypetition(sessionID);
		mypetitonList = mypetitionListService.getMyPetitionList(page,limit, sessionID);
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
		request.setAttribute("mypetitionList", mypetitonList);
		
		//System.out.println(pageInfo.getEndPage());
		
		forward= new ActionForward();
   		forward.setPath("/myPetition.jsp");
   		
		}
		return forward;
	}

}
