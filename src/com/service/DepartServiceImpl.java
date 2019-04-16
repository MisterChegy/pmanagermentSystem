package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.DepartDao;
import com.po.Depart;

@Service("departService")
@Transactional
public class DepartServiceImpl implements DepartService{
	@Autowired
	private DepartDao departDao;
	@Override
	public String toAdd(Model model) {
		String dtype[] = {"��˾","����","����","������","����"};
		List<Depart> supDepart = departDao.selectAllDepart();
		model.addAttribute("depart", new Depart());
		model.addAttribute("dtypes", dtype);
		model.addAttribute("supDeparts", supDepart);
		return "depart/addDepart";
	}
	@Override
	public String addDepart(Depart depart) {
		departDao.addDepart(depart);
		//�˴�����JSON�ַ���������Ҫʹ��forward
		return "depart/selectDepart";//ת������ѯ����
	}
	@Override
	public String selectDepart(Model model,String act) {
		model.addAttribute("departs",  departDao.selectAllDepart());
		String dtype[] = {"��˾","����","����","������","����"};
		model.addAttribute("depart", new Depart());
		model.addAttribute("dtypes", dtype);
		if("update".equals(act)) {
			return "depart/updateDepartSelect";
		}else if("delete".equals(act)) {
			return "depart/deleteDepartSelect";
		}else {
			return "depart/selectDepart";
		}
		
	}
	@Override
	public String selectADepart(Model model, Integer id, Integer sid,String act) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("id", id);
		map.put("sid", sid);
		model.addAttribute("adepart",  departDao.selectADepart(map));
		if("update".equals(act)) {
			String dtype[] = {"��˾","����","����","������","����"};
			List<Depart> supDepart = departDao.selectAllDepart();
			model.addAttribute("dtypes", dtype);
			model.addAttribute("supDeparts", supDepart);
			return "depart/updateDepart";
		}
		return "depart/departDetail";
	}
	@Override
	public String deleteDepart(Model model, Integer id) {
		List<Depart> list1 = departDao.selectSubDepart(id);
		if(list1.size() > 0) {
			return "fail";
		}else {
			departDao.deleteDepart(id);
		}
		//�˴�����JSON�ַ���������Ҫʹ��forward
		return "depart/selectDepart?act=delete";//ת������ѯ����
	}
	@Override
	public String updateDepart(Depart depart) {
		departDao.updateDepart(depart);
		//�˴�����JSON�ַ���������Ҫʹ��forward
		return "depart/selectDepart?act=update";//ת������ѯ����
	}
	@Override
	public String selectDepartCon(Depart depart, Model model, String act) {
		String dtype[] = {"��˾","����","����","������","����"};
		model.addAttribute("depart", depart);
		model.addAttribute("dtypes", dtype);
		model.addAttribute("departs",  departDao.selectDepartCon(depart));
		if("update".equals(act)) {
			return "depart/updateDepartSelect";
		}else if("delete".equals(act)) {
			return "depart/deleteDepartSelect";
		}else {
			return "depart/selectDepart";
		}
	}
	
}
