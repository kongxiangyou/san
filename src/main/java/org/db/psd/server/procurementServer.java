package org.db.psd.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.db.psd.fatory.FatoryModel;
import org.db.psd.model.Employee;
import org.db.psd.model.Procurement;
import org.db.psd.model.Produce;

@WebServlet("/procurementServer")
public class procurementServer extends HttpServlet {

	String op=null;
	String path = null;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 this.doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 op=request.getParameter("op");
		 if(op.equals("create")) {
			 
			 doCreate(request, response);
		 }else if(op.equals("select")) {
			 doSelect(request, response);
		 }else if(op.equals("byId")) {
			 doById(request, response);
		 }else if(op.equals("update")) {
			 doUpdate(request, response);
		 }else if(op.equals("delete")) {
			 doDelete(request, response);
		 }else if(op.equals("byMore")) {
			 doByMore(request, response);
		 } 
		 
		 request.getRequestDispatcher(path).forward(request, response);
	}
	protected void doCreate(HttpServletRequest request, HttpServletResponse response) {
		
		int procurementNum =Integer.parseInt(request.getParameter("procurementNum") ) ;
		double procurementPrice =Double.parseDouble( request.getParameter("procurementPrice") );
		
		String procurementSuppliers = request.getParameter("procurementSuppliers");
		int produceId = Integer.parseInt(request.getParameter("produceId") ) ;
		
		Employee employee = (Employee)request.getSession().getAttribute("employee");
		String employeeCode = employee.getEmployeeCode();
		employee =FatoryModel.getInstanceFatory().getEmployeeDAO().employeeById(employeeCode);
		int employeeId = employee.getEmployeeId();
		
		Procurement procurement = new Procurement(0, procurementNum, procurementPrice, null, procurementSuppliers, produceId, employeeId, null,null);
		boolean b = FatoryModel.getInstanceFatory().getProcurementDAO().procurementCreate(procurement);
		if(b) {
			path="/procurementServer?op=select";
		}else {
			System.out.println("??????????????????");
			path="/produce/produceMain.jsp";
		}
		
	}
	protected void doSelect(HttpServletRequest request, HttpServletResponse response) {
		
		int newpage = 1;
		String position = request.getParameter("position");
		if(position!=null) {
			newpage = Integer.parseInt(position);
		}
		int size = 3;
		long allRows = FatoryModel.getInstanceFatory().getProcurementDAO().allRows();
		long allPage = FatoryModel.getInstanceFatory().getSplitDAO().allPages(allRows, size);

		long currentRows = FatoryModel.getInstanceFatory().getSplitDAO().currentRows(newpage, size);
		
		List<Procurement> procurement = FatoryModel.getInstanceFatory().getProcurementDAO().showInfermation(currentRows, size);
		
		request.setAttribute("allPage", allPage);
		request.setAttribute("procurement", procurement);
		path = "/Producemanager/ProduceManagerSelect.jsp";
	}
	protected void doById(HttpServletRequest request, HttpServletResponse response) {
		int procurementId = Integer.parseInt(request.getParameter("procurementId") ) ;
	 
		Procurement procurement = FatoryModel.getInstanceFatory().getProcurementDAO().procurementById(procurementId);
		
		if(procurement!=null) {
			request.setAttribute("procurement", procurement);
			path = "/Producemanager/ProduceManagerById.jsp";
		}else {		 
			System.out.println("?????????????????????");
			/* path="/produce/produceMain.jsp"; */
			path="/procurementServer?op=select";
		}
	}
	protected void doUpdate(HttpServletRequest request, HttpServletResponse response) {
		int procurementId = Integer.parseInt(request.getParameter("procurementId") ) ;
		int procurementNum =Integer.parseInt(request.getParameter("procurementNum") ) ;
		double procurementPrice =Double.parseDouble( request.getParameter("procurementPrice") );
		
		String procurementSuppliers = request.getParameter("procurementSuppliers");
	//	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		//String procurementTime = simpleDateFormat.format(request.getParameter("procurementTime"));
		String procurementTime = request.getParameter("procurementTime");
		String produceName = request.getParameter("produceName");
		String employeeName = request.getParameter("employeeName");
//		int produceId = Integer.parseInt(request.getParameter("produceId") ) ;
//		 
//		int employeeId = Integer.parseInt(request.getParameter("employeeId") ) ;
		System.out.println(procurementId+ procurementNum+ procurementPrice+ procurementTime+ procurementSuppliers+ employeeName+produceName);
		/*
		 * procurementId, int procurementNum, double procurementPrice, String
		 * procurementTime, procurementSuppliers, int produceId, int employeeId, String
		 * employeeName, String produceName
		 */
		Procurement procurement = new Procurement(procurementId, procurementNum, procurementPrice, procurementTime, procurementSuppliers, 0, 0, employeeName,produceName);
		boolean b = FatoryModel.getInstanceFatory().getProcurementDAO().procurementUpdate(procurement);
		if(b) {
			path="/procurementServer?op=select";
		}else {		
			System.out.println("??????????????????");
			path="/false.jsp";
		}
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) {
		int procurementId = Integer.parseInt(request.getParameter("procurementId") ) ;
		boolean b = FatoryModel.getInstanceFatory().getProcurementDAO().procurementDelete(procurementId);
		if(b) {
			path="/procurementServer?op=select";
		}else {
			PrintWriter out;
			try {
				out = response.getWriter();
				out.print("??????????????????");
			} catch (IOException e) { 
				e.printStackTrace();
			}
			System.out.println("??????????????????");
			path="/procurementServer?op=select";
		}
	}
	protected void doByMore(HttpServletRequest request, HttpServletResponse response) {
		String wordkey = request.getParameter("wordkey");
		int type = Integer.parseInt(request.getParameter("type"));
		List<Procurement> procurement = FatoryModel.getInstanceFatory().getProcurementDAO().procurementList(wordkey, type);
		//System.out.println(procurement+"===");
		if(procurement!=null) {
			request.setAttribute("procurement", procurement);
			path = "/Producemanager/ProduceManagerByMore.jsp";
		}else {
				System.out.print("????????????");
			path="/false.jsp";
		}
		
	}
}
