package service.follow;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FollowService {

	@Autowired
	SqlSessionTemplate template;

	public Map memberInfo(String id) {
		return template.selectOne("member.selectOne", id);
	}
}
