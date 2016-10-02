package com.hk.project.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.hk.base.service.BaseService;
import com.hk.base.support.DateUtil;
import com.hk.base.support.PoiUtil;
import com.hk.base.support.ResultsData;
import com.hk.base.support.StringUtil;
import com.hk.project.dto.QueryRentDetailDto;
import com.hk.project.model.BuildingModel;
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
			System.out.println("============================");
			System.out.println("LastRowNum:"+lastRowNum);
			System.out.println("sheetName:"+floorName);
			Row firstRow = sheet.getRow(0);
			firstRow.getCell(0);
			short lastCell = firstRow.getLastCellNum();
			System.out.println("第一行结束");
			System.out.println("===================================");

			System.out.println("列数:"+lastCell);
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
				room.setFloorNumber(String.valueOf(numSheet+1));
				this.dao.save(room);
				for(int i = 1 ;i < 73 ;i+=6){
					Cell rentCell = row.getCell(i);
					Cell waterCell = row.getCell(i+1);
					Cell electricityCell = row.getCell(i+2);
					Cell incidentalCell = row.getCell(i+3);
					Cell checkInCell = row.getCell(i+5);
					RentDetailModel rent = new RentDetailModel();
					String ym = PoiUtil.getCellValue(firstRow.getCell(i));
					Calendar calendar = DateUtil.toCalendar(ym, "yyyy-MM月");
					int year = calendar.get(Calendar.YEAR);
					int month = calendar.get(Calendar.MONTH)+1;
					rent.setRentDate(sdf.parse(year+"-"+month));
					rent.setId(room.getId()+","+year+","+month);
					rent.setRent(StringUtil.toFloat(PoiUtil.getCellValue(rentCell)));
					rent.setWater(StringUtil.toFloat(PoiUtil.getCellValue(waterCell)));
					rent.setElectricity(StringUtil.toFloat(PoiUtil.getCellValue(electricityCell)));
					rent.setIncidental(StringUtil.toFloat(PoiUtil.getCellValue(incidentalCell)));
					rent.setCheckIn(PoiUtil.getCellValue(checkInCell));
					rent.setRoom(room);
					rent.setBuilding(build);
					this.dao.save(rent);
					if(i+6==73){
						Cell roomRemarkCell = row.getCell(i+6);
						room.setRemark(PoiUtil.getCellValue(roomRemarkCell));
					}
				}
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
	public ResultsData getBuildTotal(String start,String end){
		ResultsData result = new ResultsData();
		List<Map<String, Object>> results = this.dao.queryBySQL("SELECT t4.id,t4.parent_id,t3.total_rent,t3.total_electricity,t3.total_water,t3.total_incidental FROM building t4 "
				+ "LEFT JOIN ( SELECT sum(r.rent) as total_rent, sum(r.electricity) as total_electricity, sum(r.water) as total_water, "
				+ "sum(r.incidental) as total_incidental, r.building_id FROM rent_detail r "
				+ "WHERE unix_timestamp( r.rent_date ) BETWEEN unix_timestamp('"+start+"') "
				+ "AND unix_timestamp('"+end+"') GROUP BY r.building_id ) t3 "
				+ "ON t3.building_id = t4.id WHERE t4.parent_id is not null");
		result.setData(results);
		result.setStatusSuccess();
		return result;
	}
	public ResultsData getTotal(String start,String end){
		ResultsData result = new ResultsData();
		List<Map<String, Object>> results = this.dao.queryBySQL("SELECT t1.id,t1.name, sum(t2.total_rent) as rent, sum(t2.total_electricity) as electricity, "
				+ "sum(t2.total_water) as water, sum(t2.total_incidental) as incidental FROM building t1 LEFT JOIN "
				+ "( SELECT t4.id,t4.name,t4.parent_id,t3.total_rent,t3.total_electricity,t3.total_water,t3.total_incidental FROM building t4 "
				+ "LEFT JOIN ( SELECT sum(r.rent) as total_rent, sum(r.electricity) as total_electricity, "
				+ "sum(r.water) as total_water, sum(r.incidental) as total_incidental,"
				+ "r.building_id FROM rent_detail r WHERE "
				+ "unix_timestamp( r.rent_date ) BETWEEN unix_timestamp('"+start+"') AND unix_timestamp('"+end+"') GROUP BY r.building_id "
				+ ") t3 ON t3.building_id = t4.id WHERE t4.parent_id is not null ) t2 on t1.id = t2.parent_id WHERE t1.parent_id is null GROUP BY t1.id");
		result.setData(results);
		result.setStatusSuccess();
		return result;
	}
	
}
