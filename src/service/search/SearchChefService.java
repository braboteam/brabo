package service.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchChefService {

	@Autowired
	SqlSessionTemplate template;

	public List<Map> chefList(String id) {
		List<Map> list = template.selectList("member.selectList"); // 멤버전체
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

	public List<Map> searchChef(String key, String id) {
		List<Map> list = template.selectList("member.selectFind", "%" + key + "%"); // 멤버전체
		if (id != null) {
			Map me = null;
			List<Map> list2 = template.selectList("follow.selectList", id); // 팔로우한리스트
			// 팔로우한 멤버에 키추가
			for (Map map : list) {
				// 팔로우인지 체크
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

	public List<Map> searchFollow(String key, String id) {
		Map m = new HashMap<>();
		m.put("id", id);
		m.put("keyword", "%" + key + "%");
		List<Map> list = template.selectList("follow.selectSearchFollow", m); // 멤버전체
		if (id != null) {
			Map me = null;
			List<Map> list2 = template.selectList("follow.selectList", id); // 팔로우한리스트
			// 팔로우한 멤버에 키추가
			for (Map map : list) {
				// 팔로우인지 체크
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
