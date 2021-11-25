package org.db.psd.server;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.db.psd.fatory.FatoryModel;
import org.db.psd.model.Shopstore;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
@WebServlet("/AjonServer")
public class AjonServer extends HttpServlet {

//	String op = null;
//	String path=null;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 

		 ObjectMapper objectMapper= new ObjectMapper();
		 String pstatm = request.getParameter("pstatm");
		 Shopstore shopstore = null;
		 try {
			shopstore = objectMapper.readValue(pstatm ,Shopstore.class);
		} catch (JsonMappingException e2) { 
			e2.printStackTrace();
		} catch (JsonProcessingException e2) { 
			e2.printStackTrace();
		}
		 int produceId = shopstore.getProduceId();
		 int shopId = shopstore.getShopId();
		// System.out.println(shopId+"--"+produceId);
				 PrintWriter out = null;
		 try {
			  out = response.getWriter();
		} catch (IOException e1) { 
			e1.printStackTrace();
		}
		   shopstore = FatoryModel.getInstanceFatory().getShopStoreDAO().byProduceId(produceId, shopId);
		
		   //将Java对象转成JSON格式
		 String patm = null;
		 try {
			 patm = objectMapper.writeValueAsString(shopstore);
		} catch (JsonProcessingException e) { 
			e.printStackTrace();
		}
		 out.print(patm);
	}
}
