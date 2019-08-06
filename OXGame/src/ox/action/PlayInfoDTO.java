package ox.action;

import java.io.Serializable;

enum PlayInfo {
	JOIN, SEND, EXIT, TIMER // 게임방 참가,게임방 채팅, 게임방 나가기
}

public class PlayInfoDTO implements Serializable {
	private String nickname; // 게임방 참가자의 닉네임
	private String message; // 채팅 내용
	private PlayInfo command; // 게임방 참가, 채팅, 나가기

	public PlayInfoDTO() {
	}

	// getters
	public String getNickname() {
		return nickname;
	}

	public String getMessage() {
		return message;
	}

	public PlayInfo getcommand() {
		return command;
	}

	// setters
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setMessage(String massage) {
		this.message = massage;
	}

	public void setCommand(PlayInfo connamd) {
		this.command = connamd;
	}

}
