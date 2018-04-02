package service.mypage;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MyPageService {

	@Autowired
	SqlSessionTemplate template;

	@Autowired
	ServletContext ctx;

	public Map MyInfo(String id) {
		Map map = template.selectOne("member.selectOne", id);
		// 게시물 갯수
		map.put("BOARD_COUNT", ((Map) template.selectOne("board.selectCount", id)).get("COUNT"));
		map.put("RECIPE_COUNT", ((Map) template.selectOne("recipe_info.selectCount", id)).get("COUNT"));
		map.put("SCRAP_COUNT", ((Map) template.selectOne("scrap.selectCount", id)).get("COUNT"));
		return map;
	}

	public boolean updateMember(Map<String, String> param, MultipartFile img)
			throws IllegalStateException, IOException {
		File savedir = new File(ctx.getRealPath("/photo"), param.get("id"));
		if (!savedir.exists())
			savedir.mkdirs();
		String fileName = String.valueOf(System.currentTimeMillis());
		Map map = new HashMap<>();
		map.put("id", (String) param.get("id"));
		map.put("nick", (String) param.get("nick"));
		map.put("pass", (String) param.get("pass"));
		map.put("email", (String) param.get("email"));
		if (!img.isEmpty()) {
			// 기존파일제거
			Map m = template.selectOne("member.checkId", param.get("id"));
			File f = new File(ctx.getRealPath((String) m.get("PROFILE")));
			f.delete();
			// 파일추가
			img.transferTo(new File(savedir, fileName));
			map.put("profile", "/photo/" + param.get("id") + "/" + fileName);
		}
		map.put("right", 0);
		return template.update("member.updateMember", map) == 1;
	}
}
