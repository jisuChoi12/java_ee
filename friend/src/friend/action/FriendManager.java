package friend.action;

import java.awt.BorderLayout;
import java.awt.Checkbox;
import java.awt.Color;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.util.ArrayList;

import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollBar;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.ListSelectionModel;
import javax.swing.ScrollPaneConstants;
import javax.swing.border.Border;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.event.MouseInputAdapter;
import javax.swing.text.DefaultEditorKit.InsertBreakAction;

import friend.bean.FriendDTO;
import friend.dao.FriendDAO;

public class FriendManager extends JFrame implements ActionListener, ListSelectionListener {
	private JLabel nameL, telL, genderL, funL;
	private JTextField nameT;
	private JComboBox<String> tel1C;
	private JLabel hyp1;
	private JLabel hyp2;
	private JTextField tel2T, tel3T;
	private JRadioButton manR, womanR;
	private ButtonGroup group;
	private JCheckBox readCB, movieCB, musicCB, gameCB, shoppingCB;
	private JList<FriendDTO> list;
	private DefaultListModel<FriendDTO> model;
	private JTextArea area;
	private JButton addB, updateB, deleteB, clearB;
	private JLabel insertTitle, listTitle, areaTitle;

	public FriendManager() {
		// 생성
		nameL = new JLabel("이름 : ");
		telL = new JLabel("전화번호 : ");
		genderL = new JLabel("성별 : ");
		funL = new JLabel("취미 : ");
		nameT = new JTextField(10);
		String[] teltel = { "010", "011", "019", "070" };
		tel1C = new JComboBox<String>(teltel);
		hyp1 = new JLabel("-");
		hyp2 = new JLabel("-");
		tel2T = new JTextField(5);
		tel3T = new JTextField(5);
		manR = new JRadioButton("남성");
		womanR = new JRadioButton("여성", true);
		group = new ButtonGroup();
		group.add(womanR);
		group.add(manR);

		readCB = new JCheckBox("독서");
		movieCB = new JCheckBox("영화");
		musicCB = new JCheckBox("음악");
		gameCB = new JCheckBox("게임");
		shoppingCB = new JCheckBox("쇼핑");

		list = new JList<FriendDTO>(new DefaultListModel<FriendDTO>());
		model = (DefaultListModel<FriendDTO>) list.getModel();

		area = new JTextArea(1, 50);
		area.setEditable(false);
		area.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createLineBorder(Color.GRAY),
				BorderFactory.createEmptyBorder(10, 10, 10, 10)));
		area.setBackground(Color.WHITE);

		addB = new JButton("등록");
		updateB = new JButton("수정");
		deleteB = new JButton("삭제");
		clearB = new JButton("지우기");
		insertTitle = new JLabel("개인정보입력");
		listTitle = new JLabel("전화목록");
		areaTitle = new JLabel("개인정보분석");

		// 개인정보입력+전체목록 (타이틀)
		JPanel panTitle1 = new JPanel(new FlowLayout(FlowLayout.CENTER));
		panTitle1.add(insertTitle);
		JPanel panTitle2 = new JPanel(new FlowLayout(FlowLayout.CENTER));
		panTitle2.add(listTitle);

		JPanel panTitle12 = new JPanel(new GridLayout(1, 2, 0, 0));
		panTitle12.add(panTitle1);
		panTitle12.add(panTitle2);

		// 개인정보입력 (내용)
		JPanel panName = new JPanel(new FlowLayout(FlowLayout.LEFT));
		panName.add(nameL);
		panName.add(nameT);

		JPanel panTel = new JPanel(new FlowLayout(FlowLayout.LEFT));
		panTel.add(telL);
		panTel.add(tel1C);
		panTel.add(hyp1);
		panTel.add(tel2T);
		panTel.add(hyp2);
		panTel.add(tel3T);

		JPanel panGen = new JPanel(new FlowLayout(FlowLayout.LEFT));
		panGen.add(genderL);
		panGen.add(womanR);
		panGen.add(manR);

		JPanel panFun = new JPanel(new FlowLayout(FlowLayout.LEFT));
		panFun.add(funL);
		panFun.add(readCB);
		panFun.add(movieCB);
		panFun.add(musicCB);
		panFun.add(gameCB);
		panFun.add(shoppingCB);

		JPanel panBtn = new JPanel(new FlowLayout(FlowLayout.CENTER));
		panBtn.add(addB);
		panBtn.add(updateB);
		panBtn.add(deleteB);
		panBtn.add(clearB);

		JPanel insertPanel = new JPanel(new GridLayout(6, 1, 0, 0));
		insertPanel.add(panName);
		insertPanel.add(panTel);
		insertPanel.add(panGen);
		insertPanel.add(panFun);
		insertPanel.add(panBtn);

		// 전체목록 (내용)
		JScrollPane scroll = new JScrollPane(list);
		scroll.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		scroll.setPreferredSize(new Dimension(300, 220));

		JPanel listPanel = new JPanel(new FlowLayout());
		listPanel.add(scroll);

		// 개인정보분석 (타이틀+내용)
		JPanel panTitle3 = new JPanel(new FlowLayout(FlowLayout.CENTER));
		panTitle3.add(areaTitle);

		JPanel panArea = new JPanel();
		panArea.add(area);

		JPanel panDOWN = new JPanel(new BorderLayout());
		panDOWN.add("North", panTitle3);
		panDOWN.add("Center", panArea);

		// 개인정보입력+전체목록
		JPanel panUP = new JPanel(new FlowLayout());
		panUP.add(insertPanel);
		panUP.add(listPanel);

		// 개인정보입력+전체목록+개인정보분석
		JPanel pantot = new JPanel(new FlowLayout());
		pantot.add(panUP);
		pantot.add(panDOWN);

		// 전체
		Container con = getContentPane();
		con.add("North", panTitle12);
		con.add("Center", pantot);

		// 윈도우
		setResizable(false);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setTitle("친구");
		setBounds(300, 300, 650, 400);
		setVisible(true);

		// DB에서 모든 레코드를 꺼내서 ArrayList에 담아서 JList로
		FriendDAO dao = FriendDAO.getInstance(); // SingleTon으로 생성
		ArrayList<FriendDTO> arrayList = dao.getFriendList();
		for (FriendDTO dto : arrayList) {
			model.addElement(dto);
		}

		updateB.setEnabled(false);
		deleteB.setEnabled(false);
		clearB.setEnabled(false);

//		list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
//		list.addMouseListener(new MouseInputAdapter() {
//			@Override
//			public void mouseClicked(MouseEvent e) {
//				if (e.getClickCount() == 2) {
//					FriendDTO dto = list.getSelectedValue();
//					nameT.setText(dto.getName());
//					tel1C.setSelectedItem(dto.getTel1());
//					tel2T.setText(dto.getTel2());
//					tel3T.setText(dto.getTel3());
//
//					if (dto.getGender() == 0) {
//						womanR.setSelected(true);
//					} else if (dto.getGender() == 1) {
//						manR.setSelected(true);
//					}
//					readCB.setSelected(dto.getRead() == 0 ? false : true);
//					movieCB.setSelected(dto.getMovie() == 0 ? false : true);
//					musicCB.setSelected(dto.getMusic() == 0 ? false : true);
//					gameCB.setSelected(dto.getGame() == 0 ? false : true);
//					shoppingCB.setSelected(dto.getShopping() == 0 ? false : true);
//
//					addB.setEnabled(false);
//				}
//			}
//		});

	}

	public void event() {
		list.addListSelectionListener(this);
		addB.addActionListener(this);
		updateB.addActionListener(this);
		deleteB.addActionListener(this);
		clearB.addActionListener(this);
	}

	@Override
	public void valueChanged(ListSelectionEvent e) { // 총 두번 호출
		if (list.getSelectedIndex() == -1) {
			return;
		} // 중간에 remove가 되면 index를 잃어버리기 때문에 -1이 나오면 빠져나가라

		FriendDTO dto = list.getSelectedValue();
		nameT.setText(dto.getName());
		tel1C.setSelectedItem(dto.getTel1());
		tel2T.setText(dto.getTel2());
		tel3T.setText(dto.getTel3());

		if (dto.getGender() == 0) {
			womanR.setSelected(true);
		} else if (dto.getGender() == 1) {
			manR.setSelected(true);
		}
		readCB.setSelected(dto.getRead() == 0 ? false : true);
		movieCB.setSelected(dto.getMovie() == 0 ? false : true);
		musicCB.setSelected(dto.getMusic() == 0 ? false : true);
		gameCB.setSelected(dto.getGame() == 0 ? false : true);
		shoppingCB.setSelected(dto.getShopping() == 0 ? false : true);

		addB.setEnabled(false);
		updateB.setEnabled(true);
		deleteB.setEnabled(true);
		clearB.setEnabled(true);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// 등록
		if (e.getSource() == addB) {
			// 데이터
			String name = nameT.getText();
			String tel1 = (String) tel1C.getSelectedItem();
			String tel2 = tel2T.getText();
			String tel3 = tel3T.getText();
			int gender = 0;
			if (womanR.isSelected()) {
				gender = 0;
			} else if (manR.isSelected()) {
				gender = 1;
			}
			int read = readCB.isSelected() ? 1 : 0;
			int movie = movieCB.isSelected() ? 1 : 0;
			int music = musicCB.isSelected() ? 1 : 0;
			int game = gameCB.isSelected() ? 1 : 0;
			int shopping = shoppingCB.isSelected() ? 1 : 0;

			FriendDTO dto = new FriendDTO();
			dto.setName(name);
			dto.setTel1(tel1);
			dto.setTel2(tel2);
			dto.setTel3(tel3);
			dto.setGender(gender);
			dto.setRead(read);
			dto.setMovie(movie);
			dto.setMusic(music);
			dto.setGame(game);
			dto.setShopping(shopping);

			// DB
			FriendDAO dao = FriendDAO.getInstance();
			int seq = dao.getSeq();
			dto.setSeq(seq);
			int su = dao.insertFriend(dto);

			// 응답
			clear();
			if (su == 0) {
				area.setText("데이터 등록 실패");
			} else {
				area.setText("데이터 등록 완료");
			}
			model.addElement(dto);

			nameT.setText("");
			tel1C.setSelectedItem("010");
			tel2T.setText("");
			tel3T.setText("");
			womanR.setSelected(true);
			readCB.setSelected(false);
			movieCB.setSelected(false);
			musicCB.setSelected(false);
			gameCB.setSelected(false);
			shoppingCB.setSelected(false);
		}

		// 수정
		else if (e.getSource() == updateB) {
			// 데이터
			String name = nameT.getText();
			String tel1 = (String) tel1C.getSelectedItem();
			String tel2 = tel2T.getText();
			String tel3 = tel3T.getText();
			int gender = 0;
			if (womanR.isSelected()) {
				gender = 0;
			} else if (manR.isSelected()) {
				gender = 1;
			}
			int read = readCB.isSelected() ? 1 : 0;
			int movie = movieCB.isSelected() ? 1 : 0;
			int music = musicCB.isSelected() ? 1 : 0;
			int game = gameCB.isSelected() ? 1 : 0;
			int shopping = shoppingCB.isSelected() ? 1 : 0;

			FriendDTO dto = new FriendDTO();
			dto.setSeq(list.getSelectedValue().getSeq()); // list에서 선택된 dto의 seq값을 얻어와서 dto에 집어 넣는다
			dto.setName(name);
			dto.setTel1(tel1);
			dto.setTel2(tel2);
			dto.setTel3(tel3);
			dto.setGender(gender);
			dto.setRead(read);
			dto.setMovie(movie);
			dto.setMusic(music);
			dto.setGame(game);
			dto.setShopping(shopping);

			// DB
			FriendDAO dao = FriendDAO.getInstance(); // singleTon으로 생성
			int su = dao.updateFriend(dto);

			// 응답
			clear();
			if (su == 0) {
				area.setText("데이터 수정 실패");
			} else {
				area.setText("데이터 수정 완료");
			}

			// JList 내용 수정
			model.setElementAt(dto, list.getSelectedIndex());
			// model.set(list.getSelectedIndex(), dto);
		}

		// 삭제
		else if (e.getSource() == deleteB) {
			int seq = list.getSelectedValue().getSeq(); // list에서 선택된 dto의 seq값을 얻어와서

			FriendDAO dao = FriendDAO.getInstance();
			int su = dao.deleteFriend(seq);

			// 응답
			clear();
			if (su == 0) {
				area.setText("데이터 삭제 실패");
			} else {
				area.setText("데이터 삭제 완료");
			}

			// JList 내용 삭제
			model.remove(list.getSelectedIndex());
		}

		// 지우기
		else if (e.getSource() == clearB) {
			clear();
		}
	}

	public void clear() {
		nameT.setText("");
		tel1C.setSelectedItem("010");
		tel2T.setText("");
		tel3T.setText("");
		womanR.setSelected(true);
		readCB.setSelected(false);
		movieCB.setSelected(false);
		musicCB.setSelected(false);
		gameCB.setSelected(false);
		shoppingCB.setSelected(false);
		area.setText("");

		addB.setEnabled(true);
		updateB.setEnabled(false);
		deleteB.setEnabled(false);
		clearB.setEnabled(false);
	}

	public static void main(String[] args) {
		new FriendManager().event();

	}
}
