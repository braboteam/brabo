package service.scrap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScrapService {
	@Autowired
	SqlSessionTemplate template;
	
	public boolean scrapRecipe(String no, String id) {
		
		return false;
	}
	
	
	
	
}
