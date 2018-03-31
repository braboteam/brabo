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

	// ajax로 댓글 내용 가져오기  
	public List<Map<String,Object>> getReplyAjax(String ino,String id) {
		List<Map<String,Object>> list = template.selectList("recipe_reply.selectAll", ino	);
			list.add(getAvg(ino));
			list.add(getProfile(id));
		
		return list;	
	}
	
	
	
	// 댓글 테이블 평점 가져오기
	public Map<String,Object> getAvg(String ino) {
		
		return template.selectOne("recipe_reply.selectAVg",ino);
	}
	
	// 댓글 출력시 필요한 프로필 사진, 닉네임 출력위한 데이터 가져오기
	public Map<String, Object> getProfile(String id) {
		Map<String,String> map = new HashMap<>();
			map.put("id", id);
		return template.selectOne("member.getByIdAndPassword",map);
	}


	// 댓글 삭제 전, 페이지 셋팅 위해 해당 페이지의 recipe_info pk 값 가져오기
	public String getNo(String no) {
		
		return template.selectOne("recipe_reply.selectInfoNo", no);
	}

	// 댓글 삭제  
	public boolean delReply(String no) {
		
		return template.delete("recipe_reply.deleteOne", no) == 1;
	}
	
	
	
	
	
}
