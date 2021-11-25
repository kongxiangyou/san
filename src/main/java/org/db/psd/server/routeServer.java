package org.db.psd.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.db.psd.fatory.FatoryModel;
import org.db.psd.model.Employee;
import org.db.psd.model.EmployeeJob;
import org.db.psd.model.Sale;
import org.db.psd.model.Shopstore;
import org.db.psd.model.Supplier;

@WebServlet("/routeServer")
public class routeServer extends HttpServlet {

	String op = null;
	String path = null;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 this.doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException {
		op= request.getParameter("op");
		if(op.equals("employee")) {
			
			doEmployee(request, response);
		}else if(op.equals("produceManager")) {
			
			doProduceManger(request, response);
		}else if(op.equals("produceManager2")) {
			
			doProduceManger2(request, response);
		}else if(op.equals("warehouse")) {
			
			doWarehouse(request, response);
		}else if(op.equals("shop")) {
			
			doShop(request, response);
		}else if(op.equals("sale")) {
			
			doSale(request, response);
		}
		request.getRequestDispatcher(path).forward(request, response);
		
	};
	protected void doEmployee(HttpServletRequest request, HttpServletResponse response) {
		Employee employee = (Employee)request.getSession().getAttribute("employee");
		String employeeCode = employee.getEmployeeCode();
		int b = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeJudgeJurisdiction(employeeCode);
		
		if(b==1) {
			List<EmployeeJob> employeeJobs = FatoryModel.getInstanceFatory().getEmployeeJobDAO().employeeJobList();
			request.setAttribute("employeeJobs", employeeJobs);
			path = "/Supermanager/regist.jsp";
		}else {
			System.out.println("没有权限");
			path="/Supermanager/show.jsp";
		}
	}
	protected void doProduceManger(HttpServletRequest request, HttpServletResponse response) {
		Employee employee = (Employee)request.getSession().getAttribute("employee");
		String employeeCode = employee.getEmployeeCode();
		int b = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeJudgeJurisdiction(employeeCode);
		int produceId =Integer.parseInt( request.getParameter("produceId")) ;
		List<Supplier> suppliers = FatoryModel.getInstanceFatory().getSupplierDAO().select();
		if(b==1 || b==2) {
			request.setAttribute("produceId", produceId);
			request.setAttribute("suppliers", suppliers);
			path = "/Producemanager/ProduceManagerCreate.jsp";
		}else {
			System.out.println("没有权限");
			path="/produce/produceMain.jsp";
		}
	}
	protected void doProduceManger2(HttpServletRequest request, HttpServletResponse response) {
		Employee employee = (Employee)request.getSession().getAttribute("employee");
		String employeeCode = employee.getEmployeeCode();
		int b = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeJudgeJurisdiction(employeeCode);
		
		if(b==1 || b==2) {
			
			path = "/procurementServer?op=select";
		}else {
			System.out.println("没有权限");
			path="/produce/produceMain.jsp";
		}
	}
	protected void doWarehouse(HttpServletRequest request, HttpServletResponse response) {
		Employee employee = (Employee)request.getSession().getAttribute("employee");
		String employeeCode = employee.getEmployeeCode();
		int b = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeJudgeJurisdiction(employeeCode);		
		if(b==1 || b==3) {
			path = "/warehouseman/warehousemain.jsp";
		}else {
			System.out.println("没有权限");
			path="/Supermanager/show.jsp";
		}
	}
	protected void doShop(HttpServletRequest request, HttpServletResponse response) {
		Employee employee = (Employee)request.getSession().getAttribute("employee");
		String employeeCode = employee.getEmployeeCode();
		int b = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeJudgeJurisdiction(employeeCode);		
		if(b==1 || b==4) {
			path = "/ShopManager/ShopMain.jsp";
		}else {
			System.out.println("没有权限");
			path="/Supermanager/show.jsp";
		}
	}
	protected void doSale(HttpServletRequest request, HttpServletResponse response) {
		int shopId = Integer.parseInt(request.getParameter("shopId")) ;
		int produceId = Integer.parseInt(request.getParameter("produceId"));
		int shopstoreId = Integer.parseInt(request.getParameter("shopStoreId"));
		Employee employee = (Employee)request.getSession().getAttribute("employee");
		String employeeCode = employee.getEmployeeCode();
		 
		 
		int b = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeJudgeJurisdiction(employeeCode);
		employee = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeById(employeeCode);
		
		int employeeId = employee.getEmployeeId();
		boolean result = FatoryModel.getInstanceFatory().getShopDAO().shopJudgeEmployee(shopId, employeeId);
		if(b==1 || result) {
			request.setAttribute("shopId",  shopId);
			request.setAttribute("produceId",  produceId);
			request.setAttribute("shopstoreId",  shopstoreId);
			path = "/ShopManager/saleCreat.jsp";
		}else {
			System.out.println("没有权限");
			path="/SaleServer?op=set";
		}
	}
}
