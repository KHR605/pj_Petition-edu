package controller;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PetitionDTO;
import mybatis.ProcessInsert;

public class InsertPeti implements InsertPetiImp {
	static InsertPeti insert = new InsertPeti();
	public static InsertPeti instance() {
		return insert;
	}
	@Override
	public String InsertPeti(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ProcessInsert pi = ProcessInsert.instance();
		
		Date now = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		String today = sf.format(now);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		
		//30일 기간 설정
		cal.add(Calendar.DATE, +30);
		String expire_day = sf.format(cal.getTime()); 
		
		PetitionDTO dto = new PetitionDTO();
		
		String user_id = request.getParameter("writer");
		String petition_title = request.getParameter("title");
		String petition_content = request.getParameter("content");
		String petition_registration_day = today;
		String petition_expire_day = expire_day;
		String agree_no = "0";
		
		dto.setUser_id(user_id);
		dto.setPetition_title(petition_title);
		dto.setPetition_content(petition_content);
		dto.setPetition_registration_day(petition_registration_day);
		dto.setPetition_expire_day(petition_expire_day);
		dto.setAgree_no(agree_no);
		
		pi.insertPeti(dto);
		
		return "index.fkr";
	}
	
	
}
