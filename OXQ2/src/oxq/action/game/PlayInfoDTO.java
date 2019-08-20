package oxq.action.game;

import java.io.Serializable;
import java.util.ArrayList;

enum PlayInfo {
	JOIN, SEND, EXIT, TIMER // 게임방 참가,게임방 채팅, 게임방 나가기
}

public class PlayInfoDTO implements Serializable {
	private String nickname; // 게임방 참가자의 닉네임
	private String message; // 채팅 내용
	private PlayInfo command; // 게임방 참가, 채팅, 나가기
//	private int playerCnt;
	


	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public PlayInfo getCommand() {
		return command;
	}

	public void setCommand(PlayInfo command) {
		this.command = command;
	}

//	public int getPlayerCnt() {
//		return playerCnt;
//	}
//
//	public void setPlayerCnt(int playerCnt) {
//		this.playerCnt = playerCnt;
//	}

}
