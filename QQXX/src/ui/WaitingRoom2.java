package ui;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.ScrollPaneConstants;

import waiting.WaitInfoDTO;

public class WaitingRoom2 extends JFrame {
	private JButton roomB, sendB;
	private JTextArea output;
	private JTextField input;
	private JLabel mainL, idL, idL2, nicknameL, nicknameL2, rankL, userL;
	private JList roomList, rankList, userList;
	private Socket socket;
	private ObjectInputStream ois;
	private ObjectOutputStream oos;

	public WaitingRoom2() {
		// 버튼
		roomB = new JButton("방만들기");
		sendB = new JButton("보내기");
		// 채팅 출력창
		output = new JTextArea(15, 70); // 채팅 출력
		output.setEditable(false); // 채팅 내용 수정 X
		JScrollPane chatScroll = new JScrollPane(output);
		chatScroll.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		// 채팅 입력창
		input = new JTextField(); // 채팅 입력
		// 라벨
		mainL = new JLabel("내정보");
		idL = new JLabel("아이디");
		idL2 = new JLabel("::::"); // 접속 한 유저 id 출력
		nicknameL = new JLabel("닉네임");
		nicknameL2 = new JLabel("::::"); // 접속한 유저 닉네임 출력
		rankL = new JLabel("<랭킹>");
		userL = new JLabel("<유저목록>");
		// 방 리스트
		roomList = new JList();
		JScrollPane roomScroll = new JScrollPane(roomList);
		roomScroll.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		roomScroll.setPreferredSize(new Dimension(790, 400));
		// 랭킹 리스트
		rankList = new JList();
		JScrollPane rankScroll = new JScrollPane(rankList);
		rankScroll.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		rankScroll.setPreferredSize(new Dimension(170, 400));
		// 유저 리스트
		userList = new JList();
		JScrollPane userScroll = new JScrollPane(userList);
		userScroll.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		userScroll.setPreferredSize(new Dimension(170, 240));
		// 채팅 textfield + 보내기 버튼
		JPanel chatBottom = new JPanel(new BorderLayout());
		chatBottom.add("Center", input);
		chatBottom.add("East", sendB);
		// 채팅 input+output
		JPanel chat = new JPanel(new BorderLayout());
		chat.add("Center", chatScroll);
		chat.add("South", chatBottom);
		// 상단에 내정보 아이디 , 닉네임 출력
		JPanel main = new JPanel(new FlowLayout(FlowLayout.LEFT));
		main.add(mainL);
		main.add(idL);
		main.add(idL2);
		main.add(nicknameL);
		main.add(nicknameL2);
		// 방리스트 + 방만들기
		JPanel room = new JPanel(new BorderLayout());
		room.add("North", roomScroll);
		room.add("South", roomB);
		// 내정보 + 방
		JPanel up = new JPanel(new BorderLayout());
		up.add("North", main);
		up.add("South", room);
		// 랭킹 + 리스트
		JPanel rankLP = new JPanel(new FlowLayout(FlowLayout.CENTER));
		rankLP.add(rankL);
		JPanel rank = new JPanel(new BorderLayout());
		rank.add("North", rankLP);
		rank.add("South", rankScroll);
		// 랭킹 + 내정보 + 방
		JPanel up2 = new JPanel(new FlowLayout());
		up2.add(up);
		up2.add(rank);
		// 유저목록 + 유저
		JPanel userLP = new JPanel(new FlowLayout(FlowLayout.CENTER));
		userLP.add(userL);
		JPanel user = new JPanel(new BorderLayout());
		user.add("North", userLP);
		user.add("South", userScroll);
		// 유저 + 채팅
		JPanel bottom = new JPanel(new FlowLayout());
		bottom.add(chat);
		bottom.add(user);
		
		JPanel center = new JPanel(new BorderLayout());
		center.add("North", up2);
		center.add("South", bottom);
		
		Container con = this.getContentPane();
		con.add(center);

		setBounds(480, 150, 1000, 800);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setResizable(false); // 창크기 고정
		setVisible(true);
		
		// 종료 버튼 눌렀을때
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				if(oos == null || ois == null)
					System.exit(0);
				
				WaitInfoDTO dto = new WaitInfoDTO();
				
			}
		});
	}

	public static void main(String[] args) {
		new WaitingRoom2();
	}

}
