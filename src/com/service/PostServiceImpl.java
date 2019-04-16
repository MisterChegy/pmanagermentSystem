package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.PostDao;
import com.po.Post;
@Service("postService")
@Transactional
public class PostServiceImpl implements PostService{
	@Autowired
	private PostDao postDao;
	@Override
	public String toAdd(Model model) {
		String ptype[] = {"����","����","Ӫ��","�г�"};
		model.addAttribute("post", new Post());
		model.addAttribute("ptypes", ptype);
		return "post/addPost";
	}

	@Override
	public String addPost(Post post) {
		postDao.addPost(post);
		//�˴�����JSON�ַ���������Ҫʹ��forward
		return "post/selectPost";//ת������ѯ����
	}

	@Override
	public String selectPost(Model model, String act) {
		model.addAttribute("posts",  postDao.selectAllPost());
		String ptype[] = {"����","����","Ӫ��","�г�"};
		model.addAttribute("post", new Post());
		model.addAttribute("ptypes", ptype);
		if("update".equals(act)) {
			return "post/updatePostSelect";
		}else if("delete".equals(act)) {
			return "post/deletePostSelect";
		}else {
			return "post/selectPost";
		}
	}

	@Override
	public String selectAPost(Model model, Integer id, String act) {
		model.addAttribute("apost",  postDao.selectAPost(id));
		if("update".equals(act)) {
			String ptype[] = {"����","����","Ӫ��","�г�"};
			model.addAttribute("ptypes", ptype);
			return "post/updatePost";
		}
		return "post/postDetail";
	}

	@Override
	public String deletePost(Model model, Integer id) {
		postDao.deletePost(id);
		//�˴�����JSON�ַ���������Ҫʹ��forward
		return "post/selectPost?act=delete";//ת������ѯ����
	}

	@Override
	public String updatePost(Post post) {
		postDao.updatePost(post);
		//�˴�����JSON�ַ���������Ҫʹ��forward
		return "post/selectPost?act=update";//ת������ѯ����
	}

	@Override
	public String selectPostCon(Post post, Model model, String act) {
		String ptype[] = {"����","����","Ӫ��","�г�"};
		model.addAttribute("post", post);
		model.addAttribute("ptypes", ptype);
		model.addAttribute("posts",  postDao.selectPostCon(post));
		if("update".equals(act)) {
			return "post/updatePostSelect";
		}else if("delete".equals(act)) {
			return "post/deletePostSelect";
		}else {
			return "post/selectPost";
		}
	}

}
