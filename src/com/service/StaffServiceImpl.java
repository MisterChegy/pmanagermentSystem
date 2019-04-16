package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.DepartDao;
import com.dao.PostDao;
import com.dao.StaffDao;
import com.po.Staff;
@Service("staffService")
@Transactional
public class StaffServiceImpl implements StaffService{
	@Autowired
	private DepartDao departDao;
	@Autowired
	private PostDao postDao;
	@Autowired
	private StaffDao staffDao;
	@Override
	public String toAdd(Model model) {
		model.addAttribute("staff", new Staff());
		String sex[] = {"��","Ů"};
		String workform[] = {"��ʽ","��ʱ"};
		String staffsource[] =  {"У԰��Ƹ","�����Ƹ","��ת","����"};
		String politicalstatus[] =  {"��Ա","Ԥ����Ա","��Ա"};
		String nation[] = {"����","�ɹ���","����","����","ά�����","����","����","׳��","������","������","����","����","����","����","������",
	               "������","��������","����","����","������","����","���","��ɽ��","������","ˮ��","������","������","������","�¶�������",
	               "����","���Ӷ���","������","Ǽ��","������","������","ë����","������","������","������","������","��������","ŭ��", "���α����",
	              "����˹��","���¿���","�°���","������","ԣ����","����","��������","������","���״���","������","�Ű���","�����","��ŵ��"};
		String bloodtype[] = {"A ��","B ��","AB ��","0 ��","����Ѫ��","δ��Ѫ��"};
		String maritalstatus[] = {"δ��","�ѻ�","ɥż","���","����"};
		String education[] = {"���м�����","��ר","����","�о���"};
		String degree[] = {"��ѧλ","ѧʿ","˫ѧʿ","˶ʿ","��ʿ"};
		model.addAttribute("sex", sex);
		model.addAttribute("workform", workform);
		model.addAttribute("staffsource", staffsource);
		model.addAttribute("politicalstatus",politicalstatus);
		model.addAttribute("nation", nation);
		model.addAttribute("bloodtype", bloodtype);
		model.addAttribute("maritalstatus", maritalstatus);
		model.addAttribute("education", education);
		model.addAttribute("degree", degree);
		model.addAttribute("departs", departDao.selectAllDepart());
		model.addAttribute("posts", postDao.selectAllPost());
		return "staff/addStaff";
	}
	
	@Override
	public String addStaff(Staff staff) {
		staffDao.addStaff(staff);
		//�˴�����JSON�ַ���������Ҫʹ��forward
		return "staff/selectStaff";//ת������ѯ����
		
	}
	@Override
	public String selectStaff(Model model, String act) {
		model.addAttribute("staff", new Staff());
		model.addAttribute("departs", departDao.selectAllDepart());
		if("update".equals(act)) {
			model.addAttribute("staffs",  staffDao.selectAllStaff());
			return "staff/updateStaffSelect";
		}else if("peroid".equals(act)) {
			model.addAttribute("posts", postDao.selectAllPost());
			model.addAttribute("staffs",  staffDao.selectPeriodStaff());
			String status[] = {"����","ת��","����","��¼��"};
			model.addAttribute("status",  status);
			return "staff/staffPeroidSelect";
		}else if("ok".equals(act)) {
			model.addAttribute("staffs",  staffDao.selectOkStaff());
			return "staff/staffOkSelect";
		}
		else {
			model.addAttribute("staffs",  staffDao.selectAllStaff());
			return "staff/selectStaff";
		}
	}
	@Override
	public String selectAStaff(Model model, Integer id, String act) {
		model.addAttribute("astaff",  staffDao.selectAStaff(id));
		if("update".equals(act)) {
			model.addAttribute("staff", new Staff());
			String sex[] = {"��","Ů"};
			String workform[] = {"��ʽ","��ʱ"};
			String staffsource[] =  {"У԰��Ƹ","�����Ƹ","��ת","����"};
			String politicalstatus[] =  {"��Ա","Ԥ����Ա","��Ա"};
			String nation[] = {"����","�ɹ���","����","����","ά�����","����","����","׳��","������","������","����","����","����","����","������",
		               "������","��������","����","����","������","����","���","��ɽ��","������","ˮ��","������","������","������","�¶�������",
		               "����","���Ӷ���","������","Ǽ��","������","������","ë����","������","������","������","������","��������","ŭ��", "���α����",
		              "����˹��","���¿���","�°���","������","ԣ����","����","��������","������","���״���","������","�Ű���","�����","��ŵ��"};
			String bloodtype[] = {"A ��","B ��","AB ��","0 ��","����Ѫ��","δ��Ѫ��"};
			String maritalstatus[] = {"δ��","�ѻ�","ɥż","���","����"};
			String education[] = {"���м�����","��ר","����","�о���"};
			String degree[] = {"��ѧλ","ѧʿ","˫ѧʿ","˶ʿ","��ʿ"};
			model.addAttribute("sex", sex);
			model.addAttribute("workform", workform);
			model.addAttribute("staffsource", staffsource);
			model.addAttribute("politicalstatus",politicalstatus);
			model.addAttribute("nation", nation);
			model.addAttribute("bloodtype", bloodtype);
			model.addAttribute("maritalstatus", maritalstatus);
			model.addAttribute("education", education);
			model.addAttribute("degree", degree);
			model.addAttribute("departs", departDao.selectAllDepart());
			model.addAttribute("posts", postDao.selectAllPost());
			return "staff/updateStaff";
		}
		return "staff/staffDetail";
	}
	@Override
	public String updateStaff(Staff staff) {
		staffDao.updateStaff(staff);
		//�˴�����JSON�ַ���������Ҫʹ��forward
		return "staff/selectStaff?act=update";//ת�����޸Ĳ�ѯ����
		
	}
	@Override
	public String selectStaffCon(Staff staff, Model model, String act) {
		model.addAttribute("staff", staff);
		model.addAttribute("departs", departDao.selectAllDepart());
		if("update".equals(act)) {
			model.addAttribute("staffs",  staffDao.selectStaffCon(staff));
			return "staff/updateStaffSelect";
		}else if("peroid".equals(act)) {
			model.addAttribute("posts", postDao.selectAllPost());
			model.addAttribute("staffs",  staffDao.selectPeriodStaffCon(staff));
			String status[] = {"����","ת��","����","��¼��"};
			model.addAttribute("status",  status);
			return "staff/staffPeroidSelect";
		}else if("ok".equals(act)) {
			model.addAttribute("staffs",  staffDao.staffOkSelectCon(staff));
			return "staff/staffOkSelect";
		}else {
			model.addAttribute("staffs",  staffDao.selectStaffCon(staff));
			return "staff/selectStaff";
		}
	}
	@Override
	public String peroidOp(Integer id, String act1) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		if("ok".equals(act1)) {
			map.put("status", "ת��");
		}else if("delay".equals(act1)) {
			map.put("status", "����");
		}else {
			map.put("status", "��¼��");
		}
		staffDao.peroidOp(map);
		//�˴�����JSON�ַ���������Ҫʹ��forward
		return "staff/selectStaff?act=peroid";//ת������ѯ����
	}

}
