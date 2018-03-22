package service.recipe;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class RecipeService {
	@Autowired
	SqlSessionTemplate template;
	@Autowired
	ServletContext ctx;

	
	public boolean inputInfo(Map info, MultipartFile iphoto) throws IllegalStateException, IOException {
		String path = ctx.getRealPath("/save/"+info.get("id"));
		File file = new File(path);
		if(!file.exists())
			file.mkdirs();
		
		int chk = 0;
		if(!iphoto.isEmpty()) {
			String rename = UUID.randomUUID().toString().substring(0, 12)+".jpg";
			File photo = new File(path,rename);
			info.put("iphoto", rename);
			chk = template.insert("recipe_info.insertInfo", info);
			iphoto.transferTo(photo);
		}
		
		return chk == 1;
	}
		
	
	
	

}
