
package com.hk.project.controller;


import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hk.base.support.ResultsData;
import com.hk.base.web.BaseController;



@Controller
public class SysController extends BaseController{
	/**
	 * 首页
	 */
	@RequestMapping("/")
	public String index() {
		logger.info("index");
		System.out.println("index");
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Collection<? extends GrantedAuthority> anth = userDetails.getAuthorities();
		for(GrantedAuthority model : anth){
			if(model.toString().equals("ROLE_ADMIN")){
				return "system/index";
			}
		}
		return "index";
	}
	/**
	 * 默认请求处理方法，调用请求路径对应的jsp
	 */
	@RequestMapping
	public String defaultController(HttpServletRequest request) {
		logger.info("jsp");
		System.out.println("jsp");
		String path = request.getRequestURI().replaceFirst("^" + request.getContextPath() + "/", "")
				.replaceFirst("\\.[^.]*$", "");
		return path;
	}
	/**
	 * 文件上传
	 */
	@RequestMapping("/upload.do")
	@ResponseBody
	public ResultsData upload(HttpServletRequest request,@RequestParam(required=true) MultipartFile file) {
		ResultsData result = new ResultsData();
		if (!file.isEmpty()) {
            try {  
            	String fileName = file.getOriginalFilename();
                // 文件保存路径  
                String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/" + fileName;  
                // 转存文件  
                file.transferTo(new File(filePath));
                result.setData(fileName);
                return result.setStatusSuccess();
            } catch (Exception e) {
                e.printStackTrace();  
            }  
        }
		result.setStatusFail();
		return result;
	}
}
