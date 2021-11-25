package org.db.psd.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.db.psd.base.Execute_CRUD;
import org.db.psd.fatory.FatoryModel;
import org.db.psd.model.Employee;
 
import com.mysql.cj.x.protobuf.MysqlxConnection.Close;

@WebServlet("/es")
public class EmailServer extends HttpServlet {

	 String op = null;
	 String path = null;
	 @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 this.doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		op = request.getParameter("op");
		if(op.equals("byEmail")) {
			doByEmail(request, response);
		}else if(op.equals("update")) {
			doUpdate(request, response);
		}

		request.getRequestDispatcher(path).forward(request, response);
	}
	protected void doByEmail(HttpServletRequest request, HttpServletResponse response) {
		//接收方邮箱地址
		String toEmail = request.getParameter("toEmail");
		
		//发送内容
		String context = request.getParameter("context");
		
		//配置参数
		Properties props = new Properties();
		props.setProperty("mail.smtp.auth", "true");//设置访问smtp服务器需要认证
		props.setProperty("mail.transport.protocol", "smtp"); //设置访问服务器的协议
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.socketFactory.port", "465");
		
        //把邮件发送参数加载到邮件会议中
		Session session = Session.getDefaultInstance(props);
		session.setDebug(true); //打开debug功能
		
		Message msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress("1157457604@qq.com"));
			//设置发件人，163邮箱要求发件人与登录用户必须一致（必填），其它邮箱不了解
			msg.setText(context); //设置邮件内容
			msg.setSubject("修改密码"); //设置邮件主题
			
			Transport trans = session.getTransport();
			trans.connect("smtp.qq.com",465, "1157457604@qq.com", "googfdbkdtwkfjga"); //连接邮箱smtp服务器，25为默认端口
			trans.sendMessage(msg, new Address[]{new InternetAddress(toEmail)}); //发送邮件
			
			trans.close(); //关闭连接
			PrintWriter out;
			try {
				out = response.getWriter();
				out.print("发送成功");
			} catch (IOException e1) { 
				e1.printStackTrace();
			}					
			String sql = "select * from employee where employeeEmail = ?";
			Object[]object= {toEmail};
			Execute_CRUD execute_CRUD = new Execute_CRUD();
			ResultSet rs = execute_CRUD.execute_Query(sql, object);
			try {
				if(rs.next()) {
					String employeeCode = rs.getString("employeeCode");
					request.setAttribute("employeeCode", employeeCode);
					path="/NewPassword.jsp";
				}else { 
						System.out.println("用户不存在！");				 
					path="/login.jsp";
				}
			} catch (SQLException e) { 
				e.printStackTrace();
			}finally {
				execute_CRUD.closeRs(rs);
			}
			 
		} catch (AddressException e) { 
			e.printStackTrace();
		} catch (MessagingException e) { 
			e.printStackTrace();
		} 
	}
	protected void doUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {		 
		String employeeCode = request.getParameter("employeeCode");		
		String employeePassword = request.getParameter("employeePassword");
		boolean b = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeUpdatePassword(employeeCode,employeePassword);	 
		if(b) {
			System.out.println("修改成功"); 
			path="/login.jsp";
		}else {
			System.out.println("修改失败"); 		 
			path="/ByEmail.jsp";
		}
	}
//	protected void doUpload(HttpServletRequest request, HttpServletResponse response) {
//		String employeeCode = request.getParameter("employeeCode");
//		SmartUpload smartupload = new SmartUpload();
//		smartupload.setAllowedFilesList("jpg,gif,png,jpeg,webp");//设置格式限制
//		smartupload.setMaxFileSize(1024*1024*1);//限制图片1mb大小
//		//初始化smartupload 。将servelet的相关配置对象配置到smartupload
//		 try {
//			smartupload.initialize(getServletConfig(), request, response);
//		} catch (ServletException e1) {
//			e1.printStackTrace();
//		}
//			//控制上传文件的大小，类型，数量等
////			smartUpload.setAllowedFilesList("");
//		 String fileName="";
//		 long time=0;	 
//		 try {
//			 //确定上传功能
//			smartupload.upload();
//			//获取相应的文件信息
//				 Files files = smartupload.getFiles();		 
//				 System.out.println(files.getCount());
//				 //遍历其中文件
//				 for(int i = 0 ; i < files.getCount() ; i++) {
//					 //取出文件
//					 File file = files.getFile(i);
//					 //文件名字
//					  fileName = file.getFieldName();
//					   time = System.currentTimeMillis();
//					 //路径
//					  String path = "E:\\Java web\\SmartUpload\\"+time+fileName+".jpg";
//					 //上传的物理路径
//					 file.saveAs(path, smartupload.SAVE_PHYSICAL);
//				 }
//		} catch (ServletException | IOException | SmartUploadException e) {			 
//			e.printStackTrace();
//		}
//		 request.setAttribute("fileName", time+fileName);
//		Employee employee = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeById(employeeCode);
//		request.setAttribute("employee", employee);
//		path = "/Supermanager/byCode.jsp";
//	}
}
