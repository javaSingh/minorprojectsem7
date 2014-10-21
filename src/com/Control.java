package com;

import java.util.*;
import java.util.Date;
import java.sql.*;
public class Control {
	

	public Connection con;
	PreparedStatement pstm,temppstm;
	ResultSet rs;
	
	
	public Control()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/minorprojectsem7","root","");
			System.out.println("working");
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("Error in Constructor of Control class "+e);
			return;
			
		}
		
	}
	
	public Boolean newDocReceived(String docid,String fromdept,String indept)
	{
		try {
			pstm=con.prepareStatement("INSERT INTO DOCUMENT values (?,?,?,?,?,?,?)");
			pstm.setString(1, docid);
			pstm.setString(2, fromdept);
			pstm.setString(3, indept);
			pstm.setString(4, "");//todept
			pstm.setString(5, (new Date()).toString());//receiveddate
			pstm.setString(6, "");//sentdate
			pstm.setString(7, "");//completedate
			pstm.executeUpdate();
			System.out.println("Insert Successful ");
			return true;
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("Error in newDocReceived function "+e);
			return false;
		}
		
	}
	public String sendDoc(String docid,String indept,String todept)
	{
		try {
		int matchfound;//0=no match found;
		
//			temppstm.con.perpareStatement("select * from document where docid=? && indept=?");
//			temppstm.setString(1, docid);
//			temppstm.setString(2,indept);
//			rs=temppstm.executeQuery();
//			rs.next();
//			//no result found
//			if(rs==null)
//			{
//				System.out.println("no matches were found ");
//			
//			}
////			else
//			{
				pstm=con.prepareStatement("UPDATE DOCUMENT SET todept=?,sentdate=? WHERE docid=? && indept=?");
				pstm.setString(1, todept);
				pstm.setString(2, (new Date()).toString());
				pstm.setString(3, docid);
				pstm.setString(4,indept);
				if(!docid.equals("")||docid!=null)
				{
					matchfound=pstm.executeUpdate();
					if(matchfound==0)
					{
						return "no matches were found";
						//System.out.println("no matches were found");
					}
					else
					{
						
					//System.out.println("update Successful ");
					//now since the update is successful, we need to add another row with the same id with 
					//todept as the current dept and a null to dept and the previous indept as the fromdept
					// ie make a new row for the doc for tracing purpose
					pstm=con.prepareStatement("insert into document values(?,?,?,?,?,?,?)");
					pstm.setString(1, docid);
					pstm.setString(2, indept);
					pstm.setString(3, todept);
					pstm.setString(4, "");
					pstm.setString(5, (new Date()).toString());
					pstm.setString(6, "");
					pstm.setString(7, "");
					pstm.executeUpdate();
//					return "The document has Been sent And Updated";
					
					}
				}
			
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("Error in sendDoc function "+e);
			return "There Has been An Error. Please go back and try again";
		}
		return "The document has Been sent And Updated";
		
	}

	public Boolean idExists(int docid)
	{
		try {
			pstm=con.prepareStatement("select docid from document where docid=?");
			pstm.setString(1,""+docid);
			rs=pstm.executeQuery();
			if(rs.next())
			{
				//the new docid does not exists in the table and can be granted to the new doc
				return true;
			}
			else
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("idExixts "+e);
			//this will make the while loop run more than 100 times and it comes out of loop
			return true;
		}
//		finally
//		{
//			return true;
//		}
		
		
	}
	public ResultSet selectStar(String docid)
	{
		try {
			pstm=con.prepareStatement("select * from document where docid=?");
			pstm.setString(1,docid);
			rs=pstm.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("selectStar "+e);
			rs=null;
		}
		finally
		{
		return rs;
		}
	}
}
