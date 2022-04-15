package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PageInfo;
import model.PetitionDTO;
import mybatis.ProcessPetitionList;
import svc.BoardListService;

public class PetitionListSortImp implements CommandInter {
	
	static PetitionListSortImp subject = new PetitionListSortImp();
	public static PetitionListSortImp instance() { // �떛湲��넠
		return subject;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		PageInfo pageInfo = new PageInfo();
		int page = 1;
		int limit = 8;
		
		if(request.getParameter("page")!=null){
			page = Integer.parseInt(request.getParameter("page"));
			//System.out.println(page);
		}
		String search = request.getParameter("search_txt");
		if(search != null){
			//System.out.println(search);
			pageInfo.setStartrow((page-1)*8);
			pageInfo.setSearch(search);
			ProcessPetitionList show = ProcessPetitionList.instance();
			List<PetitionDTO> list = show.getPetitionSearchMaximumList(pageInfo);
			request.setAttribute("petitionsortList", list);
			
			BoardListService boardListService = new BoardListService();
			int listCount = boardListService.getListPetitionSearchCount(search);
			//System.out.println(listCount);
			int maxPage=(int)((double)listCount/limit+0.95); 
	   		int startPage = (((int) ((double)page / 8 + 0.9)) - 1) * 8 + 1;
	   	    int endPage = startPage+8-1;
			
	   	    if (endPage> maxPage) endPage= maxPage;

			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);	
			request.setAttribute("pageInfo", pageInfo);
			
			return "maximumSort.jsp";
		}else {
		pageInfo.setStartrow((page-1)*8);
		
		ProcessPetitionList show = ProcessPetitionList.instance();
		List<PetitionDTO> list = show.selectPetitionSortAgreeNo(pageInfo);
		request.setAttribute("petitionsortList", list);
		
		BoardListService boardListService = new BoardListService();
		int listCount = boardListService.getListCountIngpeti();
		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 8 + 0.9)) - 1) * 8 + 1;
   	    int endPage = startPage+8-1;
		
   	    if (endPage> maxPage) endPage= maxPage;

		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		}
		return "maximumSort.jsp";
	}

}
