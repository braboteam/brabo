package service.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
		int r = 0;
		Map map = new HashMap<String, Object>(); // board삽입 Map
		Map map2 = new HashMap<>(); // board_photo삽입 Map
		String pk = UUID.randomUUID().toString().split("-")[4];
		map.put("board_id", pk);
		map.put("id", m.get("id"));
		map.put("comments", m.get("comments"));
		////////////////////////////////////////////
		map2.put("board_id", pk);
		// 파일없을 때
		if (image[0].isEmpty()) {
			map.put("board_image", null);
			r = template.insert("board.insertOne", map);
		} else { // 파일 있을 때
			File parent = new File(path);
			if (!parent.exists())
				parent.mkdirs();
			for (MultipartFile file : image) {
				String fileName = UUID.randomUUID().toString().split("-")[4];
				file.transferTo(new File(path, fileName));
				if (map.get("board_image") == null) {
					map.put("board_image", fileName);
					r = template.insert("board.insertOne", map);
				}
				// board_photo테이블 DB삽입
				map2.put("board_image", fileName);
				template.insert("board_photo.insertOne", map2);
			}
		}
		// board테이블 DB삽입
		return r == 1;
	}

	public List<Map> selectBoard() {
		return template.selectList("board.selectAll");
	}

	public List<Map> selectDetail(String pk) {
		return template.selectList("board.selectPhoto", pk);
	}

}
