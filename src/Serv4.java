

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Serv4
 */
public class Serv4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Serv4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		Control ctrl=new Control();
		String docid= request.getParameter("docid");
		if(ctrl.idExists(Integer.parseInt(docid)))
		{
			//display the data of the docid
			//since id check has been done rs can never be null
			ResultSet rs=ctrl.selectStar(docid);
			try {
				while(rs.next())
				{
					for(int i=1;i<=7;i++)
					{
						out.println(rs.getString(i));
						
					}
					out.println("\n");
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				System.out.println("Serv4 "+e);
				out.println("there has been some error. Please try again.");
			}
			
			
			
		}
		else
		{
			
			out.println("<html>" +
					"no such docid exists"+
					"</html>");
		}
		
	}

}
