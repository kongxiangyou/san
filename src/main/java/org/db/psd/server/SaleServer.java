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
import org.db.psd.model.Outbound;
import org.db.psd.model.Sale;
import org.db.psd.model.Shopstore;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
@WebServlet("/SaleServer")
public class SaleServer extends HttpServlet {

	String op = null;
	String path=null;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 op=request.getParameter("op");
		 if(op.equals("create")) {
			 doCreate(request, response);
		 }else if(op.equals("list")) {
			 doList(request, response);
			 
		 }else if(op.equals("set")) {
			 doSet(request, response);
		 }else if(op.equals("byMore")) {
			 doByMore(request, response);
		 }
		 request.getRequestDispatcher(path).forward(request, response);
	}
	protected void doSet(HttpServletRequest request, HttpServletResponse response) {
		int newpage = 1;
		String position = request.getParameter("position");
		if(position!=null) {
			newpage = Integer.parseInt(position);
		}
		int size = 3;
		long allRows = FatoryModel.getInstanceFatory().getShopStoreDAO().allrow();
		long allPage = FatoryModel.getInstanceFatory().getSplitDAO().allPages(allRows, size);

		long currentRows = FatoryModel.getInstanceFatory().getSplitDAO().currentRows(newpage, size);
		
		List<Shopstore> shopstore = FatoryModel.getInstanceFatory().getShopStoreDAO().infermation(currentRows, size);
		
		request.setAttribute("allPage", allPage);
		request.setAttribute("shopstore", shopstore);
		path="/ShopManager/shopstoreshow.jsp";
	}
	protected void doCreate(HttpServletRequest request, HttpServletResponse response) {
		 
		 double salePrice =Double.parseDouble(request.getParameter("salePrice")) ;
		 int saleNum = Integer.parseInt(request.getParameter("saleNum")) ;
		 
		 Employee employee = (Employee)request.getSession().getAttribute("employee");
		 String employeeCode = employee.getEmployeeCode();
		 employee = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeById(employeeCode);
		 
		 int employeeId =  employee.getEmployeeId();
		 int produceId = Integer.parseInt(request.getParameter("produceId")) ;
		 int shopStoreId = Integer.parseInt(request.getParameter("shopStoreId")) ;
		 
		 int shopId = Integer.parseInt(request.getParameter("shopId")) ;
		 
		 Sale sale = new Sale(0, salePrice, saleNum, 0, null, employeeId, produceId, shopStoreId, shopId,null,null);
		 int saleId =  FatoryModel.getInstanceFatory().getSaleDAO().create(sale);
		 sale=new Sale(saleId, salePrice, saleNum, 0, null, employeeId, produceId, shopStoreId, shopId, null, null);
		 
			 boolean b =  FatoryModel.getInstanceFatory().getSaleDAO().update(sale);
			 if(b) {
					 b= FatoryModel.getInstanceFatory().getShopStoreDAO().saleChangNum(sale);
					 if(b) {
						 System.out.println("shopstore update  seccess");
						 path="/SaleServer?op=list";
					 }else {
						 System.out.println("shopstore update  false");
					 }
			 }else {
				 System.out.println("sale update  false");	 
				 path="/ShopManager/ShopMain.jsp";
			 }
  
	}
	protected void doList(HttpServletRequest request, HttpServletResponse response) {
		int newpage = 1;
		String position = request.getParameter("position");
		if(position!=null) {
			newpage = Integer.parseInt(position);
		}
		int size = 3;
		long allRows = FatoryModel.getInstanceFatory().getSaleDAO().allrow();
		long allPage = FatoryModel.getInstanceFatory().getSplitDAO().allPages(allRows, size);

		long currentRows = FatoryModel.getInstanceFatory().getSplitDAO().currentRows(newpage, size);
		
		List<Sale> sales = FatoryModel.getInstanceFatory().getSaleDAO().SaleList(currentRows, size);
		 
		request.setAttribute("allPage", allPage);
		request.setAttribute("sales", sales);
		 
		path="/ShopManager/saleList.jsp";
	}
	protected void doByMore(HttpServletRequest request, HttpServletResponse response) {
		int type = Integer.parseInt(request.getParameter("type"));
		String wordkey = request.getParameter("wordkey");
		List<Sale> sales = FatoryModel.getInstanceFatory().getSaleDAO().ByMore(wordkey, type);
		request.setAttribute("sales", sales);
		 
		path="/ShopManager/SaleByMore.jsp";
	}
}
