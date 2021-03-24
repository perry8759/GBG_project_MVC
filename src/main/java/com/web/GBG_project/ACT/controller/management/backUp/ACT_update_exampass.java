package com.web.GBG_project.ACT.controller.management.backUp;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.service.ACTService;
import com.web.GBG_project.ACT.service.impl.ACTServiceImpl;
//管理(更新活動狀態)
/**
 * Servlet implementation class DOS_update
 */
@WebServlet("/ACT/ACT_update_exampass")
public class ACT_update_exampass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ACT_update_exampass() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			updateForm(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private void updateForm(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, ServletException, IOException {
		        ACTService  rs = new ACTServiceImpl();
		        response.setContentType("text/html");
		        request.setCharacterEncoding("UTF-8");
		        Integer id = Integer.parseInt(request.getParameter("actid"));
		        ACT act=rs.getACT(id);
		        String s1=rs.changeTS2S(act.getACT_SIGN_O());
		        String s2=rs.changeTS2S(act.getACT_SIGN_C());
		        Integer tt=rs.getTime_to_status(s1, s2);
		        rs.updateact_status_exampass(act,tt);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("/management_page/MGT_ACT_Detail_Page_Close.jsp");
		        dispatcher.forward(request, response);
		    }
}
