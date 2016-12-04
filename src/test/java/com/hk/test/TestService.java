package com.hk.test;


import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

import com.hk.base.dao.IBaseDao;
import com.hk.base.support.Dto2Entity;
import com.hk.base.support.Pages;
import com.hk.base.support.ResultsData;
import com.hk.project.dto.QueryRentDetailDto;
import com.hk.project.dto.RoomDto;
import com.hk.project.model.BuildingModel;
import com.hk.project.model.RentDetailModel;
import com.hk.project.model.RoomModel;
import com.hk.project.service.BuildingService;
import com.hk.project.service.RentDetailService;
import com.hk.test.support.BaseTest;
public class TestService extends BaseTest{
	@Autowired
	private IBaseDao dao;
	@Autowired
	private RentDetailService rentDetailService;
	@Autowired
	private BuildingService buildingService;
	@Test
	@Rollback(value=false)//测试完不回滚
	public void testBaseDaoSearch(){
		RentDetailModel r = dao.get(RentDetailModel.class, "1");
		System.out.println(r.getTotal());
	}
	@Test
	@Rollback(value=false)//测试完不回滚
	public void saveSetId(){
		RentDetailModel model = new RentDetailModel();
		dao.save(model);
	}
	@Test
	@Rollback(value=false)//测试完不回滚
	public void readExcel() throws IOException{
		try {
			ResultsData result = rentDetailService.exportExcel("C://MyWorkspace//houserent//src//test//resources//A.xls","1");
			System.out.println("导入结果：---------------------------");
			System.out.println(result.getStatus());
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	@Test
	@Rollback(value=false)//测试完不回滚
	public void testDto2Entity(){
		RoomDto dto = new RoomDto();
		RoomModel entity = new RoomModel();
		dto.setId("55");
		dto.setRoomNumber("55");
		Dto2Entity.transalte(dto, entity);
		this.dao.save(entity);
	}
	@Test
	@Rollback(value=true)//测试完不回滚
	public void getBuildingByLongCode(){
		//String id = "null,1";
		List<BuildingModel> buildings = this.dao.criteria(BuildingModel.class, Restrictions.isNull("longCode"), null, null, null);
		for(BuildingModel model : buildings){
			System.out.println(model.getName());
		}
	}
	@Test
	@Rollback(value=false)//测试完不回滚
	public void searchRent(){
		QueryRentDetailDto data = new QueryRentDetailDto();
		data.setBuildingId("1");
		data.setYear(2016);
		data.setMonth(1);
		data.setFloorNumber("1");
		//data.setRoomNumber("A-101房");
		List<RentDetailModel> list = rentDetailService.searchRentDetail(new QueryRentDetailDto());
		System.out.println("长度:"+list.size());
		for(RentDetailModel model : list){
			System.out.println("model:"+model.getRoomName());
		}
	}
	@Test
	@Rollback(value=false)//测试完不回滚
	public void editBuilding(){
		rentDetailService.getDeposit(null);
	}
}
