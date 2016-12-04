package com.hk.base.support;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.util.NumberToTextConverter;

public class PoiUtil {
	public static String getCellValue(Cell cell) {
        String cellvalue = "";  
        if (cell != null) {  
            // 判断当前Cell的Type  
            switch (cell.getCellType()) {  
            // 如果当前Cell的Type为NUMERIC  
            case HSSFCell.CELL_TYPE_NUMERIC: {  
                short format = cell.getCellStyle().getDataFormat();  
                if(format == 14 || format == 31 || format == 57 || format == 58){   //excel中的时间格式  
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");    
                    double value = cell.getNumericCellValue();    
                    Date date = DateUtil.getJavaDate(value);    
                    cellvalue = sdf.format(date);    
                }  
                // 判断当前的cell是否为Date  
                else if (HSSFDateUtil.isCellDateFormatted(cell)) {  //先注释日期类型的转换，在实际测试中发现HSSFDateUtil.isCellDateFormatted(cell)只识别2014/02/02这种格式。  
                    // 如果是Date类型则，取得该Cell的Date值           // 对2014-02-02格式识别不出是日期格式  
                    Date date = cell.getDateCellValue();  
                    DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");  
                    cellvalue= formater.format(date);  
                } else { // 如果是纯数字  
                    // 取得当前Cell的数值  
                    cellvalue = NumberToTextConverter.toText(cell.getNumericCellValue());   
                      
                }  
                break;  
            }  
            // 如果当前Cell的Type为STRIN  
            case HSSFCell.CELL_TYPE_STRING:  
                // 取得当前的Cell字符串  
                cellvalue = cell.getStringCellValue().replaceAll("'", "''");  
                break;  
            case  HSSFCell.CELL_TYPE_BLANK:  
                cellvalue = null;  
                break;  
            // 默认的Cell值  
            default:{  
                cellvalue = " ";  
            }  
            }  
        } else {  
            cellvalue = "";  
        }  
        return cellvalue;  
    }  
}
