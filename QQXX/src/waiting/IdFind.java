package waiting;

import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.ArrayList;

import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;

public class IdFind extends JFrame implements ActionListener {
	private MemberDAO dao = MemberDAO.getInstance();
	private ArrayList<MemberDTO> list;
	private JLabel emailL;
	private JTextField emailT;
	private JButton findB;
	private JList<String> idList;
	private DefaultListModel<String> model;
	private JScrollPane scroll;
	private Container con;
	private String email;

	public IdFind() {
		super("아이디찾기");

		con = getContentPane();
		con.setLayout(null);
		emailL = new JLabel("이메일 입력:");
		emailT = new JTextField(15);
		findB = new JButton("찾기");
		emailT.addKeyListener(new KeyAdapter() {
			@Override
			public void keyPressed(KeyEvent e) {
				if (e.getKeyCode() == KeyEvent.VK_ENTER) {
					findB.doClick();
				}
			}
		});
		emailT.setFocusTraversalKeysEnabled(false);
		model = new DefaultListModel<String>();
		idList = new JList<String>(model);
		scroll = new JScrollPane(idList, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS, JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		scroll.setBounds(0, 60, 335, 100);

		JPanel p = new JPanel();
		p.add(emailL);
		p.add(emailT);
		p.add(findB);
		p.setBounds(0, 10, 330, 35);

		con.add(p);
		con.add(scroll);
		findB.addActionListener(this);
		setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				setVisible(false);
			}
		});

		setBounds(480, 150, 400, 490);
		setVisible(true);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setResizable(false);
	}

	@Override
	public void actionPerformed(ActionEvent e) {

	}
}
