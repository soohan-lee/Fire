package com.morackmorack.mvc.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.morackmorack.mvc.service.domain.User;

@Component
public class EchoHandler extends TextWebSocketHandler{
	
	//webSocketSession Ŭ���̾�Ʈ �� �ϳ��� ����, �ش� Ŭ���̾�Ʈ�� ����� �������� ���� 
	//�ش� ��ü�� ���� �޼����� �ְ� ����
	private List<WebSocketSession> users;
	private Map<String, Object> userMap;
	
	public EchoHandler() {
		users = new ArrayList<WebSocketSession>();
		userMap = new HashMap<String, Object>();
	}
	
	// Ŭ���̾�Ʈ�� ������ ����� ���� ����
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		System.out.println("# WEBSOCKET afterConnectionEstablished : ���� ����");
		users.add(session);
	}
	
	// Ŭ���̾�Ʈ�� ������ �޼��� �������� �� ����
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("handleTextMessage : �޼��� ����");
		System.out.println("�޼��� : "+message.getPayload());
		
		JSONObject object = new JSONObject(message.getPayload());
		String type = object.getString("type");
		
		if( type != null && type.equals("message")) {
			String sendId = object.getString("sendId");
			userMap.put(sendId, session);
			
			String recvId = object.getString("recvId");
			WebSocketSession ws = (WebSocketSession)userMap.get(recvId);
			String content = object.getString("content");
			
			if(ws != null) {
				ws.sendMessage(new TextMessage(content));
			}
	}
}
	
	// Ŭ���̾�Ʈ�� ���� ������ �� ����
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("afterConnectionClosed : ���� ����");
		users.remove(session);
	}

}
