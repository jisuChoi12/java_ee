package oxq.action.game;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.ArrayList;



public class Handler extends Thread {
	
	public ObjectInputStream getOis() {
		return ois;
	}

	public ObjectOutputStream getOos() {
		return oos;
	}
	
	private Socket socket;
	private ArrayList<Handler> list;

	private ObjectInputStream ois;
	private ObjectOutputStream oos;
	
	// 게임방
	public void broadcast(PlayInfoDTO sendDTO) {
		for (Handler handler : list) {
			try {
				handler.oos.writeObject(sendDTO);
				handler.oos.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 대기실
	public void broadcast(WaitInfoDTO sendDTO) {
		for (Handler handler : list) {
			try {
				handler.oos.writeObject(sendDTO);
				handler.oos.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public Handler(Socket socket, ArrayList<Handler> list) {
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
	@Override
	public void run() {
		String nickname = null;
		String message = null;
		int correct = 0;
		int wrong = 0;
		int playerCnt=0;
		Object obj = null;
		
		while (true) {
			try {
				obj = ois.readObject();
				
				if(obj instanceof WaitInfoDTO) {
					if (obj instanceof WaitInfoDTO) {
						WaitInfoDTO dto = (WaitInfoDTO) obj;
						if (dto.getCommand() == WaitInfo.JOIN) {
							nickname = dto.getNickName();

							// 모든 클라이언트 입장 메세지 보내기
							WaitInfoDTO sendDTO = new WaitInfoDTO(); // 보내는 쪽
							sendDTO.setCommand(WaitInfo.SEND);
							sendDTO.setMessage(nickname + "님이 입장하였습니다");
							broadcast(sendDTO);
						} else if (dto.getCommand() == WaitInfo.SEND) {
							WaitInfoDTO sendDTO = new WaitInfoDTO();
							sendDTO.setCommand(WaitInfo.SEND);
							sendDTO.setMessage("[" + nickname + "] : " + dto.getMessage());
							broadcast(sendDTO);
						} else if (dto.getCommand() == WaitInfo.EXIT) {
							// 나를 제외한 나머지 클라이언트에게 퇴장메세지 보내기
							list.remove(this);

							WaitInfoDTO sendDTO = new WaitInfoDTO(); // 보내는 쪽
							sendDTO.setCommand(WaitInfo.SEND);
							sendDTO.setMessage(nickname + "님이 퇴장하였습니다");
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
					}
				}
				
				else if(obj instanceof PlayInfoDTO) {
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
//				
			
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
