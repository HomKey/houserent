package com.hk.project.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.hk.base.service.BaseService;
import com.hk.project.model.User;
@Service
@Transactional
public class UserBaseService extends BaseService<User>{

}
