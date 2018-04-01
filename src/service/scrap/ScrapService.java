package service.scrap;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScrapService {
	@Autowired
	SqlSessionTemplate template;
	
	public boolean scrapRecipe(String no, String id) {
		Map<String,String> map = new HashMap<>();
			map.put("id", id);
			map.put("ino", no);
			
		return template.insert("scrap.insertRecipe", map) == 1;
	}

	public boolean scrapCheck(String ino, String id) {
		Map<String,String> map = new HashMap<>();
			map.put("id", id);
			map.put("ino", ino);
		boolean chk = false;
		List<Map> list = template.selectList("scrap.selectScrapCheck", map);	
		if(list.size() == 0)
			chk = true;
	
		return chk;
	}
	
	
	
	
}
