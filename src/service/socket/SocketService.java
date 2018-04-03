package service.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;

@Service
public class SocketService {
	// id, session
	public Map map;

	public SocketService() {
		map = new HashMap();
	}

	// 로그인시 소켓세션 추가
	public boolean addSocket(String id, WebSocketSession session) {
		map.put(id, session);
		return true;
	}

	// 로그아웃 또는 브라우저종료 시 소켓세션 제거
	public boolean removeSocket(String id) {
		map.remove(id);
		return true;
	}

	// 소켓을 담고있는 맵의 키를 리스트로 반환
	public List socketList() {
		return new ArrayList<>(map.keySet());
	}

	// 특정 사용자에게 메시지보내기
	public boolean sessionOutSendMsg(String id) throws IOException {
		Map msgMap = new HashMap<>();
		msgMap.put("sessionOut", "다른 브라우저에서 현재 계정이 접속되어 로그아웃됩니다.\n접속 ip : "
				+ ((WebSocketSession) map.get(id)).getRemoteAddress().getAddress().getHostAddress() + "");
		((WebSocketSession) map.get(id)).sendMessage(new TextMessage(new Gson().toJson(msgMap)));
		return true;
	}

}
