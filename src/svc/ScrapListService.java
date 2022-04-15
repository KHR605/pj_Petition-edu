package svc;

import java.util.ArrayList;

import dao.ScrapDAO;
import model.PetitionDTO;



public class ScrapListService {
	public ArrayList<PetitionDTO> getScrapList(int page, int limit, String petition_seq, String user_id) throws Exception{
		
		ArrayList<PetitionDTO> ScrapList = null;
	
		
		ScrapDAO scrapdao = ScrapDAO.getInstance();
		ScrapList = scrapdao.selectScrapList(page, limit, petition_seq, user_id);
	
		return ScrapList;
		
	}
	
	public int getListCountScrap() throws Exception{
		int ScrapCount = 0;
		ScrapDAO scrapdao = ScrapDAO.getInstance();
		ScrapCount = scrapdao.selectListScrapCount();
		return ScrapCount;
	}
}
