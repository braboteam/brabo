package service.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecipeListService {
	@Autowired
	SqlSessionTemplate template;
	
	// 승인된 레시피만 가져오기 
	public List<Map<String, Object>> getAllInfo() {
		Map<String,String> map = new HashMap<>();
			map.put("right", "right");
		List<Map<String,Object>> rInfo = template.selectList("recipe_info.selectInfo",map);
		
		return rInfo;
	}
	
	public int getAllList() {
		Map<String,String> map = new HashMap<>();
			map.put("right", "right");
		List<Map<String,String>> list = template.selectList("recipe_info.selectInfo",map);
		int size = 0;
		if(list != null)
			size = list.size();
		
		return size;
	}

	
	
	

}
