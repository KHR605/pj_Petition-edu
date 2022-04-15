package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.AdminPageProAction;
import action.AnswerPetitionListProAction;
import action.BoardListAction;
import action.BoardModifyFormAction;
import action.BoardModifyProAction;
import action.DeletePetitionProAction;
import action.DeleteScrapProAction;
import action.DissatisfiedPetitionProAction;
import action.EndPetitionListAction;
import action.IndexProAction;
import action.InsertAnswerProAction;
import action.MypetitionListProAction;
import action.RegistScrapProAction;
import action.SatisfiedPetitionProAction;
import action.ScrapListProAction;
import action.SearchAllProAction;
import vo.ActionForward;

@WebServlet("*.fkr")
public class MVC2Con extends javax.servlet.http.HttpServlet  {
	
	protected void doProcess (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;
		//System.out.println("ReqeustURI: " +RequestURI);
		//System.out.println("contextPath: " +contextPath);
		//System.out.println("command: "+command);
		
		if(command.equals("/index.fkr")) {
			action = new IndexProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/board.fkr")){
			action = new BoardListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/BoardModifyForm.fkr")) {
			action = new BoardModifyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/BoardModifyPro.fkr")) {
			action = new BoardModifyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/endPetitionList.fkr")) {
			action = new EndPetitionListAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/registScrap.fkr")) {
			action = new RegistScrapProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		else if(command.equals("/scrapList.fkr")) {
			action = new ScrapListProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		else if(command.equals("/myPetition.fkr")) {
			action = new MypetitionListProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		else if(command.equals("/answerPetition.fkr")) {
			action = new AnswerPetitionListProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		else if(command.equals("/deletePetition.fkr")) {
			action = new DeletePetitionProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		else if(command.equals("/deleteScrap.fkr")) {
			action = new DeleteScrapProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		else if(command.equals("/admin_main.fkr")) {
			action = new AdminPageProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		else if(command.equals("/insertAnswer.fkr")) {
			action = new InsertAnswerProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		else if(command.equals("/satisfied.fkr")) {
			action = new SatisfiedPetitionProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		else if(command.equals("/dissatisfied.fkr")) {
			action = new DissatisfiedPetitionProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		else if(command.equals("/search.fkr")) {
			action = new SearchAllProAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
		
}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	} 
}
