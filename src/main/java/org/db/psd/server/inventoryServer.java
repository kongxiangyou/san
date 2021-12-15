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
import org.db.psd.model.Inventory;
import org.db.psd.model.Procurement;
import org.db.psd.model.province_city_county;

@WebServlet("/inventoryServer")
public class inventoryServer extends HttpServlet {

	String op=null;
	String path = null;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 this.doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 op = request.getParameter("op");
		 if(op.equals("showprocurement")) {
			 
			 doShowProcurement(request,response);
		 }else if(op.equals("create")) {
			 
			 doCreate(request, response);
		 }else if(op.equals("list")) {
			 
			 doList(request, response);
		 }else if(op.equals("byId")) {
			 
			 doById(request, response);
		 } else if(op.equals("ByProduceId")) {
			 
			 doByProduceId(request, response);
		 } else if(op.equals("showCreate")) {
			 
			 doshowCreate(request, response);
		 } 
		 request.getRequestDispatcher(path).forward(request, response);
	}
	protected void doShowProcurement(HttpServletRequest request, HttpServletResponse response) {
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
		path="/warehouseman/warehouseCreate.jsp";
	}
	protected void doCreate(HttpServletRequest request, HttpServletResponse response) {
		int inventoryNum = Integer.parseInt(request.getParameter("inventoryNum"));
		String inventoryPostion = request.getParameter("inventoryPostion");
		
		Employee employee = (Employee)request.getSession().getAttribute("employee");
		String employeeCode = employee.getEmployeeCode();
		employee =FatoryModel.getInstanceFatory().getEmployeeDAO().employeeById(employeeCode);
		int employeeId = employee.getEmployeeId();
		 
		int produceId = Integer.parseInt(request.getParameter("produceId"));
		int procurementId = Integer.parseInt(request.getParameter("procurementId"));
		
		Procurement procurement = FatoryModel.getInstanceFatory().getProcurementDAO().procurementById(procurementId);
		
		int procurementNum = procurement.getProcurementNum();
		if(inventoryNum>=procurementNum) {
			inventoryNum=procurementNum;
		}else if((procurementNum-inventoryNum) >= inventoryNum){
			inventoryNum=inventoryNum;
		}else {
			inventoryNum= procurementNum-inventoryNum;
		}
		//System.out.println("++"+inventoryNum+","+inventoryPostion+","+employeeId+","+produceId+","+procurementId+","+procurementNum);
		Inventory inventory = new Inventory(0, inventoryNum, null,inventoryPostion , 0, produceId, employeeId, procurementId,0,0,null);
		 boolean b = FatoryModel.getInstanceFatory().getInventoryDAO().inventoryCrete(inventory);
	
		 if(b) {
			 path="/inventoryServer?op=list";
		 }else {
			 System.out.println("入库失败！");
				/* path="/warehouseman/warehousemain.jsp"; */
			 path="/false.jsp";
		 }
	}
	protected void doList(HttpServletRequest request, HttpServletResponse response) {
		int newpage = 1;
		String position = request.getParameter("position");
		if(position!=null) {
			newpage = Integer.parseInt(position);
		}
		int size = 3;
		long allRows = FatoryModel.getInstanceFatory().getInventoryDAO().allrow();
		long allPage = FatoryModel.getInstanceFatory().getSplitDAO().allPages(allRows, size);

		long currentRows = FatoryModel.getInstanceFatory().getSplitDAO().currentRows(newpage, size);
		
		List<Inventory> inventory = FatoryModel.getInstanceFatory().getInventoryDAO().infermation(currentRows, size);
		
		request.setAttribute("allPage", allPage);
		request.setAttribute("inventory", inventory);
		path="/warehouseman/warehouseShow.jsp";
	}
	protected void doById(HttpServletRequest request, HttpServletResponse response) {
		int inventoryId = Integer.parseInt(request.getParameter("inventoryId"));
		Inventory inventory = FatoryModel.getInstanceFatory().getInventoryDAO().inventoryById(inventoryId);
		if(inventory!=null) {
				request.setAttribute("inventory", inventory);
			 path="/warehouseman/byId.jsp";
		}else {
		
			 System.out.println("查询失败！");
				/* path="/warehouseman/warehousemain.jsp"; */
			 path="/false.jsp";
		 }
		
	}
	protected void doByProduceId(HttpServletRequest request, HttpServletResponse response) {
		//int produceId = Integer.parseInt(request.getParameter("produceId"));
		String produceName =request.getParameter("produceName");
		List<Inventory> inventory = FatoryModel.getInstanceFatory().getInventoryDAO().inventorieListByProduceId(produceName);
		if(inventory!=null) {
			request.setAttribute("inventory", inventory);
			path="/warehouseman/ByProduceId.jsp";
		}else {
		
			 System.out.println("查询失败！");
				/* path="/warehouseman/warehousemain.jsp"; */
			 path="/Supermanager/welcome.jsp";
		 }
	}
	protected void doshowCreate(HttpServletRequest request, HttpServletResponse response) {
		int produceId = Integer.parseInt(request.getParameter("produceId"));
		int procurementId = Integer.parseInt(request.getParameter("procurementId"));
		
		request.setAttribute("produceId", produceId);
		request.setAttribute("procurementId", procurementId);
		
		List<province_city_county> pccList = FatoryModel.getInstanceFatory().getProvince_city_countyDAO().select();
		request.setAttribute("pccList", pccList);
		
		path = "/warehouseman/Create.jsp";
	}
}
