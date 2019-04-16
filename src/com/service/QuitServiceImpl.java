package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.QuitDao;
import com.po.Quit;
@Service("quitService")
@Transactional
public class QuitServiceImpl implements QuitService{
	@Autowired
	private QuitDao quitDao;
	@Override
	public String toQuitStaff(Model model) {
		String qtype[] = {"��ְ","����","����","����","��¼��"};
		model.addAttribute("qtype", qtype);
		model.addAttribute("quit", new Quit());
		return "quit/addQuitStaff";
	}

	@Override
	public String addQuitStaff(Model model, Quit quit) {
		String sname = quitDao.selectAQuitName(quit);
		quit.setSname(sname);
		if("init".equals(quit.getAct())) {
			if(sname == null || sname.length() == 0) {
				return "no";
			}
			return sname;//����Ա����������ʾ��ҳ��
		}else {
			if(quitDao.selectIsQuit(quit).size() > 0) {
				return "go";
			}
			quitDao.addQuitStaff(quit);
			//�˴�����JSON�ַ���������Ҫʹ��forward
			return "quit/selectQuitStaff";//ת������ѯ����
		}
	}

	@Override
	public String selectQuitStaff(Model model) {
		String qtype[] = {"��ְ","����","����","����","��¼��"};
		model.addAttribute("qtype", qtype);
		model.addAttribute("quit", new Quit());
		model.addAttribute("quits", quitDao.selectQuitStaff());
		return "quit/selectQuitStaff";
	}

	@Override
	public String selectQuitCon(Model model,Quit quit) {
		String qtype[] = {"��ְ","����","����","����","��¼��"};
		model.addAttribute("qtype", qtype);
		model.addAttribute("quit", quit);
		model.addAttribute("quits", quitDao.selectQuitCon(quit));
		return "quit/selectQuitStaff";
	}

}
