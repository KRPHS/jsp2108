package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		MemberDAO dao = new MemberDAO();
		
		String name = dao.idCheck(mid);
		
		if(name.equals("")) {		// 사용 가능한 아이디 중복검색을 통해서 검색이 안될때
			request.setAttribute("res", 1);
		} else {
			request.setAttribute("res", 0);  // 이미사용중이라 사용불가 아이디
		}
		request.setAttribute("mid", mid);
	}

}
