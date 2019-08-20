package oxq.action.waitingroom;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.ArrayList;

import oxq.action.game.GameHandlerObject;
import oxq.action.game.GameServerObject;
import oxq.action.game.GameWindow;
import oxq.action.game.PlayInfoDTO;

public class WaitChatHandler extends Thread {
	private ArrayList<WaitChatHandler> list;
	private Socket socket; // 서버로부터 넘겨 받는 소켓
	private ObjectInputStream ois;
	private ObjectOutputStream oos;

	public WaitChatHandler(Socket socket, ArrayList<WaitChatHandler> list) {
		this.socket = socket;
		this.list = list;
		// ois, oos 생성
		try {
			ois = new ObjectInputStream(socket.getInputStream());
			oos = new ObjectOutputStream(socket.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void run() {
		// 클라이언트에게 받음
		//WaitInfoDTO dto = null; // 받는쪽
		String nickName = null;
		try {
			while (true) {
				
				Object obj = ois.readObject();
				
				if (obj instanceof WaitInfoDTO) {
					WaitInfoDTO dto = (WaitInfoDTO) obj;
					if (dto.getCommand() == WaitInfo.JOIN) {
						nickName = dto.getNickName();

						// 모든 클라이언트 입장 메세지 보내기
						WaitInfoDTO sendDTO = new WaitInfoDTO(); // 보내는 쪽
						sendDTO.setCommand(WaitInfo.SEND);
						sendDTO.setMessage(nickName + "님이 입장하였습니다");
						broadcast(sendDTO);
					} else if (dto.getCommand() == WaitInfo.SEND) {
						WaitInfoDTO sendDTO = new WaitInfoDTO();
						sendDTO.setCommand(WaitInfo.SEND);
						sendDTO.setMessage("[" + nickName + "] : " + dto.getMessage());
						broadcast(sendDTO);
					} else if (dto.getCommand() == WaitInfo.EXIT) {
						// 나를 제외한 나머지 클라이언트에게 퇴장메세지 보내기
						list.remove(this);

						WaitInfoDTO sendDTO = new WaitInfoDTO(); // 보내는 쪽
						sendDTO.setCommand(WaitInfo.SEND);
						sendDTO.setMessage(nickName + "님이 퇴장하였습니다");
						broadcast(sendDTO);

						// 나한테는 exit를 보내기
						sendDTO.setCommand(WaitInfo.EXIT);
						oos.writeObject(sendDTO);
						oos.flush();

						ois.close();
						oos.close();
						socket.close();

						break;
					} else if (dto.getCommand() == WaitInfo.ROOM) {
						WaitInfoDTO infodto = new WaitInfoDTO();

						infodto.setCommand(WaitInfo.ROOM);
						infodto.setDto(dto.getDto());
						infodto.addRoomList();

						broadcast(infodto);
					}
				} else if (obj instanceof PlayInfoDTO) {
					PlayInfoDTO dto = new PlayInfoDTO();
//					dto.setNickname("A");
					System.out.println("WaitChatHandler에서 PlayInfoDTO");
//					GameServerObject gso = new GameServerObject();
//					new GameWindow(dto, "room1");
				}

//				dto = (WaitInfoDTO) ois.readObject();

			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void broadcast(WaitInfoDTO sendDTO) { // 모든 클라이언트들에게 전송
		for (WaitChatHandler handler : list) {
			try {
				handler.oos.writeObject(sendDTO);
				handler.oos.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
