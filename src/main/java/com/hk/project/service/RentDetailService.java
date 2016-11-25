package com.hk.project.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.hk.base.service.BaseService;
import com.hk.base.support.DateUtil;
import com.hk.base.support.IgnoreFieldProcessorImpl;
import com.hk.base.support.PoiUtil;
import com.hk.base.support.ResultsData;
import com.hk.base.support.StringUtil;
import com.hk.project.dto.QueryRentDetailDto;
import com.hk.project.model.BuildingModel;
import com.hk.project.model.FloorModel;
import com.hk.project.model.RentDetailModel;
import com.hk.project.model.RoomModel;
@Service
@Transactional
public class RentDetailService extends BaseService<RentDetailModel>{
	@SuppressWarnings("resource")
	public ResultsData exportExcel(String filePath,String buildingId) throws ParseException{
		ResultsData result = new ResultsData();
		//获取楼房
		BuildingModel build = this.dao.get(BuildingModel.class, buildingId);
		if(build == null){
			logger.info("该楼层不存在!");
			return result.setStatusFail("该楼层不存在!");
		}
		//读取excel
		Workbook workbook=null;
		String fileType=filePath.substring(filePath.lastIndexOf("."),filePath.length());  
        FileInputStream fileStream;
		try {
			fileStream = new FileInputStream(new File(filePath)); 
	        if(".xls".equals(fileType.trim().toLowerCase())){  
	            workbook = new HSSFWorkbook(fileStream);// 创建 Excel 2003 工作簿对象  
	        }else if(".xlsx".equals(fileType.trim().toLowerCase())){  
	            workbook = new XSSFWorkbook(fileStream);//创建 Excel 2007 工作簿对象  
	        }
		} catch (IOException e) {
			e.printStackTrace();
			return result.setStatusFail("文件有误,请检查后重新导入");
		} 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		for(int numSheet = 0;numSheet<workbook.getNumberOfSheets();numSheet++){
			Sheet sheet = workbook.getSheetAt(numSheet);
			String floorName = sheet.getSheetName();//楼层名称
			int lastRowNum = sheet.getLastRowNum();
			FloorModel floor = new FloorModel();
			floor.setId(buildingId + "," + floorName);
			floor.setBuilding(build);
			floor.setFloorName(floorName);
			this.dao.save(floor);
			System.out.println("============================");
			System.out.println("LastRowNum:"+lastRowNum);
			System.out.println("sheetName:"+floorName);
			Row firstRow = sheet.getRow(0);
			firstRow.getCell(0);
			short lastCell = firstRow.getLastCellNum();
			System.out.println("第一行结束");
			System.out.println("===================================");
			System.out.println("列数:"+lastCell);
			String ym = PoiUtil.getCellValue(firstRow.getCell(1));
			//Calendar c = Calendar.getInstance();
			int year;//c.get(Calendar.YEAR);
			int month;//c.get(Calendar.MONTH) + 1;
			Date date = new Date();
			try {
				Calendar calendar = DateUtil.toCalendar(ym, "yyyy-MM月");
				year = calendar.get(Calendar.YEAR);
				month = calendar.get(Calendar.MONTH)+1;
				date = sdf.parse(year+"-"+month);
			} catch (ParseException e) {
				e.printStackTrace();
				return result.setStatusFail("请检查该excel的内容格式!");
			}
			for(int rowNum = 2;rowNum<lastRowNum;rowNum++){
				Row row = sheet.getRow(rowNum);
				Cell cell1 = row.getCell(0);
				//房间号
				String roomName =PoiUtil.getCellValue(cell1);
				if("累计数".equals(roomName)){//结束标识||"".equals(roomName)||roomName==null
					break;
				}
				//保存房间
				RoomModel room = new RoomModel();
				room.setId(build.getId()+","+floorName+","+roomName);
				room.setBuilding(build);
				room.setRoomNumber(roomName);
				room.setFloor(floor);//String.valueOf(numSheet+1)
				this.dao.save(room);
				Cell rentCell = row.getCell(1);
				Cell waterCell = row.getCell(2);
				Cell electricityCell = row.getCell(3);
				Cell incidentalCell = row.getCell(4);
				Cell depositCell = row.getCell(5);
				Cell gateCell = row.getCell(6);
				Cell electricityPayCell = row.getCell(7);
				Cell waterPayCell = row.getCell(8);
				Cell incidentalPayCell = row.getCell(9);
				Cell depositPayCell = row.getCell(10);
				Cell gatePayCell = row.getCell(11);
				Cell checkInCell = row.getCell(12);
				RentDetailModel rent = new RentDetailModel();
				rent.setRentDate(sdf.parse(year+"-"+month));
				rent.setId(room.getId()+","+year+","+(month<10?"0"+month:month));
				rent.setRent(StringUtil.toFloat(PoiUtil.getCellValue(rentCell)));
				rent.setWater(StringUtil.toFloat(PoiUtil.getCellValue(waterCell)));
				rent.setElectricity(StringUtil.toFloat(PoiUtil.getCellValue(electricityCell)));
				rent.setIncidental(StringUtil.toFloat(PoiUtil.getCellValue(incidentalCell)));
				rent.setDeposit(StringUtil.toFloat(PoiUtil.getCellValue(depositCell)));
				rent.setGate(StringUtil.toFloat(PoiUtil.getCellValue(gateCell)));
				rent.setElectricityPay(StringUtil.toFloat(PoiUtil.getCellValue(electricityPayCell)));
				rent.setWaterPay(StringUtil.toFloat(PoiUtil.getCellValue(waterPayCell)));
				rent.setIncidentalPay(StringUtil.toFloat(PoiUtil.getCellValue(incidentalPayCell)));
				rent.setDepositPay(StringUtil.toFloat(PoiUtil.getCellValue(depositPayCell)));
				rent.setGatePay(StringUtil.toFloat(PoiUtil.getCellValue(gatePayCell)));
				rent.setCheckIn(PoiUtil.getCellValue(checkInCell));
				rent.setRoom(room);
				rent.setBuilding(build);
				rent.setFloor(floor);
				this.dao.save(rent);
			}
		}
		result.setStatusSuccess();
		return result;
	}
	
	public List<RentDetailModel> searchRentDetail(QueryRentDetailDto data){
		//ResultsData result = new ResultsData();
		Session session = this.dao.getHT().getSessionFactory().getCurrentSession();
		Criteria cri = session.createCriteria(RentDetailModel.class);
		if(!StringUtil.isEmpty(data.getBuildingId())){
			System.out.println("building");
			cri.add(Restrictions.eq("building.id", data.getBuildingId()));
		}
		if(data.getYear()>0){
			System.out.println("year:"+data.getYear());
			cri.add(Restrictions.eq("year", data.getYear()));
		}
		if(data.getMonth()>0 && data.getMonth() < 13){
			System.out.println("month:"+data.getMonth());
			cri.add(Restrictions.eq("month", data.getMonth()));
		}
		//起别名才能查询到关联表的其它属性,否则只能查关联表的id
		cri.createAlias("room", "room");
		if(!StringUtil.isEmpty(data.getFloorNumber())){
			System.out.println("floorNumber");
			cri.add(Restrictions.eq("room.floorNumber", data.getFloorNumber()));
		}
		if(!StringUtil.isEmpty(data.getRoomNumber())){
			System.out.println("roomNumber");
			cri.add(Restrictions.eq("room.roomNumber", data.getRoomNumber()));
		}
		//result.setData();
		return cri.list();
	}
	/*
	public ResultsData getBuildTotal(String start,String end){
		ResultsData result = new ResultsData();
		List<Map<String, Object>> results = this.dao.queryBySQL("SELECT b.id as id,b.name as name,sum(r.rent) as rent,sum(r.electricity) as electricity,"
				+ "sum(r.water) as water,sum(r.incidental) as incidental FROM rent_detail r "
				+ "LEFT JOIN building b ON r.building_id = b.id WHERE "
				+ "unix_timestamp( r.rent_date ) BETWEEN unix_timestamp('"+start+"') AND unix_timestamp('"+end+"') "
				+ "GROUP BY building_id");
		result.setData(results);
		result.setStatusSuccess();
		return result;
	}
	*/
	@SuppressWarnings("unchecked")
	public ResultsData getBuildTotal(Date start,Date end){
		ResultsData resultData = new ResultsData();
		String buildingHql = "SELECT new map(b.id as id,b.name as name) from BuildingModel b where b.parent is not null";
		List<Map<String,Object>> buildings = (List<Map<String, Object>>) this.dao.queryByHQL(buildingHql);
		String hql = "SELECT new map(b.id as id,"
				+ "sum(r.rent) as rent,"
				+ "sum(r.electricity) as electricity,"
				+ "sum(r.water) as water,"
				+ "sum(r.incidental) as incidental,"
				+ "sum(r.deposit) as deposit,"
				+ "sum(r.gate) as gate,"
				+ "sum(r.rent + r.electricity + r.water + r.incidental + r.deposit + r.gate) as totalIn,"
				+ "sum(r.electricityPay) as electricityPay,"
				+ "sum(r.waterPay) as waterPay,"
				+ "sum(r.incidentalPay) as incidentalPay,"
				+ "sum(r.depositPay) as depositPay,"
				+ "sum(r.gatePay) as gatePay,"
				+ "sum(r.electricityPay + r.waterPay + r.incidentalPay + r.depositPay + r.gatePay) as totalOut )"
				+ " FROM RentDetailModel r LEFT JOIN r.building b WHERE r.rentDate BETWEEN ? AND ? GROUP BY b.id";
		List<Map<String,Object>> results = (List<Map<String, Object>>) this.dao.queryByHQL(hql,start,end);
		List<Map<String,Object>> data = new ArrayList<Map<String,Object>>();
		Map<String,Object> totalObject = new HashMap<String, Object>();
		double total = 0d;
		for(Map<String,Object> model :results){
			for(Map<String,Object> b : buildings){
				if(b.get("id").equals(model.get("id"))){
					b.put("data",model);
					total += ((double)model.get("totalIn") - (double)model.get("totalOut"));
				}else{
					b.put("data", null);
				}
				data.add(b);
			}
		}
		totalObject.put("profits", total);
		resultData.setData(data);
		resultData.put("total", totalObject);
		resultData.setStatusSuccess();
		return resultData;
	}
	public List<?> getTotal(Date start,Date end){
		String buildingHql = "SELECT new map(b.id as id,b.name as name) from BuildingModel b where b.parent is null";
		List<Map<String,Object>> buildings = (List<Map<String, Object>>) this.dao.queryByHQL(buildingHql);
		String hql = "SELECT new map(b.parent.id as id,"
				+ "sum(r.rent) as rent,"
				+ "sum(r.electricity) as electricity,"
				+ "sum(r.water) as water,"
				+ "sum(r.incidental) as incidental,"
				+ "sum(r.deposit) as deposit,"
				+ "sum(r.gate) as gate,"
				+ "sum(r.rent + r.electricity + r.water + r.incidental + r.deposit + r.gate) as totalIn,"
				+ "sum(r.electricityPay) as electricityPay,"
				+ "sum(r.waterPay) as waterPay,"
				+ "sum(r.incidentalPay) as incidentalPay,"
				+ "sum(r.depositPay) as depositPay,"
				+ "sum(r.gatePay) as gatePay,"
				+ "sum(r.electricityPay + r.waterPay + r.incidentalPay + r.depositPay + r.gatePay) as totalOut )"
				+ " FROM RentDetailModel r LEFT JOIN r.building b WHERE r.rentDate BETWEEN ? AND ? GROUP BY b.parent.id";
		List<Map<String,Object>> results = (List<Map<String, Object>>) this.dao.queryByHQL(hql,start,end);
		List<Map<String,Object>> data = new ArrayList<Map<String,Object>>();
		for(Map<String,Object> b : buildings){
			for(Map<String,Object> model :results){
				if(b.get("id").equals(model.get("id"))){
					b.put("data",model);
					break;
				}else{
					b.put("data", null);
					continue;
				}
			}
			data.add(b);
		}
		return data;
	}
	public List<?> getTotalByBuild(Date start,Date end,String buildingId,String flag){
		String hql = "SELECT new map(b.parent.id as id,"
				+ "sum(r.rent) as rent,"
				+ "sum(r.electricity) as electricity,"
				+ "sum(r.water) as water,"
				+ "sum(r.incidental) as incidental,"
				+ "sum(r.deposit) as deposit,"
				+ "sum(r.gate) as gate,"
				+ "sum(r.rent + r.electricity + r.water + r.incidental + r.deposit + r.gate) as totalIn,"
				+ "sum(r.electricityPay) as electricityPay,"
				+ "sum(r.waterPay) as waterPay,"
				+ "sum(r.incidentalPay) as incidentalPay,"
				+ "sum(r.depositPay) as depositPay,"
				+ "sum(r.gatePay) as gatePay,"
				+ "sum(r.electricityPay + r.waterPay + r.incidentalPay + r.depositPay + r.gatePay) as totalOut,"
				+ "r.rentDate as rentDate)"
				+ " FROM RentDetailModel r LEFT JOIN r.building b WHERE (r.rentDate BETWEEN ? AND ?) AND (b.id = ? or b.parent.id = ?)";
		if("false".equals(flag)){
			hql += " GROUP BY r.rentDate";
		}
		List<Map<String,Object>> results = (List<Map<String, Object>>) this.dao.queryByHQL(hql,start,end,buildingId,buildingId);
		return results;
	}
	public ResultsData getTotalRate(Date start,Date end,String buildingId){
		ResultsData results = new ResultsData();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startMonth = new Date(start.getYear(),start.getMonth()-1,1);
		Date endMonth = new Date(end.getYear(),end.getMonth(),0);
		Date startYear = new Date(start.getYear()-1,start.getMonth(),1);
		Date endYear = new Date(end.getYear()-1,end.getMonth()+1,0);
		System.out.println("==================");
		System.out.println(sdf.format(startMonth));
		System.out.println(sdf.format(endMonth));
		System.out.println(sdf.format(startYear));
		System.out.println(sdf.format(endYear));
		System.out.println("==================");
		List<Map<String,Object>> nowData = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> monthData = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> yearData =  new ArrayList<Map<String,Object>>();
		String hql = "SELECT new map("
				+ "sum(r.rent + r.electricity + r.water + r.incidental + r.deposit + r.gate) as totalIn,"
				+ "r.rent as rent,r.electricity as electricity,r.water as water,r.incidental as incidental,r.deposit as deposit,r.gate as gate,"
				+ "sum(r.electricityPay + r.waterPay + r.incidentalPay + r.depositPay + r.gatePay) as totalOut,"
				+ "r.electricityPay as electricityPay,r.waterPay as waterPay,r.incidentalPay as incidentalPay,r.depositPay as depositPay,r.gatePay as gatePay )"
				+ " FROM RentDetailModel r LEFT JOIN r.building b WHERE (r.rentDate BETWEEN ? AND ?) ";
		if(StringUtil.isEmpty(buildingId)){
			nowData = (List<Map<String, Object>>) this.dao.queryByHQL(hql,start,end);
			monthData = (List<Map<String, Object>>) this.dao.queryByHQL(hql,startMonth,endMonth);
			yearData = (List<Map<String, Object>>) this.dao.queryByHQL(hql,startYear,endYear);
		}else{
			hql += "AND (b.id = ? or b.parent.id = ?)";
			nowData = (List<Map<String, Object>>) this.dao.queryByHQL(hql,start,end,buildingId,buildingId);
			monthData = (List<Map<String, Object>>) this.dao.queryByHQL(hql,startMonth,endMonth,buildingId,buildingId);
			yearData = (List<Map<String, Object>>) this.dao.queryByHQL(hql,startYear,endYear,buildingId,buildingId);
		}
		results.put("now", nowData);
		results.put("month", monthData);
		results.put("year", yearData);
		results.setStatusSuccess();
		return results;
	}
	//所有房间的押金情况
	public List<?> getDepositByBuilding(String buildingId){
		List<Map<String,Object>> results = new ArrayList<Map<String,Object>>();
		String hql = "SELECT new map("
				+ "sum(d.deposit - d.depositPay) as depositTotal,"
				+ "sum(d.gate - d.gatePay) as gateTotal,"
				+ "r.id as id,"
				+ "r.roomNumber as roomNumber,"
				+ "r.floorNumber as floorNumber,"
				+ "r.building.name as buildingName ) "
				+ "FROM RentDetailModel d RIGHT JOIN d.room r";
		if(StringUtil.isEmpty(buildingId)){
			hql += " GROUP BY d.room.id";
			results = (List<Map<String, Object>>) this.dao.queryByHQL(hql);
		}else{
			hql += " where r.building.id = ? GROUP BY d.room.id";
			results = (List<Map<String, Object>>) this.dao.queryByHQL(hql,buildingId);
		}
		System.out.println(results.size());
		for(Map<String,Object> model : results){
			System.out.println(model.get("depositTotal"));
		}
		return results;
	}
	//押金池
	public List<?> getDeposit(String buildingId){
		List<Map<String,Object>> results = new ArrayList<Map<String,Object>>();
		String hql = "SELECT new map("
				+ "sum(d.deposit - d.depositPay) as depostTotal,"
				+ "sum(d.gate - d.gatePay) as gateTotal "
				+ ") FROM RentDetailModel d";
		if(StringUtil.isEmpty(buildingId)){
			results = (List<Map<String, Object>>) this.dao.queryByHQL(hql);
		}else{
			hql += " where d.building.id = ? ";
			results = (List<Map<String, Object>>) this.dao.queryByHQL(hql,buildingId);
		}
		return results;
	}
}
