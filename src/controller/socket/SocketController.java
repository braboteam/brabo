package controller.socket;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import service.socket.SocketService;

@Controller("socketController")
public class SocketController extends TextWebSocketHandler {

	@Autowired
	SocketService socketService;

	// (클라이언트와)연결 되었을 때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map map = session.getAttributes();
		socketService.addSocket((String) map.get("logon"), session);
	}

	// (클라이언트와)메시지를 보낼 떄
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	}

	// (클라이언트와)연결 해제 시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

	}
}
