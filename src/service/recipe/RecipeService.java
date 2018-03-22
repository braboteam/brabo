package service.recipe;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class RecipeService {
	@Autowired
	SqlSessionTemplate template;
	
	
	public boolean inputRecipe(Map<String, Object> param, MultipartFile[] photo) {
		
		return false;
	}

}
