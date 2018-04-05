package service.join;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class JoinService {
	@Autowired
	ServletContext ctx;

	@Autowired
	SqlSessionTemplate template;

	public boolean addNewJoin(Map<String, String> param, MultipartFile profile)
			throws IllegalStateException, IOException {
		File savedir = new File(ctx.getRealPath("/photo"), param.get("id"));
		savedir.mkdirs();
		int cnt = 0;
		String fileName = String.valueOf(System.currentTimeMillis());
		Map map = new HashMap<>();
		map.put("id", param.get("id"));
		map.put("nick", param.get("nick"));
		map.put("pass", param.get("pass"));
		map.put("email", param.get("email"));
		map.put("right", 0);
		if (profile.isEmpty()) {
			map.put("profile", null);
		} else {
			profile.transferTo(new File(savedir, fileName));
			map.put("profile", "/photo/" + param.get("id") + "/" + fileName);
		}
		return template.insert("member.addNewjoin", map) == 1;
	}
}