package service.chatting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.socket.SocketService;

@Service
public class ChattingService {
	@Autowired
	SocketService socketService;

	@Autowired
	SqlSessionTemplate template;

	public List<Map> OnlineUserList() {
		Map map = new HashMap<>();
		System.out.println(socketService.socketList());
		return null;
	}

}
