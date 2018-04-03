package service.follow;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.socket.SocketService;

@Service
public class FollowService {

	@Autowired
	SqlSessionTemplate template;

	@Autowired
	ServletContext application;

	public Map memberInfo(String id, String friend) {
		Map map = template.selectOne("member.selectOne", friend);
		Map m = new HashMap<>();
		if (id != null) {
			m.put("id", id);
			m.put("friend", friend);
			// 팔로우인지?
			if (template.selectOne("follow.selectOne", m) != null) {
				map.put("FRIEND", true);
			}
		} else {
			// 내상태 = 미접속상태
			map.put("NOTSESSION", true);
		}
		// 게시물 갯수
		map.put("BOARD_COUNT", ((Map) template.selectOne("board.selectCount", friend)).get("COUNT"));
		map.put("RECIPE_COUNT", ((Map) template.selectOne("recipe_info.selectCount", friend)).get("COUNT"));
		// 해당 유저 로그인 상태체크
		if (application.getAttribute(friend) != null) {
			map.put("logon", true);
		}
		return map;
	}

	public boolean follow(Map map) {
		return template.insert("follow.insertOne", map) == 1;
	}

	public boolean followCancle(Map map) {
		return template.insert("follow.deleteOne", map) == 1;
	}

	// followInfo 페이지에서 레시피 목록 클릭했을 경우
	public List<Map<String, Object>> getRecipe(String id) {
		Map<String, String> map = new HashMap<>();
		map.put("right", "right");
		map.put("id", id);
		// 해당 유저이름으로 레시피 검색해서 가져오기
		List<Map<String, Object>> list = template.selectList("recipe_info.selectInfo", map);
		return list;
	}
}
