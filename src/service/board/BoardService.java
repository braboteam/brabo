package service.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BoardService {

	@Autowired
	SqlSessionTemplate template;

	// 게시글 데이터베이스 등록
	public boolean insertBoard(Map m, String path, MultipartFile[] image) throws IllegalStateException, IOException {
		Map map = new HashMap<String, Object>();
		String pk = UUID.randomUUID().toString().split("-")[0];
		map.put("board_id", pk);
		map.put("id", m.get("id"));
		map.put("comments", m.get("comments"));
		// 파일없을 때
		if (image[0].isEmpty()) {
			map.put("board_image", null);
		} else { // 파일 있을 때
			File parent = new File(path);
			if (!parent.exists())
				parent.mkdirs();
			for (MultipartFile file : image) {
				String fileName = UUID.randomUUID().toString().split("-")[4];
				file.transferTo(new File(path, fileName));
				if (map.get("board_image") == null)
					map.put("board_image", fileName);
			}
		}
		return template.insert("board.insertOne", map) == 1;
	}

}
