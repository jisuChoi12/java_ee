package friend.action;

import java.awt.BorderLayout;
import java.awt.Checkbox;
import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.GridBagLayout;
import java.awt.GridLayout;

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
import javax.swing.ScrollPaneConstants;

import friend.bean.FriendDTO;

public class FriendManager extends JFrame{
	private JLabel nameL, telL, genderL, funL;
	private JTextField nameT;
	private JComboBox<String> tel1C;
	private JLabel hyp1;
	private JLabel hyp2;
	private JTextField tel2T, tel3T;
	private JRadioButton manR, womanR;
	private JCheckBox readCB, movieCB, musicCB, gameCB, shoppingCB;
	private JList<FriendDTO> list;
	private JTextArea area;
	private JButton addB, updateB, deleteB, clearB;
	private JLabel insertTitle, listTitle, areaTitle;

	public FriendManager() {
		nameL = new JLabel("�̸� : ");
		telL = new JLabel("��ȭ��ȣ : ");
		genderL = new JLabel("���� : ");
		funL = new JLabel("��� : ");
		nameT = new JTextField(10);
		String[] teltel = {"010", "011", "019", "070"};
		tel1C = new JComboBox<String>(teltel);
		hyp1 = new JLabel("-");
		hyp2 = new JLabel("-");
		tel2T = new JTextField(5);
		tel3T = new JTextField(5);
		manR = new JRadioButton("����");
		womanR = new JRadioButton("����");
		ButtonGroup group = new ButtonGroup();
		group.add(manR);
		group.add(womanR);
		readCB = new JCheckBox("����");
		movieCB = new JCheckBox("��ȭ");
		musicCB = new JCheckBox("����");
		gameCB = new JCheckBox("����");
		shoppingCB = new JCheckBox("����");
		
		list = new JList<FriendDTO>(new DefaultListModel<FriendDTO>());
		DefaultListModel<FriendDTO> model = (DefaultListModel<FriendDTO>)list.getModel();
	
		area = new JTextArea(8,50);
		area.setBackground(Color.WHITE);
		
		addB = new JButton("���");
		updateB = new JButton("����");
		deleteB = new JButton("����");
		clearB = new JButton("�����");
		insertTitle = new JLabel("���������Է�");
		listTitle = new JLabel("��ȭ���");
		areaTitle = new JLabel("���������м�");
		
//////////////////////////////////////////////////////////////////////////// ���������Է�+��ü��� (Ÿ��Ʋ)
		
		JPanel panTitle1 = new JPanel(new FlowLayout(FlowLayout.CENTER));
		panTitle1.add(insertTitle);
		JPanel panTitle2 = new JPanel(new FlowLayout(FlowLayout.CENTER));
		panTitle2.add(listTitle);
		
		JPanel panTitle12 = new JPanel(new GridLayout(1,2,0,0));
		panTitle12.add(panTitle1);
		panTitle12.add(panTitle2);
		
////////////////////////////////////////////////////////////////////////////���������Է� (����)
		
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
		panGen.add(manR);
		panGen.add(womanR);
		
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
		
		JPanel insertPanel = new JPanel(new GridLayout(6,1,0,0));
		insertPanel.add(panName);
		insertPanel.add(panTel);
		insertPanel.add(panGen);
		insertPanel.add(panFun);
		insertPanel.add(panBtn);
		
////////////////////////////////////////////////////////////////////////////��ü��� (����)
		
		JScrollPane scroll = new JScrollPane(list);
		scroll.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		
		JPanel listPanel = new JPanel(new FlowLayout());
		listPanel.add(scroll);
		
//////////////////////////////////////////////////////////////////////////// ���������м� (Ÿ��Ʋ+����)
		
		JPanel panTitle3 = new JPanel(new FlowLayout(FlowLayout.CENTER));
		panTitle3.add(areaTitle);
		
		JPanel panArea = new JPanel();
		panArea.add(area);
		
		JPanel panDOWN = new JPanel(new BorderLayout());
		panDOWN.add("North",panTitle3);
		panDOWN.add("Center",panArea);
		
//////////////////////////////////////////////////////////////////////////// ���������Է�+��ü���
		
		JPanel panUP = new JPanel(new FlowLayout());
		panUP.add(insertPanel);
		panUP.add(listPanel);
		
//////////////////////////////////////////////////////////////////////////// ���������Է�+��ü���+���������м�
		
		JPanel pantot = new JPanel(new GridLayout(2,1,0,0));
		pantot.add(panUP);
		pantot.add(panDOWN);

		
//////////////////////////////////////////////////////////////////////////// ��ü	
		
		Container con = getContentPane();
		con.add("North", panTitle12);
		con.add(pantot);

//////////////////////////////////////////////////////////////////////////// ������
		
		setResizable(false);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setTitle("ģ��");
		setBounds(300,300,650,500);
		setVisible(true);
	}
	
	public static void main(String[] args) {
		FriendManager fm = new FriendManager();
	}
}
