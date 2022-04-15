package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.PetitionDTO;

public class ProcessInsert {
	
	static ProcessInsert pi = new ProcessInsert();
	public static ProcessInsert instance() {
		return pi;
	}
	
	private SqlSessionFactory sqlsession = Sqlsession.getSqlsession();
	
	public void insertPeti(PetitionDTO dto) {
		SqlSession sql = sqlsession.openSession();
		sql.insert("insert", dto);
		sql.commit();
	}
}
