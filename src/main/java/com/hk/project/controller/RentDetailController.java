package com.hk.project.controller;





import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.base.support.Dto2Entity;
import com.hk.base.support.IgnoreFieldProcessorImpl;
import com.hk.base.support.ResultsData;
import com.hk.base.support.StringUtil;
import com.hk.project.dto.RentDetailDto;
import com.hk.project.model.BuildingModel;
import com.hk.project.model.RentDetailModel;
import com.hk.project.model.RoomModel;
import com.hk.project.service.BuildingService;
import com.hk.project.service.RentDetailService;

@Controller
@RequestMapping("/rent")
public class RentDetailController {
	@Autowired
	private RentDetailService rentDetailService;

	//不分页
	@RequestMapping(value="/getData")
	@ResponseBody
	public ResultsData getData(int limit,int offset,String order){
		System.out.println("limit:"+limit+",offset:"+offset+",order:"+order);
		ResultsData result = new ResultsData();
		List<RentDetailModel> rentDetail = rentDetailService.criteria(RentDetailModel.class, null, null, null);
		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new IgnoreFieldProcessorImpl(false,new String[]{"building","room"}));
		JSONArray fromArray = JSONArray.fromObject(rentDetail, config);
		result.setStatusSuccess();
		result.setData(fromArray);
		return result;
	}
	//不分页
	@RequestMapping(value="/getBuildingInfo")
	@ResponseBody
	public ResultsData getData(String buildingId,String start,String end){
		ResultsData result = new ResultsData();
		Date startTime = null;
		Date endTime = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(StringUtil.isEmpty(start) && StringUtil.isEmpty(end)){
			Calendar c = Calendar.getInstance();
			endTime = c.getTime();
			c.add(Calendar.MONTH, -1);
			startTime = c.getTime();
		}else if(StringUtil.isEmpty(end)){
			try {
				Date temp = sdf.parse(start);
				startTime = new Date(temp.getYear(),temp.getMonth(),1);
				endTime = new Date(temp.getYear(),temp.getMonth(),0);
			} catch (ParseException e) {
				e.printStackTrace();
				return result.setStatusFail("请输入正确的日期格式!");
			}
		}else{
			try {
				startTime = sdf.parse(start);
				endTime = sdf.parse(end);
			} catch (Exception e) {
				e.printStackTrace();
				return result.setStatusFail("请输入正确的日期格式!");
			}
		}
		List<RentDetailModel> rentDetail = rentDetailService.criteria(RentDetailModel.class, 
				Restrictions.and(Restrictions.eq("building.id", buildingId),Restrictions.ge("rentDate", startTime),Restrictions.le("rentDate", endTime)),
				null, null);
		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new IgnoreFieldProcessorImpl(false,new String[]{"building","room"}));
		JSONArray fromArray = JSONArray.fromObject(rentDetail, config);
		result.setStatusSuccess();
		result.setData(fromArray);
		return result;
	}
	@RequestMapping(value="/save", method = RequestMethod.POST)
	@ResponseBody
	public ResultsData save(RentDetailDto model){
		ResultsData result = new ResultsData();
		RentDetailModel rent = new RentDetailModel();
		Dto2Entity.transalte(model, rent);
		BuildingModel building = new BuildingModel();
		building.setId(model.getBuildingId());
		rent.setBuilding(building);
		RoomModel room = new RoomModel();
		room.setId(model.getRoomId());
		rent.setRoom(room);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date rentDate = sdf.parse(model.getRentDate());
			rent.setRentDate(rentDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return result.setStatusFail();
		}
		RentDetailModel newModel = rentDetailService.save(rent);
		result.setStatusSuccess();
		result.setData(newModel);
		return result;
	}
	@RequestMapping(value="/remove", method = RequestMethod.POST)
	@ResponseBody
	public ResultsData remove(String id){
		ResultsData result = new ResultsData();
		rentDetailService.removeById(RentDetailModel.class, id);
		result.setStatusSuccess();
		return result;
	}
	//获取单栋楼房的统计(小)
	@RequestMapping(value="/getBuildTotal")
	@ResponseBody
	public ResultsData getBuildTotal(String start,String end){
		ResultsData result = new ResultsData();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startTime = null;
		Date endTime = null;
		try {
			startTime = sdf.parse(start);
			endTime = sdf.parse(end);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return result.setStatusFail("日期错误");
		}
		return rentDetailService.getBuildTotal(startTime,endTime);
	}
	//获取整区楼房的统计(大)
	@RequestMapping(value="/getTotal")
	@ResponseBody
	public ResultsData getTotal(String start,String end){
		ResultsData result = new ResultsData();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startTime = null;
		Date endTime = null;
		try {
			startTime = sdf.parse(start);
			endTime = sdf.parse(end);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return result.setStatusFail("日期错误");
		}
		List<?> list = rentDetailService.getTotal(startTime,endTime);
		result.setStatusSuccess();
		result.setData(list);
		return result;
	}
	//同比环比
	@RequestMapping(value="/getTotalRate")
	@ResponseBody
	public ResultsData getTotalRate(String start,String end){
		ResultsData result = new ResultsData();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startTime = null;
		Date endTime = null;
		try {
			startTime = sdf.parse(start);
			endTime = sdf.parse(end);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return result.setStatusFail("日期错误");
		}
		return rentDetailService.getTotalRate(startTime, endTime);
	}
	//获取单栋楼的统计
	@RequestMapping(value="/getTotalByBuild")
	@ResponseBody
	public ResultsData getTotalByBuild(String start,String end,String buildingId,@RequestParam(value="flag", defaultValue="false") String flag){
		ResultsData result = new ResultsData();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startTime = null;
		Date endTime = null;
		try {
			startTime = sdf.parse(start);
			endTime = sdf.parse(end);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return result.setStatusFail("日期错误");
		}
		result.setData(rentDetailService.getTotalByBuild(startTime, endTime,buildingId,flag));
		result.setStatusSuccess();
		return result;
	}
	//根据楼栋id获取房间的押金情况
	@RequestMapping(value="/getDepositByBuilding")
	@ResponseBody
	public ResultsData getDepositByBuilding(String buildingId){
		ResultsData result = new ResultsData();
		result.setData(rentDetailService.getDepositByBuilding(buildingId));
		result.setStatusSuccess();
		return result;
	}
	//押金池
	@RequestMapping(value="/getDeposit")
	@ResponseBody
	public ResultsData getDeposit(String buildingId){
		ResultsData result = new ResultsData();
		result.setData(rentDetailService.getDeposit(buildingId));
		result.setStatusSuccess();
		return result;
	}
}
