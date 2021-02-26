package ACT.controller.management;

import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ACT.model.ACT;
import ACT.model.ACT_STATUS;
import ACT.service.ACTService;
import ACT.service.impl.ACTServiceImpl;
import DOS.model.DOS;
import DOS.model.DOS_SPORT;
import DOS.service.DOSService;
import DOS.service.impl.DOSServiceImpl;
//管理(更新活動狀態)
/**
 * Servlet implementation class DOS_update
 */
@WebServlet("/ACT/ACT_update")
public class ACT_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ACT_update() {
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
		        int n=rs.updateact_status_examlock(act);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("ACT_list");
		        dispatcher.forward(request, response);
		    }
}
