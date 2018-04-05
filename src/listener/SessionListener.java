package listener;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;

import service.socket.SocketService;

@WebListener
public class SessionListener implements HttpSessionListener {

	@Autowired
	SocketService socketService;

	@Autowired
	ServletContext application;

	@Override
	public void sessionCreated(HttpSessionEvent e) {

	}

	// 세션파괴시 어플리케이션, 소켓서비스에 있는 세션제거
	@Override
	public void sessionDestroyed(HttpSessionEvent e) {
		HttpSession session = e.getSession();
		if (session.getAttribute("logon") != null) {
			if (application.getAttribute((String) session.getAttribute("logon")) != null) {
				application.removeAttribute((String) session.getAttribute("logon"));
			}
			socketService.removeSocket((String) session.getAttribute("logon"));
		}
	}

}
