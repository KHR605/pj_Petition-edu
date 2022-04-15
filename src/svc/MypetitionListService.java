package svc;

import java.util.ArrayList;

import dao.MypetitionDAO;
import model.PetitionDTO;

public class MypetitionListService {
public ArrayList<PetitionDTO> getMyPetitionList(int page, int limit, String user_id) throws Exception{
		
		ArrayList<PetitionDTO> MypetitionList = null;
	
		
		MypetitionDAO mypetitondao = MypetitionDAO.getInstance();
		MypetitionList = mypetitondao.selectMypetitionList(page, limit, user_id);
	
		return MypetitionList;
		
	}
	
	public int getListCountMypetition(String user_id) throws Exception{
		int MypetitionCount = 0;
		MypetitionDAO mypetitondao = MypetitionDAO.getInstance();
		MypetitionCount = mypetitondao.selectListMypetitonCount(user_id);
		return MypetitionCount;
	}
}
