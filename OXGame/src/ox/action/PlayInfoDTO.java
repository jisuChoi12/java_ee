package ox.action;

import java.io.Serializable;
import java.util.ArrayList;

enum PlayInfo {
	JOIN, SEND, EXIT, TIMER // 게임방 참가,게임방 채팅, 게임방 나가기
}

public class PlayInfoDTO implements Serializable {
	private String nickname; // 게임방 참가자의 닉네임
	private String message; // 채팅 내용
	private PlayInfo command; // 게임방 참가, 채팅, 나가기
	private int num;
	private int wrong;
	private int correct;
	
	private ArrayList<String> nicks;

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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getWrong() {
		return wrong;
	}

	public void setWrong(int wrong) {
		this.wrong = wrong;
	}

	public int getCorrect() {
		return correct;
	}

	public void setCorrect(int correct) {
		this.correct = correct;
	}

	public ArrayList<String> getNicks() {
		return nicks;
	}

	public void setNicks(ArrayList<String> nicks) {
		this.nicks = nicks;
	}
	
	
}
