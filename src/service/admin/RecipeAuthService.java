package service.admin;

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
	
	// 권한 변경된 레시피의 right 값이 0인지 1인지 확인하는 과정
	public boolean checkRight(String no) {
		Map m = new HashMap<>();
			m.put("no", no);
		Map map = template.selectOne("recipe_info.selectInfo",m);
		String r = 	String.valueOf(map.get("RIGHT"));
		
		return r.equals("1");
	}
	
	// 해당 레시피의 작성자 가져오기
	public String getWriter(String no) {
		Map m = new HashMap<>();
			m.put("no", no);
		Map map = template.selectOne("recipe_info.selectInfo", m);
		
		return (String)map.get("ID");
	}
	
	
	
}
