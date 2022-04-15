package svc;


import java.sql.Connection;
import java.util.ArrayList;

import controller.Controller;
import model.BoardDTO;
import model.PetitionDTO;


public class BoardListService {

	public int getListCount() throws Exception{
		int listCount = 0;
		Controller control = Controller.getInstance();
		listCount = control.selectListCount();
		return listCount;
		
	}

	public ArrayList<BoardDTO> getArticleList(int page, int limit) throws Exception{
		
		ArrayList<BoardDTO> articleList = null;
	
		Controller control = Controller.getInstance();
		articleList = control.selectAll(page, limit);
	
		return articleList;
		
	}
	
	public int getListCountpeti() throws Exception{
		int petiListCount = 0;
		Controller control = Controller.getInstance();
		petiListCount = control.selectListCountpeti();
		return petiListCount;
	}
	
	public int getListCountIngpeti() throws Exception{
		int ingpetiListCount = 0;
		Controller control = Controller.getInstance();
		ingpetiListCount = control.selectListCountIngpeti();
		return ingpetiListCount;
	}
	
	public int getListBoardSearchCount(String search) throws Exception{
		int searchboardList = 0;
		Controller control = Controller.getInstance();
		searchboardList = control.searchBoardCountList(search);
		return searchboardList;
	}
	
	public ArrayList<BoardDTO> getArticleBoardSearchList(int page, int limit, String search) throws Exception{
		
		ArrayList<BoardDTO> articleList = null;
	
		Controller control = Controller.getInstance();
		articleList = control.searchBoardList(page, limit, search);
	
		return articleList;
		
	}
	
	public int getListPetitionSearchCount(String search) throws Exception{
		int searchpetitionList = 0;
		Controller control = Controller.getInstance();
		searchpetitionList = control.searchPetitionCountList(search);
		return searchpetitionList;
	}
	

}
