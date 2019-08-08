package ox.action;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.swing.BorderFactory;
import javax.swing.BoxLayout;
import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.ScrollPaneConstants;
import javax.swing.border.Border; 

public class GameWindow extends JFrame implements Runnable, ActionListener {

	private int room_no;
	private int round;
	private int correctCnt;
	private int wrongCnt;

	// DB
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "java";
	private String password = "dkdlxl";
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	
	private MemberDAO daoMember = MemberDAO.getInstance(); // 결과
	private MemberDTO memberDTO;
	
	private QuestionsDAO daoQuestion = QuestionsDAO.getInstance(); // 문제
	private RoomDAO daoRoom = RoomDAO.getInstance(); // 닉네임 방정보 등등
//	private ArrayList<QuestionsDTO> questionList;
	private ArrayList<QuestionsDTO> listlist = daoQuestion.getQuestionList();
	private ArrayList<String> nicksss;  // 방에 있는 사람들의 닉네임
//	private ArrayList<String> nicksss =daoRoom.getNicksss(room_no); // 방에 있는 사람들의 닉네임
//	private GamePlayerDTO gameDTO = new GamePlayerDTO();

	// 스레드 풀
	private ExecutorService es = Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors());

	// 화면
	private JButton startB;
	private JButton exitB;
	private JTextField input;
	private JTextArea output;
	private JTextField questionArea;
	private JTextField timeT; // 시간제한, 답

	// OX버튼
	private JRadioButton[] jb = new JRadioButton[2];
	private ButtonGroup bg = new ButtonGroup();
	private Image img_o = new ImageIcon("resources/letter_oo.png").getImage().getScaledInstance(100, 100, // O 이미지 리사이즈
			Image.SCALE_SMOOTH);
	private Image img_x = new ImageIcon("resources/letter_xx.png").getImage().getScaledInstance(100, 100, // X 이미지 리사이즈
			Image.SCALE_SMOOTH);

	private Image img_o_clicked = new ImageIcon("resources/letter_oo_clicked.png").getImage().getScaledInstance(100,
			100, // O 이미지 리사이즈
			Image.SCALE_SMOOTH);
	private Image img_x_clicked = new ImageIcon("resources/letter_xx_clicked.png").getImage().getScaledInstance(100,
			100, // X 이미지 리사이즈
			Image.SCALE_SMOOTH);
	
	private Image answ_o = new ImageIcon("answ_o.png").getImage().getScaledInstance(180, 180, Image.SCALE_SMOOTH); //정답공개
	private Image answ_x = new ImageIcon("answ_x.png").getImage().getScaledInstance(180, 180, Image.SCALE_SMOOTH); //정답공개
	private Image question_mark = new ImageIcon("question_mark.png").getImage().getScaledInstance(180, 180, Image.SCALE_SMOOTH); //정답공개
	

	private ImageIcon icon_o = new ImageIcon(img_o); // 이미지를 아이콘으로 바꾸기
	private ImageIcon icon_x = new ImageIcon(img_x);
	private ImageIcon icon_o_clicked = new ImageIcon(img_o_clicked); // 이미지를 아이콘으로 바꾸기
	private ImageIcon icon_x_clicked = new ImageIcon(img_x_clicked);
	
	private ImageIcon answer_o = new ImageIcon(answ_o);
	private ImageIcon answer_x = new ImageIcon(answ_x);
	private ImageIcon qmark = new ImageIcon(question_mark);
	
	private JLabel answerL;

	private JPanel chatPan, btnPan, south, north;

	private JTextField nicknameTp1;
	private JTextField nicknameTp2;

	private JPanel center;
	private JPanel center1, center1_nick, center1_icon;
	private JPanel center2;
	private JPanel center3, center3_nick, center3_icon;
	private Container con;

	// thread
	private Socket socket;
	private ObjectInputStream ois;
	private ObjectOutputStream oos;

	private static int timer = 5; // 한 문제당 푸는 시간

	private String nickname;
	private int playerCnt;

	private ImageIcon playerIcon01;
	private ImageIcon playerIcon02;
	private JLabel player01;
	private JLabel player02;

	public GameWindow(String nickname, int playerCnt, int room_no) { // 생성자
		// TO-DO 대기실에서 게임방 입장(클래스가 호출 될 때) 파라미터로 받아야 할 것 정리하기
		// playerCnt
		this.nickname = nickname;
		this.playerCnt = playerCnt;
		this.room_no = room_no;
		
// 게임화면 레이아웃 -----------------------------------------------------------------------------------
		startB = new JButton("Game Start"); // 게임 시작 버튼
		exitB = new JButton("Exit"); // 나가기 버튼

		input = new JTextField(); // 채팅입력 창
		Dimension d1 = new Dimension();
		d1.setSize(700, 40);
		input.setPreferredSize(d1);

		output = new JTextArea(); // 채팅출력 창
		output.setEditable(false);
		JScrollPane scroll = new JScrollPane(output);
		scroll.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		Dimension d2 = new Dimension();
		d2.setSize(700, 200);
		scroll.setPreferredSize(d2);

		Dimension d3 = new Dimension(); // 문제 출제 창
		d3.setSize(700, 140);
		questionArea = new JTextField();
		questionArea.setEditable(false);
		questionArea.setPreferredSize(d3);
		questionArea.setBackground(Color.WHITE);
		Border border = BorderFactory.createLineBorder(Color.GRAY);
		questionArea
				.setBorder(BorderFactory.createCompoundBorder(border, BorderFactory.createEmptyBorder(10, 10, 10, 10)));
		Dimension d4 = new Dimension();
		d4.setSize(140, 140);
		questionArea.setFont(new Font("Gothic", Font.BOLD, 50));
		questionArea.setHorizontalAlignment(JTextField.CENTER);

		timeT = new JTextField(Integer.toString(timer)); // 타이머창
		timeT.setHorizontalAlignment(JTextField.CENTER);
		timeT.setPreferredSize(d4);
		timeT.setFont(new Font("Gothic", Font.BOLD, 80));
		timeT.setBackground(Color.WHITE);
		timeT.setEditable(false);

		chatPan = new JPanel(); // 채팅출력+입력
		chatPan.setLayout(new BoxLayout(chatPan, BoxLayout.Y_AXIS));
		chatPan.add(scroll);
		chatPan.add(input);

		btnPan = new JPanel(new GridLayout(2, 1, 0, 0)); // 게임시작버튼+나가기버튼
		btnPan.add(startB);
		btnPan.add(exitB);

		south = new JPanel(); // 게임창 아래
		south.setLayout(new BoxLayout(south, BoxLayout.X_AXIS)); // 채팅창+버튼
		south.add(chatPan);
		south.add(btnPan);

		north = new JPanel(); // 게임창 위
		north.setOpaque(false); // 문제 출제 창
		north.add(questionArea);
		north.add(timeT);

///////////////////////////////////////////////////////////////
		
		center1 = new JPanel(); // 1번 플레이어 (닉네임+아이콘)
		nicknameTp1 = new JTextField(); // 1번 플레이어 닉네임
		nicknameTp1.setBackground(Color.WHITE);
		
		center1_nick = new JPanel(); // 1번 플레이어 닉네임창
		Dimension d6 = new Dimension();
		d6.setSize(200, 70);
		nicknameTp1.setPreferredSize(d6);
		nicknameTp1.setEditable(false);
		nicknameTp1.setFont(new Font("Gothic", Font.BOLD, 20));
		nicknameTp1.setHorizontalAlignment(JTextField.CENTER);
		center1_nick.add(nicknameTp1);
		
		Dimension dd1 = new Dimension();
		dd1.setSize(500,500);
		center1_icon = new JPanel();
		center1_icon.setPreferredSize(dd1);
		
		center1.add(center1_nick);
		center1.add(center1_icon);

///////////////////////////////////////////////////////////////
		
		center2 = new JPanel(); // ox버튼+정답공개창
//		answerL = new JLabel(qmark);
		answerL = new JLabel();
		answerL.setIcon(qmark);
		answerL.setBackground(Color.RED);
		Dimension d5 = new Dimension();
		d5.setSize(200, 200);
		answerL.setPreferredSize(d5);
		jb[0] = new JRadioButton(icon_o);
		jb[1] = new JRadioButton(icon_x);
		center2.add(jb[0]);
		center2.add(jb[1]);
		center2.add(answerL);
		bg.add(jb[0]);
		bg.add(jb[1]);
		pack();
		jb[0].setEnabled(false); // 게임 시작 전에는 ox버튼 비활성
		jb[1].setEnabled(false);
		
///////////////////////////////////////////////////////////////
		
		center3 = new JPanel(); // 2번 플레이어 (닉네임+아이콘)
		nicknameTp2 = new JTextField(); // 2번 플레이어 닉네임
		nicknameTp2.setBackground(Color.WHITE);
		center3_nick = new JPanel(); // 2번 플레이어 닉네임창
		Dimension d7 = new Dimension();
		d7.setSize(200, 70);
		nicknameTp2.setPreferredSize(d7);
		nicknameTp2.setEditable(false);
		nicknameTp2.setFont(new Font("Gothic", Font.BOLD, 20));
		nicknameTp2.setHorizontalAlignment(JTextField.CENTER);
		center3_nick.add(nicknameTp2);
		
		center3_icon = new JPanel();
		
		center3.add(center3_nick);
		center3.add(center3_icon);
		
///////////////////////////////////////////////////////////////	

		center = new JPanel(new GridLayout()); // 1번 플레이어+ox+2번 플레이어
		center.add(center1);
		center.add(center2); 
		center.add(center3);

		con = getContentPane(); // 상중하 패널 전체
		con.add("Center", center);
		con.add("North", north);
		con.add("South", south);

		playerIcon01 = new ImageIcon("player1.gif");
		player01 = new JLabel(playerIcon01);
		playerIcon02 = new ImageIcon("player2.gif");
		player02 = new JLabel(playerIcon02);

		setResizable(false);
		setBounds(480, 150, 1000, 800);
		setVisible(true);
		setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);

		System.out.println("생성자" + this.playerCnt);

	}

//----------------------------------------------------------------------------------
	public void checkAnsw() {

		if (listlist.get(round - 1).getAnswer() == 1 && jb[0].isSelected()) { // 정답 O, 선택 O
			System.out.println("O O");
			correctCnt++;
		}
		if (listlist.get(round - 1).getAnswer() == 1 && jb[1].isSelected()) { // 정답 O, 선택 X
			System.out.println("O X");
			wrongCnt++;
		}
		if (listlist.get(round - 1).getAnswer() == 0 && jb[0].isSelected()) { // 정답 X, 선택 O
			System.out.println("X O");
			wrongCnt++;
		}
		if (listlist.get(round - 1).getAnswer() == 0 && jb[1].isSelected()) { // 정답 X, 선택 X
			System.out.println("X X");
			correctCnt++;
		}
		System.out.println("정답: " + correctCnt + " | " + "오답: " + wrongCnt);
		jb[0].setSelected(false);
		jb[1].setSelected(false);
		
	}

//----------------------------------------------------------------------------------

	public void countTime() { // 문제풀이 제한 시간
		while (true) {
			timeT.setText(Integer.toString(timer));
			try {
				Thread.sleep(1000); // 1초
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			timer--;
			if (timer == -1) { // 시간 끝

				
				if(listlist.get(round-1).getAnswer()==1) { // 답:o
					answerL.setIcon(answer_o);
				} else if(listlist.get(round-1).getAnswer()==0) { // 답:x
					answerL.setIcon(answer_x);
				}
				
				checkAnsw(); // 답 체크

				try {
					Thread.sleep(3000); // 다음 문제 시작 전까지 잠깐 멈춤
//					answerT.setText(""); // 정답공개창 초기화
					jb[0].setEnabled(true); // o버튼 활성화
					jb[1].setEnabled(true); // x버튼 활성화

				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				break;
			}
		}
	}

	public void service() {

		try {

			socket = new Socket("192.168.0.26", 9500); // "localhost" 포트넘버

			// 클라이언트에서 보낼 때 닉네임을 먼저 보내주니까 출력 스트림을 먼저 생성해줘야 한다
			oos = new ObjectOutputStream(socket.getOutputStream());
			ois = new ObjectInputStream(socket.getInputStream());

			// 서버로 보내기 - 방에 입장 했을때
			PlayInfoDTO dto = new PlayInfoDTO(); // 게임방에 참가한 플레이어의 dto
			dto.setCommand(PlayInfo.JOIN);
			dto.setNickname(nickname); // 임시 - 다른 dto에서 불러오기
			dto.setCorrect(0);
			dto.setWrong(0);

			oos.writeObject(dto);
			oos.flush();
			
			memberDTO = daoMember.getOXHistory(nickname); // 이전기록
			System.out.println("o카운트="+memberDTO.getO_cnt());
			System.out.println("x마운트="+memberDTO.getX_cnt());

		} catch (UnknownHostException e) {
			System.out.println("서버를 찾을 수 없습니다");
			e.printStackTrace();
			System.exit(0);
		} catch (IOException e) {
			System.out.println("서버와 연결이 안되었습니다");
			e.printStackTrace();
			System.exit(0);
		}

		System.out.println("service" + playerCnt);

		// 스레드 생성 시작
		Thread t = new Thread(this);
		t.start();

		// 이벤트
		input.addActionListener(this); // 채팅창에 메세지를 치고 엔터를 누르면 이벤트 발생
		exitB.addActionListener(this); // 나가기 버튼 클릭
		startB.addActionListener(this);
		jb[0].addActionListener(this); // O버튼
		jb[1].addActionListener(this); // X버튼
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == input) {
			// 서버로 보내기
			PlayInfoDTO dto = new PlayInfoDTO();
			dto.setCommand(PlayInfo.SEND);
			dto.setMessage(input.getText());
			try {
				oos.writeObject(dto);
				oos.flush();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			input.setText("");
		} else if (e.getSource() == exitB) {
			PlayInfoDTO dto = new PlayInfoDTO();
			dto.setCommand(PlayInfo.EXIT);
			try {
				oos.writeObject(dto);
				oos.flush();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} else if (e.getSource() == startB) { // 게임시작 버튼
			try {

				PlayInfoDTO dto = new PlayInfoDTO(); // 시작하면 타이머도 시작
				dto.setCommand(PlayInfo.TIMER);
				oos.writeObject(dto);
				oos.flush();

			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} else if (e.getSource() == jb[0]) {
			jb[0].setSelectedIcon(icon_o_clicked);
			jb[1].setEnabled(false);

			PlayInfoDTO dto = new PlayInfoDTO();
			dto.setCommand(PlayInfo.SEND);
			dto.setMessage(nickname + " : O 선택!!");

			try {
				oos.writeObject(dto);
				oos.flush();
			} catch (IOException e1) {
				e1.printStackTrace();
			}

		} else if (e.getSource() == jb[1]) {
			jb[1].setSelectedIcon(icon_x_clicked);
			jb[0].setEnabled(false);

			PlayInfoDTO dto = new PlayInfoDTO();
			dto.setCommand(PlayInfo.SEND);
			dto.setMessage(nickname + " : X 선택!!");
			try {
				oos.writeObject(dto);
				oos.flush();
			} catch (IOException e1) {
				e1.printStackTrace();
			}

		}
	}

	@Override
	public void run() {
		// 서버로부터 받기
		while (true) {
			try {

				PlayInfoDTO dto = (PlayInfoDTO) ois.readObject();

				if (dto.getCommand() == null || dto.getCommand() == PlayInfo.EXIT) {
					ois.close();
					oos.close();
					socket.close();
					es.shutdownNow(); // 남아있는 작업을 마무리하고 스레드 풀을 종료할 때에는 shutdown()을 일반적으로 호출하고, 남아있는 작업과는 상관없이 강제 종료할
										// 때에는 shutdownNow()를 호출합니다.
					System.exit(0); // 대기실로 나가기 (바꿔야함)
				}

				else if (dto.getCommand() == PlayInfo.SEND) {
					output.append("<" + dto.getCommand().toString() + "> " + dto.getMessage() + "\n");
					int pos = output.getText().length(); // 스크롤 자동
					output.setCaretPosition(pos);

					// this.nicks = dto.getNicks();

					nicksss = daoRoom.getNicksss(room_no);

					if (dto.getNum() == 1) { // 1번 플레이어
						center1_icon.add(player01); // 플레이어 아이콘
//						nicknameTp1.setText(dto.getNickname()); // 플레이어 닉네임

						nicknameTp1.setText(nicksss.get(0));
						
					}

					else {
						center1_icon.add(player01); // 1번 플레이어
						center3_icon.add(player02); // 2번 플레이어
//						nicknameTp2.setText(dto.getNickname()); // 플레이어 닉네임
						
						nicknameTp1.setText(nicksss.get(0));
						nicknameTp2.setText(nicksss.get(1));
					}

					try {
						Thread.sleep(2000);
					} catch (InterruptedException e) {

						e.printStackTrace();
					}
				}

				else if (dto.getCommand() == PlayInfo.TIMER) { // 스레드풀 게임이 진행되는 동안에도 다른 command들이 들어 갈 수 있게
					es.submit(new Runnable() {
						@Override
						public void run() {
							while (true) {
								round++;
								System.out.println("라운드=" + round);
								startB.setEnabled(false);

								jb[0].setEnabled(true);
								jb[1].setEnabled(true);

								String qqq = listlist.get(round - 1).getQuestion();
								questionArea.setText(qqq);

								countTime(); // countTime -> checkAnsw
								
								answerL.setIcon(qmark);
								timer = 5;

								if (round == 5) {
									dto.setCommand(PlayInfo.SEND);
									dto.setMessage("게임종료");
									questionArea.setText("<<<게임종료>>>");
									
									memberDTO.setO_cnt(correctCnt+memberDTO.getO_cnt());
									memberDTO.setX_cnt(wrongCnt+memberDTO.getX_cnt());
									
									int su = daoMember.updateOXHistory(nickname, memberDTO);
									System.out.println("update 결과="+su);
									
									
									try {
										oos.writeObject(dto);
										oos.flush();
									} catch (IOException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
									break;
								}
							}
						}
					});
				}

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		new GameWindow("A", 1, 1).service();
	}
}
