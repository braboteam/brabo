package service.chatting;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.socket.SocketService;

@Service
public class ChattingService {
	@Autowired
	SocketService socketService;

	@Autowired
	SqlSessionTemplate template;

	@Autowired
	ServletContext application;

	// 접속유저 리스트 반환
	public List<Map> OnlineUserList(String id) {
		Map m = new HashMap<>();
		m.put("user", socketService.socketList());
		List<Map> list = template.selectList("member.selectSocketUser", m); // 현재 접속유저 정보가져오기
		//
		if (id != null) {
			Map me = null;
			List<Map> list2 = template.selectList("follow.selectList", id); // 팔로우한리스트
			// 팔로우한 멤버에 키추가
			for (Map map : list) {
				for (Map map2 : list2) {
					if (map.get("ID").equals(map2.get("FRIEND"))) {
						map.put("FID", map2.get("FRIEND"));
					}
				}
				// 현재세션유저 제거
				if (map.get("ID").equals(id)) {
					me = map;
				}
			}
			list.remove(me);
		}
		return list;
	}

	// openChat send메시지저장
	public boolean sendOpenChat(String id, String msg) throws IOException {
		Map map = template.selectOne("member.checkId", id);
		Date date = new Date(System.currentTimeMillis());
		map.put("msg", msg);
		map.put("date", date.toString().split(" ")[3]);
		((List) application.getAttribute("openchat")).add(map);
		return socketService.allSendMsg(msg);
	}

	// openChat 목록 반환
	public List<Map> listOpenChat() {
		return (List) application.getAttribute("openchat");
	}
}
