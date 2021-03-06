package org.db.psd.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebFilter("/*")
public class EncodingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		    
		//把request转换成HttpServletRequest
		HttpServletRequest httpServletRequest =(HttpServletRequest) request;
		
		Object object = httpServletRequest.getSession().getAttribute("employee");
		//获取正在访问的页面路径
		String URL = httpServletRequest.getRequestURI();
		int begin = URL.lastIndexOf("/") + 1;
		
		String endUrl = URL.substring(begin,URL.length());
		
		HttpServletResponse httpServletResponse = (HttpServletResponse)response;
		
		if(object == null && !endUrl.equals("login.jsp") && !endUrl.equals("ByEmail.jsp")&& !endUrl.equals("es") && !endUrl.equals("EmployeeServer"))
		{
			 httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/login.jsp"); 
		}
		
		chain.doFilter(request, response); 
	}

	
}
