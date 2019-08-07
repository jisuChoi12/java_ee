package ox.action;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

public class GameHandlerObject extends Thread {

	private Socket socket;
	private ArrayList<GameHandlerObject> list;
	public static ArrayList<String> nicks = new ArrayList<String>();

	private ObjectInputStream ois;
	private ObjectOutputStream oos;
	private static int i;

	public GameHandlerObject(Socket socket, ArrayList<GameHandlerObject> list) {
		this.socket = socket;
		this.list = list;
		try {
			ois = new ObjectInputStream(socket.getInputStream());
			oos = new ObjectOutputStream(socket.getOutputStream());
		} catch (IOException e) {
			System.out.println("플레이어와 연결이 안되었습니다");
			e.printStackTrace();
		}
	}

	public void broadcast(PlayInfoDTO sendDTO) {
		for (GameHandlerObject handler : list) {
			try {
				handler.oos.writeObject(sendDTO);
				handler.oos.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void run() {
		String nickname = null;
		String message = null;
		
		while (true) {
			try {
				PlayInfoDTO dto = (PlayInfoDTO) ois.readObject(); // 클라이언트로부터 받기

				if (dto.getCommand() == PlayInfo.JOIN) {
					nickname = dto.getNickname();
					nicks.add(nickname);
					i++;
					PlayInfoDTO sendDTO = new PlayInfoDTO();
					sendDTO.setNickname(nickname);
					sendDTO.setCommand(PlayInfo.SEND);
					sendDTO.setMessage(nickname + "님이 입장하였습니다");
					sendDTO.setNum(i);
					sendDTO.setCorrect(dto.getCorrect());
					sendDTO.setWrong(dto.getWrong());
					sendDTO.setNicks(nicks);
					//System.out.println("handler= "+nicks);
					
					broadcast(sendDTO);
					
				} else if (dto.getCommand() == PlayInfo.SEND) {
					message = dto.getMessage();

					PlayInfoDTO sendDTO = new PlayInfoDTO();
					sendDTO.setCommand(PlayInfo.SEND);
					sendDTO.setMessage("[" + nickname + "] " + message);
					broadcast(sendDTO);
				} else if (dto.getCommand() == PlayInfo.TIMER) {
					PlayInfoDTO sendDTO = new PlayInfoDTO();
					sendDTO.setCommand(PlayInfo.TIMER);

					broadcast(sendDTO);
				}

				else if (dto.getCommand() == PlayInfo.EXIT) {
					list.remove(this);

					PlayInfoDTO sendDTO = new PlayInfoDTO();
					sendDTO.setCommand(PlayInfo.SEND);
					sendDTO.setMessage(nickname + "님이 퇴장하였습니다");
					
//					sendDTO.setNum(i-1);
					
					broadcast(sendDTO);
					
					sendDTO.setCommand(PlayInfo.EXIT);
					oos.writeObject(sendDTO);
					oos.flush();

					ois.close();
					oos.close();
					socket.close();

					break;
					// 대기실로 돌아가기
				}

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
