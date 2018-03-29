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

	// 게시판 테이블 가져오기
	public List<Map> selectBoard(String id) {
		List<Map> list = null;
		list = template.selectList("board.selectAll");

		List<Map> list2 = template.selectList("board.selectLikeCount");
		List<Map> list3 = template.selectList("board_comments.selectCount");
		for (Map m : list) {
			// 각 게시물에 좋아요 갯수를 COUNT라는 컬럼명으로 넣기
			for (Map m2 : list2) {
				if (m.get("BOARD_ID").equals(m2.get("BOARD_ID"))) {
					m.put("COUNT", m2.get("COUNT"));
				}
			}
			// 각 게시물이 현재 로그인사용자가 좋아요한 상태인 글인지 체크
			if (id != null) {
				Map map = new HashMap<>();
				map.put("id", id);
				map.put("board_id", (String) m.get("BOARD_ID"));
				if (template.selectOne("board.selectLike", map) != null) {
					m.put("LIKE", true);
				}
			}
			// 각 게시물의댓글 갯수등록
			for (Map m3 : list3) {
				if (m.get("BOARD_ID").equals(m3.get("BOARD_ID"))) {
					m.put("COMMENTS_COUNT", m3.get("COUNT"));
				}
			}
		}
		return list;
	}

	// 게시판 테이블 사진 모두 가져오기
	public List<Map> selectDetail(String pk, String id) {
		List<Map> list = template.selectList("board.selectPhoto", pk);
		Map map2 = new HashMap<>();
		map2.put("id", id);
		map2.put("board_id", pk);
		Map m = template.selectOne("board_like.selectCount", pk);
		Map m2 = template.selectOne("board_comments.selectCount", map2);
		Map m3 = template.selectOne("board.selectMember", pk);
		for (Map map : list) {
			// 좋아요 카운트
			if (m != null)
				map.put("COUNT", m.get("COUNT"));
			// 댓글 카운트
			if (m2 != null)
				map.put("COMMENTS_COUNT", m2.get("COUNT"));
			if (id != null) {
				// 해당 세션이 좋아요한 게시글인지 확인
				if (template.selectOne("board.selectLike", map2) != null) {
					map.put("LIKE", true);
				}
			}
			map.put("PROFILE", m3.get("PROFILE"));
			map.put("NICK", m3.get("NICK"));

		}
		return list;
	}

	// 게시판글 좋아요
	public boolean insertLike(String pk, String id) {
		Map map = new HashMap<>();
		map.put("board_id", pk);
		map.put("id", id);
		return template.insert("board_like.insertOne", map) == 1;
	}

	// 게시판글 좋아요 취소
	public boolean deleteLike(String pk, String id) {
		Map map = new HashMap<>();
		map.put("board_id", pk);
		map.put("id", id);
		return template.delete("board_like.deleteOne", map) == 1;
	}

	// 댓글달기
	public boolean insertComments(Map map, String id) {
		System.out.println("insertService!");
		Map m = new HashMap<>();
		m.put("board_id", (String) map.get("board_id"));
		m.put("id", id);
		m.put("comments", (String) map.get("comments"));
		return template.insert("board_comments.insertOne", m) == 1;
	}

	// 댓글목록 가져오기
	public List<Map> selectComments(String pk) {
		return template.selectList("board_comments.selectAll", pk);
	}

}
