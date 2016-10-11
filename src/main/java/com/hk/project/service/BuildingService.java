package com.hk.project.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.stereotype.Service;

import com.hk.base.service.BaseService;
import com.hk.base.support.IgnoreFieldProcessorImpl;
import com.hk.base.support.ResultsData;
import com.hk.base.support.StringUtil;
import com.hk.project.model.BuildingModel;
@Service
@Transactional
public class BuildingService extends BaseService<BuildingModel>{
	public ResultsData save(String parentId,BuildingModel model){
		ResultsData result = new ResultsData();
		if(!StringUtil.isEmpty(parentId)){
			BuildingModel parent = this.dao.get(BuildingModel.class, parentId);
			model.setParent(parent);
			model.setLongCode(parent.getLongCode()+","+parent.getId());
		}
		BuildingModel building = this.dao.save(model);
		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new IgnoreFieldProcessorImpl(true, new String[]{"parent","children"})); // 忽略掉name属性及集合对象
		JSONObject fromObject = JSONObject.fromObject(building, config );
		result.put("building", fromObject);
		result.setStatusSuccess();
		return result;
	}
	public List<?> getParent(){
		return this.dao.queryByHQL("select new map(b.id as value,b.name as text) from BuildingModel b where b.longCode is null or b.longCode = ''");
	}
	public List<?> getChildren(){
		return this.dao.queryByHQL("select new map(b.id as value,b.name as text) from BuildingModel b where b.longCode is not null and b.longCode != ''");
	}
	public int edit(String id,String key,String value){
		String hql = StringEscapeUtils.escapeSql("update BuildingModel b set b."+key+" = ? where b.id = ?");
		System.out.println(hql);
		return this.dao.executeByHQL(hql,value,id);
	}
	public ResultsData removeById(String id){
		ResultsData result = new ResultsData();
		String rentHql = "delete RentDetailModel r where r.building.id = '"+id+"'";
		String roomHql = "delete RoomModel r where r.building.id = '"+id+"'";
		String buildingHql = "delete BuildingModel b where b.id = '"+id+"'";
		int rent = this.dao.executeByHQL(rentHql);
		int room = this.dao.executeByHQL(roomHql);
		int building = this.dao.executeByHQL(buildingHql);
		result.put("rent", rent);
		result.put("room", room);
		result.put("building", building);
		result.setStatusSuccess();
		return result;
	}
}
