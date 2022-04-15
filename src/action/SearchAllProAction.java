package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import dao.SearchDAO;
import model.BoardDTO;
import model.PageInfo;
import model.PetitionDTO;
import vo.ActionForward;

public class SearchAllProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String search = request.getParameter("search");
		String radioCk = request.getParameter("radio_menu");
		String StartDate = request.getParameter("StartDate");
		String EndDate = request.getParameter("EndDate");
		ActionForward forward = null;
		
		System.out.println("검색어: "+search);
		System.out.println("radioCk: " +radioCk);
		System.out.println("StartDate: " +StartDate);
		System.out.println("EndDate: "+EndDate);
		
		SearchDAO searchDAO = new SearchDAO();
		Controller controller = new Controller();
		PageInfo pageinfo = new PageInfo();
		
			
		// 寃��깋 �쟾泥� 媛��닔
		int allListCount = searchDAO.searchEverythingCount(search,radioCk);
		//System.out.println("alllistCount: "+allListCount);
		pageinfo.setListCount(allListCount);
		request.setAttribute("allListcount", pageinfo);
		
		// -- 留뚮즺�맂 泥��썝 寃��깋 諛� 媛��닔
		int endListCount = searchDAO.selectListEndPetiSearchCount(search, radioCk);
		//System.out.println("endlistCount: "+endListCount);
		pageinfo.setEndpetiCount(endListCount);
		ArrayList<PetitionDTO> endArticle = searchDAO.selectEndPetitionSearchList(search, radioCk);
		request.setAttribute("endArticle", endArticle);
		request.setAttribute("endListcount", pageinfo);
		// -- 留뚮즺�맂 泥��썝 寃��깋 諛� 媛��닔
		
		
		// -- 吏꾪뻾以� 泥��썝 寃��깋 諛� 媛��닔
		int ingListCount = controller.selectListCountIngpeti(search, radioCk);
		//System.out.println("inglistCount: "+ingListCount);
		pageinfo.setIngpetiCount(ingListCount);
		ArrayList<PetitionDTO> ingArticle = searchDAO.selectIngPetitionSearchList(search, radioCk);
		request.setAttribute("ingArticle", ingArticle);
		request.setAttribute("ingListcount", pageinfo);
		// -- 吏꾪뻾以� 泥��썝 寃��깋
		
		
		// -- 怨듭��궗�빆 寃��깋 諛� 媛��닔
		int boardListCount = controller.searchBoardCountList(search, radioCk);
		//System.out.println("boardlistCount: "+boardListCount);
		pageinfo.setBoardlistCount(boardListCount);
		ArrayList<BoardDTO> boardArticle = searchDAO.selectBoardSearchList(search, radioCk);
		request.setAttribute("boardArticle", boardArticle);
		request.setAttribute("boardListcount", pageinfo);
		// -- 怨듭��궗�빆 寃��깋
		
		// -- 寃��깋�뼱 由ы꽩
		pageinfo.setSearch(search);
		request.setAttribute("search", pageinfo);
		
		request.setAttribute("radioVal", radioCk);
		
		forward = new ActionForward();
   		forward.setPath("/search.jsp");
		
		
		
		return forward;
	}
	

}
