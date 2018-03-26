package service.recipe;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecipeListService {
	@Autowired
	SqlSessionTemplate template;
	
	public List<Map<String, Object>> getAllInfo() {
		List<Map<String,Object>> rInfo = template.selectList("recipe_info.selectInfo");
		
		return rInfo;
	}

}
