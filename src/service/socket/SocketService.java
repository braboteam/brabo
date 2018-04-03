package service.socket;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.WebSocketSession;

@Service
public class SocketService {
	public Map map;

	public SocketService() {
		map = new HashMap();
	}

	public boolean addSocket(String id, WebSocketSession session) {
		System.out.println(map);
		return true;
	}

}
