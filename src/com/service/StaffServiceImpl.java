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
		String sex[] = {"男","女"};
		String workform[] = {"正式","临时"};
		String staffsource[] =  {"校园招聘","社会招聘","军转","其它"};
		String politicalstatus[] =  {"党员","预备党员","团员"};
		String nation[] = {"汉族","蒙古族","回族","藏族","维吾尔族","苗族","彝族","壮族","布依族","朝鲜族","满族","侗族","瑶族","白族","土家族",
	               "哈尼族","哈萨克族","傣族","黎族","傈僳族","佤族","畲族","高山族","拉祜族","水族","东乡族","纳西族","景颇族","柯尔克孜族",
	               "土族","达斡尔族","仫佬族","羌族","布朗族","撒拉族","毛南族","仡佬族","锡伯族","阿昌族","普米族","塔吉克族","怒族", "乌孜别克族",
	              "俄罗斯族","鄂温克族","德昂族","保安族","裕固族","京族","塔塔尔族","独龙族","鄂伦春族","赫哲族","门巴族","珞巴族","基诺族"};
		String bloodtype[] = {"A 型","B 型","AB 型","0 型","其他血型","未定血型"};
		String maritalstatus[] = {"未婚","已婚","丧偶","离婚","其他"};
		String education[] = {"高中及以下","大专","本科","研究生"};
		String degree[] = {"无学位","学士","双学士","硕士","博士"};
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
		//此处返回JSON字符串，不需要使用forward
		return "staff/selectStaff";//转发到查询请求
		
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
			String status[] = {"正常","转正","延期","不录用"};
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
			String sex[] = {"男","女"};
			String workform[] = {"正式","临时"};
			String staffsource[] =  {"校园招聘","社会招聘","军转","其它"};
			String politicalstatus[] =  {"党员","预备党员","团员"};
			String nation[] = {"汉族","蒙古族","回族","藏族","维吾尔族","苗族","彝族","壮族","布依族","朝鲜族","满族","侗族","瑶族","白族","土家族",
		               "哈尼族","哈萨克族","傣族","黎族","傈僳族","佤族","畲族","高山族","拉祜族","水族","东乡族","纳西族","景颇族","柯尔克孜族",
		               "土族","达斡尔族","仫佬族","羌族","布朗族","撒拉族","毛南族","仡佬族","锡伯族","阿昌族","普米族","塔吉克族","怒族", "乌孜别克族",
		              "俄罗斯族","鄂温克族","德昂族","保安族","裕固族","京族","塔塔尔族","独龙族","鄂伦春族","赫哲族","门巴族","珞巴族","基诺族"};
			String bloodtype[] = {"A 型","B 型","AB 型","0 型","其他血型","未定血型"};
			String maritalstatus[] = {"未婚","已婚","丧偶","离婚","其他"};
			String education[] = {"高中及以下","大专","本科","研究生"};
			String degree[] = {"无学位","学士","双学士","硕士","博士"};
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
		//此处返回JSON字符串，不需要使用forward
		return "staff/selectStaff?act=update";//转发到修改查询请求
		
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
			String status[] = {"正常","转正","延期","不录用"};
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
			map.put("status", "转正");
		}else if("delay".equals(act1)) {
			map.put("status", "延期");
		}else {
			map.put("status", "不录用");
		}
		staffDao.peroidOp(map);
		//此处返回JSON字符串，不需要使用forward
		return "staff/selectStaff?act=peroid";//转发到查询请求
	}

}
