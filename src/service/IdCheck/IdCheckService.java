package service.IdCheck;

import java.io.IOException;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IdCheckService {

	@Autowired
	SqlSessionTemplate template;

	public boolean idcheck(Map data) {
		return template.selectOne("member.getByIdAndPassword", data) != null;
	}
}
