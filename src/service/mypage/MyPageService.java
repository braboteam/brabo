package service.mypage;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageService {

	@Autowired
	SqlSessionTemplate template;

	public Map MyInfo(String id) {
		Map map = template.selectOne("member.selectOne", id);
		// 게시물 갯수
		map.put("BOARD_COUNT", ((Map) template.selectOne("board.selectCount", id)).get("COUNT"));
		map.put("RECIPE_COUNT", ((Map) template.selectOne("recipe_info.selectCount", id)).get("COUNT"));
		map.put("SCRAP_COUNT", ((Map) template.selectOne("scrap.selectCount", id)).get("COUNT"));
		return map;
	}
}
