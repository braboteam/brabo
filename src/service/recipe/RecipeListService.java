package service.recipe;

import java.util.ArrayList;
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
	
	// recipe_info 테이블에서 right=1인 데이터의 카테고리만 뽑아온다. 
	// index 페이지 출력용..
	public List getAllCate(List<Map<String, Object>> all) {
		List list = new ArrayList();
		Map<String,String> map = new HashMap<>();
		
		for(Map<String,Object> m :all) {
				map.put(String.valueOf(m.get("CATE")), String.valueOf(m.get("CATE")));
		}
		for(String s : map.keySet()) {
			Map m = new HashMap<>();
				m.put("cateChk", map.get(s));
			list.add(m);
		}
	
		return list;
	}

	public List<Map<String, Object>> getAllInfoByCate(String s) {
		Map<String,String> map = new HashMap<>();
			map.put("right", "right");
			map.put("cate", "%"+s+"%");
		List<Map<String,Object>> rInfo = template.selectList("recipe_info.selectInfo",map);
		
		return rInfo;
	}
	
	
	public List<Map<String, Object>> getAllInfoByRate(String s) {
		Map<String,String> map = new HashMap<>();
			map.put("right", "right");
		if(!s.equals("all"))
			map.put("cate", "%"+s+"%");
		
		List<Map<String,Object>> rInfo = template.selectList("recipe_info.selectByRateAndCate", map);
		
		return rInfo;
	}
	
	// 텍스트 검색으로 카테고리+제목에서 검색하기
	public List<Map<String, Object>> getAllInfoByCateAndTitle(String c) {
		Map<String,String> map = new HashMap<>();
			map.put("right", "right");
			map.put("cate", "%"+c+"%");
			map.put("title", "%"+c+"%");
		List<Map<String,Object>> rInfo = template.selectList("recipe_info.selectInfo",map);	
		
		return rInfo;
	}

	public List<Map<String, Object>> getAllMine(String mine) {
		Map<String,String> map = new HashMap<>();
			map.put("right", "right");
			map.put("id", mine);
		List<Map<String,Object>> rInfo = template.selectList("recipe_info.selectInfo",map);	
		
		return rInfo;
	}

	


}
