package service.recipeAuth;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.net.aso.m;

@Service
public class RecipeAuthService {
	@Autowired
	SqlSessionTemplate template;
	
	public boolean authReciep(String no) {
		
		return template.update("recipe_info.authRecipe", no) == 1;
	}

	public boolean checkAdmin(String id) {
		Map<String,String> map = new HashMap<>();
			map.put("id", id);
		Map m = template.selectOne("member.getByIdAndPassword", map);
		boolean rst = false;
		System.out.println(m.get("RIGHT"));
		
		if(String.valueOf(m.get("RIGHT")).equals("1")) 
			rst = true;
	
		return rst;
	}
	
	// 관리자 페이지에 보여줄 모든 레시피 목록 가져오기
	public List<Map> getAllRecipe() {
		
		return template.selectList("recipe_info.selectInfo");
	}

	public int getAllList() {
		List<Map<String,String>> list =  template.selectList("recipe_info.selectInfo");
		int size = 0;
		if(list != null)
			size = list.size();
		
		return size;
	}
	
	
	
}
