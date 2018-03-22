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

	
	public boolean inputInfo(Map info, MultipartFile iphoto) throws IllegalStateException, IOException {
		String path = ctx.getRealPath("/iphoto/"+info.get("id"));
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
			int ino = getInfoNo(rename);
		}
		
		return chk == 1;
	}


	public int getInfoNo(String rename) {
		// recipe_info 테이블의 pk 값 가져오기
		
		return template.selectOne("recipe_info.selectInfoNo",rename);
	}


	public void inputDetail(String id, Map detail, MultipartFile[] dphoto) {
		
		String path = ctx.getRealPath("/dphoto/"+id);
		File file = new File(path);
		if(!file.exists())
			file.mkdirs();
		
		int chk = 0;
		
		
		
		
		if(!dphoto[0].isEmpty()) {
			for(int i=0; i< dphoto.length; i++) {
				String rename = UUID.randomUUID().toString().substring(0, 12)+".jpg";
				File photo = new File(path,rename);
				Map<String,Object> map = new HashMap<>();
					List steps = (List)detail.get("step");
					map.put("step", steps.get(i));
				
			}
		}
	}
		
		
	
	
	

}
