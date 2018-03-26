package service.recipe;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecipeReplyService {
	@Autowired
	SqlSessionTemplate template;
	
	// 댓글 등록
	public boolean inputReply(String id, Map<String, String> param) {
		param.put("writer", id);
		
		return template.insert("recipe_reply.insertReply", param) == 1;
	}
	
}
