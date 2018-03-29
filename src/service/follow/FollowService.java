package service.follow;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FollowService {

	@Autowired
	SqlSessionTemplate template;

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
			map.put("NOTSESSION", true);
		}
		return map;
	}

	public boolean follow(Map map) {
		return template.insert("follow.insertOne", map) == 1;
	}

	public boolean followCancle(Map map) {
		return template.insert("follow.deleteOne", map) == 1;
	}
}
