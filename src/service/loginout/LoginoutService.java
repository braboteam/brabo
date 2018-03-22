package service.loginout;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginoutService {
	
	@Autowired
	SqlSessionTemplate template;
	
	public Map loginByIdAndPass(Map data) {
		Map map = template.selectOne("member.getByIdAndPassword", data);
		return map;
	}

}
