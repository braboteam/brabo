package service.recipe;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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

	// recipe_info 테이블에 데이터 집어넣기
	public boolean inputInfo(Map info, MultipartFile iphoto) throws IllegalStateException, IOException {
		String path = ctx.getRealPath("/iphoto/" + info.get("id"));
		File file = new File(path);
		if (!file.exists())
			file.mkdirs();

		int chk = 0;
		if (!iphoto.isEmpty()) {
			String rename = (String) info.get("iphoto");
			File photo = new File(path, rename);

			chk = template.insert("recipe_info.insertInfo", info);
			iphoto.transferTo(photo);
		}

		return chk == 1;
	}

	// recipe_info 테이블의 pk 값 가져오기
	public int getInfoNo(String iphoto) {

		return template.selectOne("recipe_info.selectInfoNo", iphoto);
	}

	// recipe_detail 테이블에 데이터 집어넣기
	public boolean inputDetail(String id, Map detail, MultipartFile[] dphoto) throws IllegalStateException, IOException {

		String path = ctx.getRealPath("/dphoto/" + id);
		File file = new File(path);
		if (!file.exists())
			file.mkdirs();

		int chk = 0;
		List steps = (List) detail.get("step");
		List recipies = (List) detail.get("recipe");

		for (int i = 0; i < steps.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			String rename = UUID.randomUUID().toString().substring(0, 12) + ".jpg";
			File photo = new File(path, rename);
			map.put("ino", detail.get("ino"));
			map.put("step", steps.get(i));
			map.put("recipe", recipies.get(i));
			map.put("dphoto", rename);
			chk += template.insert("recipe_detail.insertDetail", map);
			dphoto[i].transferTo(photo);
		}
		
		return chk == steps.size();
	}
		
		

	
	
	
	
}
