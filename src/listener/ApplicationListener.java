package listener;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ApplicationListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent e) {

	}

	@Override
	public void contextInitialized(ServletContextEvent e) {
		e.getServletContext().setAttribute("openchat", new ArrayList<>());
		e.getServletContext().setAttribute("recipeAuth", new HashMap<String,String>());
		System.out.println("서버오픈 - 오픈채팅방 생성완료");
	}

}
