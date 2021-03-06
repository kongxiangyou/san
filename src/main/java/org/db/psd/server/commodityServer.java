package org.db.psd.server;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.db.psd.fatory.FatoryModel;
import org.db.psd.model.Employee;
import org.db.psd.model.Produce; 

@WebServlet("/commodityServer")
public class commodityServer extends HttpServlet {

	String op = null;
	String path = null;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 op=request.getParameter("op");
		 if(op.equals("judge")) {
			 doJudge(request,response);
		 }else if(op.equals("create")) {
			 doCreate(request,response);
		 }else if(op.equals("selectAll")) {
			 doSelectAll(request,response);
		 } else if(op.equals("update")) {
			 doUpdate(request,response);
		 }  else if(op.equals("byId")) {
			 doById(request,response);
		 }  
		 request.getRequestDispatcher(path).forward(request, response);
	}
	protected void doJudge(HttpServletRequest request, HttpServletResponse response) {
		Employee employee = (Employee)request.getSession().getAttribute("employee");
		String employeeCode = employee.getEmployeeCode();
		int b = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeJudgeJurisdiction(employeeCode);
		if(b<4) {
			
			path="/produce/produceCreate.jsp";
		}else {
			System.out.println("没有权限");
			path="/Supermanager/show.jsp";
		}
	}
	protected void doCreate(HttpServletRequest request, HttpServletResponse response) {
		Employee employee = (Employee)request.getSession().getAttribute("employee");
		String employeeCode = employee.getEmployeeCode();
		employee=FatoryModel.getInstanceFatory().getEmployeeDAO().employeeById(employeeCode);
		
		String produceName =request.getParameter("produceName");
		String produceISBN = request.getParameter("produceISBN");
		String produceDescribe = request.getParameter("produceDescribe");
		
		String supplierName = request.getParameter("supplierName");
		 
	 
		int employeeId = employee.getEmployeeId();
		
		Produce produce= new Produce(0, produceName, produceISBN, produceDescribe, employeeId,0,null);
		
		boolean b = FatoryModel.getInstanceFatory().getProduceDAO().produceCreate(produce);
		if(b) {
			path="/commodityServer?op=selectAll";
		}else {
			System.out.println("商品创建失败！");
		}
	}
	protected void doSelectAll(HttpServletRequest request, HttpServletResponse response) {
		int newpage = 1;
		String position = request.getParameter("position");
		if(position!=null) {
			newpage = Integer.parseInt(position);
		}
		int size = 3;
		long allRows = FatoryModel.getInstanceFatory().getProduceDAO().allrow();
		long allPage = FatoryModel.getInstanceFatory().getSplitDAO().allPages(allRows, size);

		long currentRows = FatoryModel.getInstanceFatory().getSplitDAO().currentRows(newpage, size);
		
		List<Produce> produce = FatoryModel.getInstanceFatory().getProduceDAO().infermation(currentRows, size);
		
		request.setAttribute("allPage", allPage);
		request.setAttribute("produce", produce);
		path = "/produce/produceSelect.jsp";
	}
	protected void doUpdate(HttpServletRequest request, HttpServletResponse response) {
		int produceId =Integer.parseInt(request.getParameter("produceId")) ;
		String produceName =request.getParameter("produceName");
		String produceISBN = request.getParameter("produceISBN");
		String produceDescribe = request.getParameter("produceDescribe");
		int employeeId = Integer.parseInt(request.getParameter("employeeId")) ;
		Produce produce = new Produce(produceId, produceName, produceISBN, produceDescribe, employeeId,0,null);
		
		boolean b =  FatoryModel.getInstanceFatory().getProduceDAO().produceUpdate(produce);
	
		if(b) {
			System.out.println("修改成功");
			request.setAttribute("produce", produce);
			path = "/produce/produceById.jsp";
		}else {
			path="/commodityServer?op=selectAll";
			System.out.println("修改失败");
		}
	}
	protected void doById(HttpServletRequest request, HttpServletResponse response) {
		int produceId =Integer.parseInt(request.getParameter("produceId")) ;
	 
		Produce produce= FatoryModel.getInstanceFatory().getProduceDAO().producebyId(produceId);
		if(produce!=null) {
			request.setAttribute("produce", produce);
			path = "/produce/produceById.jsp";
		}else {
			System.out.println("查询失败");
			path = "/false.jsp";
		}
		
	}
}
