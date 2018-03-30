package service.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecipeReplyService {
	@Autowired
	SqlSessionTemplate template;
	
	// 댓글 등록
	public void inputReply(String id, Map<String, String> param) {
		param.put("writer", id);
		template.insert("recipe_reply.insertReply", param);
	}
		
	
	// 댓글 내용 가져오기
	public List<Map<String,Object>> getReply(String ino) {
		List<Map<String,Object>> list = template.selectList("recipe_reply.selectAll", ino	);
		
		return list;
	}

	// 댓글 테이블 평점 가져오기
	public Map<String,Object> getAvg(String ino) {
		
		return template.selectOne("recipe_reply.selectAVg",ino);
	}

	public Map<String, Object> getProfile(String id) {
		Map<String,String> map = new HashMap<>();
			map.put("id", id);
		return template.selectOne("member.getByIdAndPassword",map);
	}
	
	
	
	
}
