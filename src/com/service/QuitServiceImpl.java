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
		String qtype[] = {"辞职","辞退","退休","开除","不录用"};
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
			return sname;//返回员工姓名，显示在页面
		}else {
			if(quitDao.selectIsQuit(quit).size() > 0) {
				return "go";
			}
			quitDao.addQuitStaff(quit);
			//此处返回JSON字符串，不需要使用forward
			return "quit/selectQuitStaff";//转发到查询请求
		}
	}

	@Override
	public String selectQuitStaff(Model model) {
		String qtype[] = {"辞职","辞退","退休","开除","不录用"};
		model.addAttribute("qtype", qtype);
		model.addAttribute("quit", new Quit());
		model.addAttribute("quits", quitDao.selectQuitStaff());
		return "quit/selectQuitStaff";
	}

	@Override
	public String selectQuitCon(Model model,Quit quit) {
		String qtype[] = {"辞职","辞退","退休","开除","不录用"};
		model.addAttribute("qtype", qtype);
		model.addAttribute("quit", quit);
		model.addAttribute("quits", quitDao.selectQuitCon(quit));
		return "quit/selectQuitStaff";
	}

}
