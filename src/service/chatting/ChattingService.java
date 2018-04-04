package service.chatting;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.bson.Document;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import service.socket.SocketService;

@Service
public class ChattingService {
	@Autowired
	SocketService socketService;

	@Autowired
	SqlSessionTemplate template;

	@Autowired
	ServletContext application;

	MongoClient client;
	MongoDatabase db;
	MongoCollection collection;

	public ChattingService() {
		this.client = new MongoClient("13.124.70.102", 27017);
		this.db = client.getDatabase("root");
		this.collection = db.getCollection("mongochat");
	}

	// 접속유저 리스트 반환
	public List<Map> OnlineUserList(String id) {
		Map m = new HashMap<>();
		m.put("user", socketService.socketList());
		List<Map> list = template.selectList("member.selectSocketUser", m); // 현재 접속유저 정보가져오기
		//
		if (id != null) {
			Map me = null;
			List<Map> list2 = template.selectList("follow.selectList", id); // 팔로우한리스트
			// 팔로우한 멤버에 키추가
			for (Map map : list) {
				for (Map map2 : list2) {
					if (map.get("ID").equals(map2.get("FRIEND"))) {
						map.put("FID", map2.get("FRIEND"));
					}
				}
				// 현재세션유저 제거
				if (map.get("ID").equals(id)) {
					me = map;
				}
			}
			list.remove(me);
		}
		return list;
	}

	// openChat send메시지저장
	public boolean sendOpenChat(String id, String msg) throws IOException {
		Map map = template.selectOne("member.checkId", id);
		Date date = new Date(System.currentTimeMillis());
		map.put("msg", msg);
		map.put("date", date.toString().split(" ")[3]);
		((List) application.getAttribute("openchat")).add(map);
		return socketService.allSendMsg(msg);
	}

	// openChat 목록 반환
	public List<Map> listOpenChat() {
		return (List) application.getAttribute("openchat");
	}

	// 일대일채팅 send메시지 몽고에저장
	public boolean sendOneChat(String id, String friend, String msg) throws IOException {
		// Map map = template.selectOne("member.checkId", id);
		Map map = new HashMap<>();
		map.put("ID", id);
		map.put("FRIEND", friend);
		map.put("MSG", msg);
		map.put("DATE", new Date(System.currentTimeMillis()).toString().split(" ")[3]);
		Document doc = new Document(map);
		collection.insertOne(doc);
		Map m = new HashMap<>();
		m.put("id", id);
		m.put("msg", msg);
		((WebSocketSession) socketService.map.get(friend)).sendMessage(new TextMessage(new Gson().toJson(m)));
		return true;
	}

	// 몽고 일대일 채팅 목록 반환
	public List<Map> listOneChat(String id, String friend) {
		ArrayList list = new ArrayList<>();
		FindIterable<Document> finds = collection.find(Document.parse("{ $or : [{ $and : [ { \"ID\" : { $eq : \"" + id
				+ "\" } },{ \"FRIEND\" : { $eq : \"" + friend + "\" } } ] },  { $and : [ { \"ID\" : { $eq : \"" + friend
				+ "\" } }, { \"FRIEND\" : { $eq : \"" + id + "\" } } ] }] }"));

		for (Document doc : finds) {
			Map map = template.selectOne("member.checkId", doc.getString("ID"));
			map.put("FRIEND", doc.getString("FRIEND"));
			map.put("MSG", doc.getString("MSG"));
			map.put("DATE", doc.getString("DATE"));
			list.add(map);
		}

		return list;
	}
}