package oxq.action.game;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

public class Server {
	private ServerSocket ss; 
//	public ArrayList<GameHandlerObject> gameList;
//	private ArrayList<WaitChatHandler> waitList;
	
	private ArrayList<Handler> list;

	public Server() {

		try {
			ss = new ServerSocket(9600);
			System.out.println("토탈서버 준비완료");

//			gameList = new ArrayList<GameHandlerObject>();
//			waitList = new ArrayList<WaitChatHandler>();
			list = new ArrayList<Handler>();

			while (true) {
				Socket socket = ss.accept();

//				WaitChatHandler waitHandler = new WaitChatHandler(socket, waitList); // 스레드 생성
//				waitHandler.start(); // 스레드 시작
//				waitList.add(waitHandler);
//				
//				GameHandlerObject gameHandler = new GameHandlerObject(socket, gameList);
//				gameHandler.start();
//				gameList.add(gameHandler);
				
				
				Handler handler = new Handler(socket, list);
				handler.start();
				list.add(handler);
				
//				System.out.println(gameList.size());
//				System.out.println(waitList.size());
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		new Server();
	}
}
