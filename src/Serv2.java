

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Serv2
 */
public class Serv2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String docid="";
	String indept="";
	String todept="";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Serv2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		ServletContext application=request.getServletContext();
		Control ctrl;
		PrintWriter out=response.getWriter();
		docid=request.getParameter("docid");
		ctrl=new Control();
		if(ctrl.con==null)
		{
			application.setAttribute("message", "please start your database SErver");
		}
		else
		{
		// the id exists in the db and can be processeed for update
		if(ctrl.idExists(Integer.parseInt(docid)))
		{
		indept=request.getParameter("indept");
		todept=request.getParameter("todept");
		//todept=request.getParameter("todept");
		if(docid.equals("")||docid==null)
		{
			application.setAttribute("message","Go Back and Please Try Again");
			//no data received to be added to the database
		}
		else
		{
			String s=new Control().sendDoc(docid,indept,todept);
			application.setAttribute("message",s);
		}
			
		}
		else
		{
			application.setAttribute("message","id already exists.\n <html><a href='Serv3'>generate new doc id</a></html>");
		}
	
		}
	
		response.sendRedirect("message.jsp");
	
	}

}
