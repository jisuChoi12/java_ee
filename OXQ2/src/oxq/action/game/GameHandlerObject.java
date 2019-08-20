package oxq.action.game;

import java.io.EOFException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.ArrayList;

import oxq.action.waitingroom.WaitInfoDTO;


public class GameHandlerObject extends Thread {

	private Socket socket;
	private ArrayList<GameHandlerObject> list;
//	public static ArrayList<String> nicks = new ArrayList<String>();

	private ObjectInputStream ois;
	private ObjectOutputStream oos;
//	private static int i;
	
//	private QuestionsDAO daoQuestion = QuestionsDAO.getInstance(); // 문제

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
		int correct = 0;
		int wrong = 0;
		int playerCnt=0;
		
		while (true) {
			try {
				Object obj = ois.readObject();
				
				if(obj instanceof PlayInfoDTO) {
					PlayInfoDTO dto = (PlayInfoDTO) obj;
					if (dto.getCommand() == PlayInfo.JOIN) {
						nickname = dto.getNickname();
//					playerCnt = dto.getPlayerCnt(); 으아아아
						
//					i++;
						PlayInfoDTO sendDTO = new PlayInfoDTO();
						sendDTO.setNickname(nickname);
						sendDTO.setCommand(PlayInfo.SEND);
						sendDTO.setMessage(nickname + "님이 입장하였습니다");
//					sendDTO.setNum(i);
//					sendDTO.setPlayerCnt(playerCnt); 으아아아
						//System.out.println("handler= "+nicks);
						
						broadcast(sendDTO);
						
					} else if (dto.getCommand() == PlayInfo.SEND) {
						message = dto.getMessage();
						
						PlayInfoDTO sendDTO = new PlayInfoDTO();
						sendDTO.setCommand(PlayInfo.SEND);
						sendDTO.setMessage("[" + nickname + "] " + message);
						broadcast(sendDTO);
					} else if (dto.getCommand() == PlayInfo.TIMER) {
//					correct = dto.getCorrect();
//					wrong = dto.getWrong();
						
						PlayInfoDTO sendDTO = new PlayInfoDTO();
						sendDTO.setCommand(PlayInfo.TIMER);
						
						broadcast(sendDTO);
					}
					else if (dto.getCommand() == PlayInfo.EXIT) {
						list.remove(this);
						
						PlayInfoDTO sendDTO = new PlayInfoDTO();
						sendDTO.setCommand(PlayInfo.SEND);
						sendDTO.setMessage(nickname + "님이 퇴장하였습니다");
						
						
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
				}
				else if(obj instanceof WaitInfoDTO) {
					WaitInfoDTO dto = (WaitInfoDTO) obj;
					System.out.println("GameHandler에서  waitInfoDTO");
				}
			
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
