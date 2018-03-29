package service.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecipeDetailService {
	@Autowired
	SqlSessionTemplate template;
	
	// recipe_info 테이블에서 no로 데이터 가져오기
	public Map getInfo(String no) {
		Map<String,String> map = new HashMap<>();
			map.put("no", no);
		return template.selectOne("recipe_info.selectInfo",map);
	}
	
	// recipe_detail 테이블에서 ino로 데이터 가져오기
	public List<Map> getDetail(String ino) {
		List<Map> list =  template.selectList("recipe_detail.selectDetail", ino);
		
		return list;
	}

	// member 테이블에서 해당 레시피 작성자 id로 데이터 가져오기
	public Map getProfile(String id) {
		Map<String,String> map = new HashMap<>();
			map.put("id", id);
		return template.selectOne("member.getByIdAndPassword",map);
	}

	public List<Map> getFinal(String ino) {
		List<Map> list = template.selectList("recipe_final.selectFinal",ino);
		
		return list;
	}
	
	
	
	
}
