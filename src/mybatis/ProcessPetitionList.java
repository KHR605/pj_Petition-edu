package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.PageInfo;
import model.PetitionDTO;

public class ProcessPetitionList {
	static ProcessPetitionList ppl = new ProcessPetitionList();
	public static ProcessPetitionList instance() {
		return ppl;
	}
	
	private SqlSessionFactory sqlSession = Sqlsession.getSqlsession();
	
	public List<PetitionDTO> selectPetition(PageInfo pageinfo) {
		SqlSession sql = sqlSession.openSession();
		List<PetitionDTO> list = sql.selectList("sel", pageinfo);
		

		//System.out.println("selectPetition 호출: " + list.size());
		
		
		return list;
	}
	
	public List<PetitionDTO> selectPetitionSortAgreeNo(PageInfo pageinfo){
		SqlSession sql = sqlSession.openSession();
		List<PetitionDTO> list = sql.selectList("sortagreeno",pageinfo);
		
		return list;
	}
	
	public List<PetitionDTO> getPetitionSearchList(PageInfo pageinfo){
		//System.out.println("getPetitionSearchList 호출됨");
		SqlSession sql = sqlSession.openSession();
		List<PetitionDTO> list = sql.selectList("searchsel",pageinfo);
		return list;
	}
	
	public List<PetitionDTO> getPetitionSearchMaximumList(PageInfo pageinfo){
		SqlSession sql = sqlSession.openSession();
		List<PetitionDTO> list = sql.selectList("searchmaximumsel",pageinfo);
		return list;
	}
}
