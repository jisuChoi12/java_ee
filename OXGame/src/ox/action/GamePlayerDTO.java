package ox.action;

public class GamePlayerDTO {	
	private int correct; // 정답 개수
	private int wrong; // 오답 개수
	private String nickname; // 플레이어 닉네임
	
	public int getCorrect() {
		return correct;
	}
	public void setCorrect(int correct) {
		this.correct = correct;
	}
	public int getWrong() {
		return wrong;
	}
	public void setWrong(int wrong) {
		this.wrong = wrong;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
