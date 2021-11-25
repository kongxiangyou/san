package org.db.psd.server;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.db.psd.fatory.FatoryModel;
import org.db.psd.model.Inventory;
import org.db.psd.model.Outbound;
import org.db.psd.model.Shop;
import org.db.psd.model.Shopstore;
@WebServlet("/OutBoundServer")
public class OutBoundServer extends HttpServlet {

	String op = null;
	String path = null;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 this.doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 op = request.getParameter("op");
		 
		 if(op.equals("create")) {
			 
			 doCreate(request, response);
		 }else if(op.equals("list")) {
			 
			 doList(request, response);
		 }else if(op.equals("set")) {
			 doSet(request, response);
		 }else if(op.equals("byId")) {
			 doById(request, response);
		 }else if(op.equals("ByProduceName")) {
			 doByProduceName(request, response);
		 } 
		 
		 request.getRequestDispatcher(path).forward(request,response);
	}
	protected void doCreate(HttpServletRequest request, HttpServletResponse response) {
		int outboundNum =Integer.parseInt( request.getParameter("outboundNum")) ;
		  String shopName = request.getParameter("shopName") ;
		//  System.out.println(shopName+"+++");
		  Shop shop = FatoryModel.getInstanceFatory().getShopDAO().shopByName(shopName);
		  int shopId =shop.getShopId();
		  
		int inventoryId =Integer.parseInt( request.getParameter("inventoryId")) ;
		  int produceId =Integer.parseInt( request.getParameter("produceId")) ;
		  int employeeId =Integer.parseInt( request.getParameter("employeeId")) ;
		  
		  Outbound outbound = new Outbound(0, outboundNum, null, produceId, employeeId, inventoryId,null,null);
		  int outboundId = FatoryModel.getInstanceFatory().getOutboundDAO().outboundCreate(outbound);
		  
		  Shopstore shopstore = new Shopstore(0, 0, null, shopId, produceId, outboundId, employeeId, 0,null,null);
//		  System.out.println("第二"+shopId+","+ produceId+","+ outboundId+","+ employeeId);
	boolean  b= FatoryModel.getInstanceFatory().getShopStoreDAO().shopStoreJudge(shopId,produceId);
		if(b) {
			FatoryModel.getInstanceFatory().getShopStoreDAO().shopStoreCreate(shopstore);
		}
			b=FatoryModel.getInstanceFatory().getShopStoreDAO().ShopStoreChangNum(outbound,shopId);
			  if(b) {
				  System.out.println("outbound suceess");
				  path="/OutBoundServer?op=list";
			  }else {
				  System.out.println("outbound false");
				  path="/warehouseman/warehousemain.jsp";
			  }
	
	}
	protected void doSet(HttpServletRequest request, HttpServletResponse response) {
		int inventoryId =Integer.parseInt( request.getParameter("inventoryId")) ;
		  int produceId =Integer.parseInt( request.getParameter("produceId")) ;
		  int employeeId =Integer.parseInt( request.getParameter("employeeId")) ;
		  //System.out.println("第一个"+inventoryId+","+ produceId+","+ employeeId);
		Inventory  inventory = new Inventory(inventoryId, 0, null, null, 0, produceId, employeeId, 0,0,0,null);
		List<Shop> shops = FatoryModel.getInstanceFatory().getShopDAO().shopList();
		request.setAttribute("shops", shops);
		request.setAttribute("inventory", inventory);
		path="/warehouseman/outboundCreate.jsp";
	}
	protected void doList(HttpServletRequest request, HttpServletResponse response) {
		int newpage = 1;
		String position = request.getParameter("position");
		if(position!=null) {
			newpage = Integer.parseInt(position);
		}
		int size = 3;
		long allRows = FatoryModel.getInstanceFatory().getOutboundDAO().allrow();
		long allPage = FatoryModel.getInstanceFatory().getSplitDAO().allPages(allRows, size);

		long currentRows = FatoryModel.getInstanceFatory().getSplitDAO().currentRows(newpage, size);
		
		List<Outbound> outbound = FatoryModel.getInstanceFatory().getOutboundDAO().infermation(currentRows, size);
		
		request.setAttribute("allPage", allPage);
		request.setAttribute("outbound", outbound);
		path="/warehouseman/OutboundList.jsp";
	}
	protected void doById(HttpServletRequest request, HttpServletResponse response) {
		int outboundId =Integer.parseInt( request.getParameter("outboundId")) ;
		 Outbound outbound =FatoryModel.getInstanceFatory().getOutboundDAO().outboundById(outboundId);
		 if(outbound!=null) {
			 request.setAttribute("outbound", outbound);
			 path="/warehouseman/OutboundById.jsp";
		 }else {
			 path="/warehouseman/warehousemain.jsp";
		 }
		 
	}
	protected void doByProduceName(HttpServletRequest request, HttpServletResponse response) {
		String produceName = request.getParameter("produceName") ;
		 Outbound outbound =FatoryModel.getInstanceFatory().getOutboundDAO().outboundByProduceName(produceName);
		 if(outbound!=null) {
			 request.setAttribute("outbound", outbound);
			 path="/warehouseman/OutboundList.jsp";
		 }else {
			 path="/warehouseman/warehousemain.jsp";
		 }
		 
	}
}
