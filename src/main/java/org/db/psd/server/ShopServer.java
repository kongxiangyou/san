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
import org.db.psd.model.Produce;
import org.db.psd.model.Shop;
@WebServlet("/ShopServer")
public class ShopServer extends HttpServlet {

	String op = null;
	String path = null;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 this.doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 op= request.getParameter("op");
		 if(op.equals("create")) {
			 
			 doCreate(request, response);
		 }else if(op.equals("list")) {
			 
			 doList(request, response);
		 }else if(op.equals("byId")) {
			 
			 doById(request, response);
		 }else if(op.equals("update")) {
			 
			 doUpdate(request, response);
		 } else if(op.equals("byMore")) {
			 
			 doByMore(request, response);
		 } else if(op.equals("show")) {
			 
			 doShow(request, response);
		 } else if(op.equals("set")) {
			 
			 doSet(request, response);
		 }else if(op.equals("recruit")) {
			 
			 doRecruit(request, response);
		 } 
		 request.getRequestDispatcher(path).forward(request, response);
	}
	protected void doCreate(HttpServletRequest request, HttpServletResponse response) {
		 String shopName = request.getParameter("shopName");
		 String shopAddress = request.getParameter("shopAddress");
		 String shopPhone = request.getParameter("shopPhone");
		 
		 Shop shop = new Shop(0, shopName, shopAddress, shopPhone,0,null);
		 int shopId = FatoryModel.getInstanceFatory().getShopDAO().shopCreate(shop);
		 if(shopId!=0) {
			 path="/ShopServer?op=list";
			 System.out.println("shop success");
		 }else {
			 path= "/ShopManager/ShopMain.jsp";
			 System.out.println("shop false");
		 }
	}
	protected void doList(HttpServletRequest request, HttpServletResponse response) {
		int newpage = 1;
		String position = request.getParameter("position");
		if(position!=null) {
			newpage = Integer.parseInt(position);
		}
		int size = 3;
		long allRows = FatoryModel.getInstanceFatory().getShopDAO().allrow();
		long allPage = FatoryModel.getInstanceFatory().getSplitDAO().allPages(allRows, size);

		long currentRows = FatoryModel.getInstanceFatory().getSplitDAO().currentRows(newpage, size);
		
		List<Shop> shops = FatoryModel.getInstanceFatory().getShopDAO().infermation(currentRows, size);
		request.setAttribute("allPage", allPage);
		request.setAttribute("shops", shops);
		path="/ShopManager/shopShow.jsp";
		
	}
	protected void doById(HttpServletRequest request, HttpServletResponse response) {
		int shopId =Integer.parseInt(request.getParameter("shopId") ) ;
		Shop shop = FatoryModel.getInstanceFatory().getShopDAO().shopById(shopId);
	
		request.setAttribute("shop", shop);
		path="/ShopManager/shopByid.jsp";
	}
	protected void doUpdate(HttpServletRequest request, HttpServletResponse response) {
		int shopId =Integer.parseInt(request.getParameter("shopId") ) ;
		 String shopName = request.getParameter("shopName");
		 String shopAddress = request.getParameter("shopAddress");
		 String shopPhone = request.getParameter("shopPhone");
		 
		 Shop shop = new Shop(shopId, shopName, shopAddress, shopPhone,0,null);
		 System.out.println(shopId+","+ shopName+","+ shopAddress+","+ shopPhone);
		 boolean b = FatoryModel.getInstanceFatory().getShopDAO().shopUpdate(shop);
		 if(b) {
			 path="/ShopServer?op=list";
			 System.out.println("update success");
		 }else {
			 path= "/ShopManager/ShopMain.jsp";
			 System.out.println("update false");
		 }
	}
	protected void doByMore(HttpServletRequest request, HttpServletResponse response) {
		String wordkey = request.getParameter("wordkey");
		int type =Integer.parseInt( request.getParameter("type")) ;
		List<Shop> shops = FatoryModel.getInstanceFatory().getShopDAO().shopByMore(wordkey, type);
		
		if(shops!=null) {
			request.setAttribute("shops", shops);
			path="/ShopManager/ShopByMore.jsp";
		 System.out.println("select success");
		}else {
		 path= "/ShopManager/ShopMain.jsp";
		 System.out.println("select false");
		}
	}
	protected void doShow(HttpServletRequest request, HttpServletResponse response) {
		int newpage = 1;
		String position = request.getParameter("position");
		if(position!=null) {
			newpage = Integer.parseInt(position);
		}
		int size = 3;
		long allRows = FatoryModel.getInstanceFatory().getShopStoreDAO().allrow();
		long allPage = FatoryModel.getInstanceFatory().getSplitDAO().allPages(allRows, size);

		long currentRows = FatoryModel.getInstanceFatory().getSplitDAO().currentRows(newpage, size);
		
		List<Produce> produce = FatoryModel.getInstanceFatory().getProduceDAO().produceList(currentRows, size);
		request.setAttribute("allPage", allPage);
		request.setAttribute("produce", produce);
		path="/ShopManager/produceShow.jsp";
	}
	protected void doSet(HttpServletRequest request, HttpServletResponse response) {
		int shopId =Integer.parseInt(request.getParameter("shopId") ) ;
		List<Employee> employees = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeList();
		request.setAttribute("employees", employees);
		request.setAttribute("shopId", shopId);
		path="/ShopManager/recruit.jsp";
	}
	protected void doRecruit(HttpServletRequest request, HttpServletResponse response) {
		int shopId =Integer.parseInt(request.getParameter("shopId") ) ;
		int employeeId =Integer.parseInt(request.getParameter("employeeId") ) ;
		boolean b = FatoryModel.getInstanceFatory().getShopDAO().shopUpdate(shopId, employeeId);
		if(b) {
			List<Shop> shops = FatoryModel.getInstanceFatory().getShopDAO().shopList(shopId);
			
			request.setAttribute("shops", shops);
			path="/ShopManager/showEmployee.jsp";
		}
	}
}
