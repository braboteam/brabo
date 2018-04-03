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
		// 로그인 아이디 - WebSocket 등록
		Map map = session.getAttributes();
		if (map.get("logon") != null) {
			socketService.addSocket((String) map.get("logon"), session);
		}
	}

	// (클라이언트와)메시지를 보낼 떄
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("메시지전송");
	}

	// (클라이언트와)연결 해제 시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map map = session.getAttributes();
		if (map.get("logon") != null) {
			socketService.removeSocket((String) map.get("logon"), session);
		}
	}
}
