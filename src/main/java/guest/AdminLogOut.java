package guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLogOut")
public class AdminLogOut extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("sAdmin");
//		session.invalidate(); 전부삭제
		
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('관리자 로그아웃!');");
		out.println("location.href='"+request.getContextPath()+"/guest/gList.jsp';");
		out.println("</script>");
	}
}
