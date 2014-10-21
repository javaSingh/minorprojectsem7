

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Serv1
 */
public class Serv1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String docid="";
	String fromdept="";
	String indept="";
	String todept="";

    /**
     * Default constructor. 
     */
    public Serv1() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		ServletContext application=request.getServletContext();
		Control ctrl=null;
		PrintWriter out=response.getWriter();
		docid=request.getParameter("docid");
		ctrl=new Control();
		if(ctrl.con==null)
		{
			application.setAttribute("message","Please Start your DataBase Server");
		}
		else
		{
		if(ctrl.idExists(Integer.parseInt(docid)))
		{	
			application.setAttribute("message","id already exists.\n <html><a href='Serv3'>generate new doc id</a></html>");
			
//			
//			out.println("id already exists.");
//			out.print("<html><a href='Serv3'>generate new doc id</a></html>");
		}
		else
		{
			fromdept=request.getParameter("fromdept");
		indept=request.getParameter("indept");
		//todept=request.getParameter("todept");
		if(docid.equals("")||docid==null)
		{
			//no data received to be added to the database
			application.setAttribute("message","go back and repeat.");
		}
		else
		{
			//the update has been successful if this is true.
			if(new Control().newDocReceived(docid, fromdept,indept))
			{
				application.setAttribute("message","New Doc Added.");
				
			}
			else
			{
				application.setAttribute("message","Please go back and try again.");
			}
		}
		
		}
		}
		response.sendRedirect("message.jsp");
	}
	}
