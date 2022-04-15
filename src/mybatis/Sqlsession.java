package mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Sqlsession {
	private static SqlSessionFactory sqlsession;
	public static SqlSessionFactory getSqlsession() {
		return sqlsession;
	}
	
	static{
		try {
			String resource = "mybatis/configure.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactoryBuilder factory = new SqlSessionFactoryBuilder();
			sqlsession = factory.build(reader);
		} catch (Exception e) {
			System.out.println(e);
		}
	}


}
