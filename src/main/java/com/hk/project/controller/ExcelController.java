package com.hk.project.controller;




import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hk.base.dao.IBaseDao;
import com.hk.base.support.DateUtil;
import com.hk.base.support.IgnoreFieldProcessorImpl;
import com.hk.base.support.PoiUtil;
import com.hk.base.support.ResultsData;
import com.hk.base.support.StringUtil;
import com.hk.base.web.BaseController;
import com.hk.project.model.BuildingModel;
import com.hk.project.model.RentDetailModel;
import com.hk.project.model.RoomModel;
import com.hk.project.service.RentDetailService;

@Controller
@RequestMapping("/excel")
public class ExcelController extends BaseController{
	@Autowired
	private RentDetailService rentDetailService;
	@Autowired
	protected IBaseDao dao;
	
	@RequestMapping(value="/export")
	@ResponseBody
	public ResultsData export(String filePath,String buildingId){
		ResultsData result = new ResultsData();
		try {
			result = rentDetailService.exportExcel(filePath, buildingId);
			return result;
		} catch (ParseException e) {
			result.setStatusFail("请该excel内容格式!");
			return result;
		}
	}
	
	/**
	 * 对需要导入的数据进行预览
	 * 校验表格式
	 * @param filePath
	 * @param buildingId
	 * @return
	 */
	@RequestMapping(value="/getExcelData.do")
	@ResponseBody
	public ResultsData getExcelData(HttpServletRequest request,@RequestParam(required=true) MultipartFile file,String buildingId){
		ResultsData result = new ResultsData();
		if (!file.isEmpty()) {
            try {  
            	String fileName = file.getOriginalFilename();
                // 文件保存路径  
                String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/" + fileName;  
                // 转存文件  
                file.transferTo(new File(filePath));
                return checkImport(filePath,buildingId);
            } catch (Exception e) {
                e.printStackTrace();
                result.setStatusFail("保存失败!");
                return result;
            }
        }
		result.setStatusFail("文件上传失败!");
		return result;
	}
	@SuppressWarnings("resource")
	private ResultsData checkImport(String filePath,String buildingId) throws IOException{
		ResultsData result = new ResultsData();
		//检查楼是否存在
		BuildingModel buildTemp = this.dao.get(BuildingModel.class, buildingId);
		if(buildTemp == null){
			logger.info("该楼层不存在!");
			return result.setStatusFail("该楼层不存在!");
		}
		BuildingModel build = new BuildingModel();
		build.setId(buildingId);
		//读取excel
		Workbook workbook=null;
		String fileType=filePath.substring(filePath.lastIndexOf("."),filePath.length());  
        FileInputStream fileStream = new FileInputStream(new File(filePath));  
        if(".xls".equals(fileType.trim().toLowerCase())){  
            workbook = new HSSFWorkbook(fileStream);// 创建 Excel 2003 工作簿对象  
        }else if(".xlsx".equals(fileType.trim().toLowerCase())){  
            workbook = new XSSFWorkbook(fileStream);//创建 Excel 2007 工作簿对象  
        }else{
        	return result.setStatusFail("请导入excel工作簿!");
        }
        List<RoomModel> roomList = new ArrayList<RoomModel>();
        List<RentDetailModel> rentDetailList = new ArrayList<RentDetailModel>();
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
				String roomName = PoiUtil.getCellValue(cell1);
				if(roomName == null || "累计数".equals(roomName) || "".equals(roomName)){//结束标识
					break;
				}
				//保存房间
				RoomModel room = new RoomModel();
				room.setId(build.getId()+","+floorName+","+roomName);
				room.setBuilding(build);
				room.setRoomNumber(roomName);
				room.setFloorNumber(floorName);//String.valueOf(numSheet+1)
				roomList.add(room);
				
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
				rent.setRentDate(date);
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
				rentDetailList.add(rent);
			}
		}
		result.put("rooms", roomList);
		result.put("rentDetails", rentDetailList);
		result.put("filePath", filePath);
		result.setStatusSuccess();
		return result;
	}

	@RequestMapping(value="/editExcel")
	@ResponseBody
	public ResultsData editExcel(String filePath,String id,String key,String value){
		ResultsData result = new ResultsData();
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
	        }else{
	        	return result.setStatusFail("请导入excel工作簿!");
	        }
		} catch (IOException e1) {
			e1.printStackTrace();
			return result.setStatusFail("文件不存在,请重新导入!");
		}
        
        if(id==null||"".equals(id)){
        	return result.setStatusFail();
        }
    	String[] data = id.split(",");
    	System.out.println("id长度:"+data.length);
    	if(data.length < 5){
    		return result.setStatusFail();
    	}
        for(int numSheet = 0;numSheet<workbook.getNumberOfSheets();numSheet++){
        	Sheet sheet = workbook.getSheetAt(numSheet);
			String floorName = sheet.getSheetName();//楼层名称
			int lastRowNum = sheet.getLastRowNum();
    		if(data[1].equals(floorName)){
    			for(int rowNum = 2;rowNum<lastRowNum;rowNum++){
    				Row row = sheet.getRow(rowNum);
    				Cell cell1 = row.getCell(0);
    				//房间号
    				String roomName = PoiUtil.getCellValue(cell1);
    				if(data[2].equals(roomName)){
    					//start 
    					int targetRow = (int) ((StringUtil.toFloat(data[4])-1)*6);
    					boolean f = true;
    					switch(key){
    					case "rent":
    						targetRow += 1;
							break;
    					case "water":
    						targetRow += 2;
							break;
    					case "electricity":
    						targetRow += 3;
							break;
    					case "incidental":
    						targetRow += 4;
							break;
    					case "deposit":
    						targetRow += 5;
							break;
    					case "gate":
    						targetRow += 6;
							break;
    					case "electricityPay":
    						targetRow += 7;
							break;
    					case "waterPay":
    						targetRow += 8;
							break;
    					case "incidentalPay":
    						targetRow += 9;
							break;
    					case "depositPay":
    						targetRow += 10;
							break;
    					case "gatePay":
    						targetRow += 11;
							break;
    					case "checkIn":
    						targetRow += 12;
							break;
						default:
							f = false;
							break;
    					}
    					if(f){
    						Cell cell = row.getCell(targetRow);
    						cell.setCellValue(value);
    						FileOutputStream out = null;
    			            try {
    			                out = new FileOutputStream(filePath);
    			                workbook.write(out);
    			                result.setStatusSuccess();
    			                return result;
    			            } catch (IOException e) {
    			                e.printStackTrace();
    			            } finally {
    			                try {
    			                    out.close();
    			                } catch (IOException e) {
    			                    e.printStackTrace();
    			                }
    			            }
    					}else{
    			        	result.setStatusFail();
    					}
    				}else{
    					continue;
    				}
    			}
    		}else{
    			continue;
    		}
        }
        return result;
	}
	
}
