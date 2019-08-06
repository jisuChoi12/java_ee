package friend.bean;

public class FriendDTO {
	private int seq;
	private String name;
	private String tel1;
	private String tel2;
	private String tel3;
	private int gender;
	private int read;
	private int movie;
	private int music;
	private int game;
	private int shopping;

	public FriendDTO() {
	}

	// setters
	public void setSeq(int seq) {
		this.seq = seq;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public void setRead(int read) {
		this.read = read;
	}

	public void setMovie(int movie) {
		this.movie = movie;
	}

	public void setMusic(int music) {
		this.music = music;
	}

	public void setGame(int game) {
		this.game = game;
	}

	public void setShopping(int shopping) {
		this.shopping = shopping;
	}

	// getters
	public int getSeq() {
		return seq;
	}

	public String getName() {
		return name;
	}

	public String getTel1() {
		return tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public int getGender() {
		return gender;
	}

	public int getRead() {
		return read;
	}

	public int getMovie() {
		return movie;
	}

	public int getMusic() {
		return music;
	}

	public int getGame() {
		return game;
	}

	public int getShopping() {
		return shopping;
	}

	@Override
	public String toString() {
		return name;
	}
}
