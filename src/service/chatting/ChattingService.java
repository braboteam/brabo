package service.chatting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

}
