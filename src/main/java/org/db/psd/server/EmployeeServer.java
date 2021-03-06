package org.db.psd.server;

import java.io.IOException;
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
import org.db.psd.model.EmployeeJob;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

@WebServlet("/EmployeeServer")
public class EmployeeServer extends HttpServlet {

	String op = null;
	String path = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		op = request.getParameter("op");
		if (op.equals("login")) {
			doLogin(request, response);
		} else if (op.equals("create")) {
			doCreate(request, response);
		} else if (op.equals("joblist")) {
			doJobList(request, response);
		} else if (op.equals("select")) {
			doSelect(request, response);
		} else if (op.equals("Code")) {
			doByCode(request, response);
		} else if (op.equals("moreSelect")) {
			doByMore(request, response);
		} else if (op.equals("Update")) {
			doUpdate(request, response);
		}   else if (op.equals("updatepass")) {
			doUpdatePass(request, response);
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doLogin(HttpServletRequest request, HttpServletResponse response) {
		String employeeCode = request.getParameter("employeeCode");
		String employeePassword = request.getParameter("employeePassword");

		Employee employee = new Employee(0, employeeCode, null, employeePassword, null, null, null, null, null, null,
				null, null, null, 0, null, null,null);
		int value = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeLogin(employee);
		 
		if (value >0) {
			request.getSession().setAttribute("employee", employee);
			path = "/Supermanager/show.jsp";
		} else {
			path = "/login.jsp";
		}
	}

	protected void doJobList(HttpServletRequest request, HttpServletResponse response) {
		//?????????smartupload
				SmartUpload smartupload = new SmartUpload();
				smartupload.setAllowedFilesList("jpg,gif,png,jpeg,webp");//??????????????????
				smartupload.setMaxFileSize(1024*1024*1);//????????????1mb??????
				//?????????smartupload ??????servelet??????????????????????????????smartupload
				 try {
					smartupload.initialize(getServletConfig(), request, response);
				} catch (ServletException e1) {
					e1.printStackTrace();
				}
					//????????????????????????????????????????????????
//					smartUpload.setAllowedFilesList("");
				 String fileName="";
				 long time=0;
				 
				 try {
					 //??????????????????
					smartupload.upload();
					//???????????????????????????
						 Files files = smartupload.getFiles();
						 
						 System.out.println(files.getCount());
						 //??????????????????
						 for(int i = 0 ; i < files.getCount() ; i++) {
							 //????????????
							 File file = files.getFile(i);
							 //????????????
							  fileName = file.getFieldName();
							   time = System.currentTimeMillis();
							 //??????
							  String path = "E:\\Java web\\SmartUpload\\"+time+fileName+".jpg";
							 //?????????????????????
							 file.saveAs(path, smartupload.SAVE_PHYSICAL);
						 }
				} catch (ServletException | IOException | SmartUploadException e) {
					 
					e.printStackTrace();
				}
				 request.setAttribute("fileName", time+fileName);
		
		List<EmployeeJob> employeeJobs = FatoryModel.getInstanceFatory().getEmployeeJobDAO().employeeJobList();
		request.setAttribute("employeeJobs", employeeJobs);
			
			path = "/Supermanager/regist.jsp";
		
	}

	protected void doCreate(HttpServletRequest request, HttpServletResponse response) {
		

		String employeeCode = request.getParameter("employeeCode");
		String employeeName = request.getParameter("employeeName");
		String employeePassword = request.getParameter("employeePassword");
		String employeeGender = request.getParameter("employeeGender");

		String employeePhone = request.getParameter("employeePhone");
		String employeeEmail = request.getParameter("employeeEmail");
		String employeeBrithday =request.getParameter("employeeBrithday");

		 
		String employeeIdentity = request.getParameter("employeeIdentity");
		String employeeState = request.getParameter("employeeState");
		String employeeIntroduction = request.getParameter("employeeIntroduction");
		String employeeAddress = request.getParameter("employeeAddress");
		String employeeEducation = request.getParameter("employeeEducation");
		String employeeJobName = request.getParameter("employeeJobName");
		String employeeDescribe = request.getParameter("employeeDescribe");
		String pciture = request.getParameter("pciture");
		 System.out.println(pciture+"+++++++++"+employeeJobName+"===="+employeePassword);
		EmployeeJob employeeJob = new EmployeeJob(0, employeeJobName, employeeDescribe);
		int employeeJobId = FatoryModel.getInstanceFatory().getEmployeeJobDAO().jobCreate(employeeJob);

		Employee employee = new Employee(0, employeeCode, employeeName, employeePassword, employeeGender, employeePhone,
				employeeEmail, employeeBrithday, employeeIdentity, employeeState, employeeIntroduction, employeeAddress,
				employeeEducation, employeeJobId, null, null,pciture);

		boolean b = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeCreate(employee);

		if (b) {
			path = "/Supermanager/welcome.jsp";
		} else {
			System.out.println("false");
			path="/Supermanager/regist.jsp";
		}
	}

	protected void doSelect(HttpServletRequest request, HttpServletResponse response) {
		int newpage = 1;
		String position = request.getParameter("position");
		if (position != null) {
			newpage = Integer.parseInt(position);
		}
		int size = 3;
		long allRows = FatoryModel.getInstanceFatory().getSplitDAO().allRows();
		long allPage = FatoryModel.getInstanceFatory().getSplitDAO().allPages(allRows, size);

		long currentRows = FatoryModel.getInstanceFatory().getSplitDAO().currentRows(newpage, size);
		List<Employee> employees = FatoryModel.getInstanceFatory().getEmployeeDAO().showInfermation(currentRows, size);
		List<EmployeeJob> employeeJobs = FatoryModel.getInstanceFatory().getEmployeeJobDAO().employeeJobList();
		request.setAttribute("employeeJobs", employeeJobs);
		
		request.setAttribute("allPage", allPage);
		request.setAttribute("employees", employees);
		path = "/Supermanager/select.jsp";
	}
	protected void doByCode(HttpServletRequest request, HttpServletResponse response) {
		 
		String employeeCode = request.getParameter("employeeCode");
	 
		Employee employee = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeById(employeeCode);
		//System.out.println(employee);
		if(employee!=null) {
		request.setAttribute("employee", employee);
		path = "/Supermanager/byCode.jsp";
		}else {
			path = "/EmployeeServer?op=select";
		}
	}
	protected void doByMore(HttpServletRequest request, HttpServletResponse response) {
		String wordkey = request.getParameter("wordkey");
		String employeeState = request.getParameter("employeeState");
		String employeeJobName = request.getParameter("employeeJobName");
		int type = Integer.parseInt(request.getParameter("type"));
		 
		List<Employee> employees =FatoryModel.getInstanceFatory().getEmployeeDAO().multipleChoice(wordkey,employeeState,employeeJobName,  type);
		 
		if(employees!=null) {
			request.setAttribute("employees", employees);
			path="/Supermanager/byMore.jsp";
		}else {
			System.out.println("????????????");
			path="/EmployeeServer?op=select";
		}
		

		
		
	}
	protected void doUpdate(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		String employeeCode = request.getParameter("employeeCode");
		String employeeName = request.getParameter("employeeName");
		/* String employeePassword = request.getParameter("employeePassword"); */
		String employeeGender = request.getParameter("employeeGender");

		String employeePhone = request.getParameter("employeePhone");
		String employeeEmail = request.getParameter("employeeEmail");
		String employeeBrithday = request.getParameter("employeeBrithday");

 
		String employeeIdentity = request.getParameter("employeeIdentity");
		String employeeState = request.getParameter("employeeState");
		String employeeIntroduction = request.getParameter("employeeIntroduction");
		String employeeAddress = request.getParameter("employeeAddress");
		String employeeEducation = request.getParameter("employeeEducation");
		int employeeJobId = Integer.parseInt(request.getParameter("employeeJobId"));
		String employeeJobName = request.getParameter("employeeJobName");
		String employeeDescribe = request.getParameter("employeeDescribe");
		String pciture = request.getParameter("pciture");
		
		EmployeeJob employeeJob = new EmployeeJob(employeeJobId, employeeJobName, employeeDescribe);
		boolean b = FatoryModel.getInstanceFatory().getEmployeeJobDAO().jobUpdate(employeeJob);
		if(b) {
			Employee employee = new Employee(0, employeeCode, employeeName, null, employeeGender, employeePhone,
				employeeEmail, employeeBrithday, employeeIdentity, employeeState, employeeIntroduction, employeeAddress,
				employeeEducation, 0, null, null,pciture);
			b=FatoryModel.getInstanceFatory().getEmployeeDAO().employeeUpdateInformation(employee);
			if(b) {
				System.out.println("true");
				request.setAttribute("employeeCode", employeeCode);
				path="/EmployeeServer?op=Code";
			}else {
				System.out.println("false");
				path="/false.jsp";
			}
		}
		
		
	}
	protected void doUpdatePass(HttpServletRequest request, HttpServletResponse response) {
		String employeePassword = request.getParameter("employeePassword");
		Employee employee = (Employee)request.getSession().getAttribute("employee");
		
		String employeeCode = employee.getEmployeeCode();
		
		boolean b = FatoryModel.getInstanceFatory().getEmployeeDAO().employeeUpdatePassword(employeeCode,employeePassword);
		if(b) {
			path="/Supermanager/welcome.jsp";
		}else {
			System.out.println("????????????");
			path="/Supermanager/show.jsp";
		}
	}
}
