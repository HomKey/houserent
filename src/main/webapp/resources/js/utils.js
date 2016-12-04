;(function($) {
	window.JsonUtil = window.JsonUtil || {
		format: function(json) {
			var data = {};
			//遍历属性  
			 for(var item in json){
			    if(typeof json[item]  === 'number' || typeof json[item]  === 'string' || typeof json[item]  === 'boolean' || json[item] == null){
			    	data[item] = json[item];
			    }else if(typeof json[item] === 'object'){
			    	if(typeof json[item].id === 'string'){
				    	data[item+'Id'] = json[item].id;
			    	}
			    	//delete json[item];
			    }
			 }
			 return data;
		}
	},
	window.DateUtil = window.DateUtil || {
		format : function(format,str){ 
			var o = { 
				"M+" : str.getMonth()+1, //month 
				"d+" : str.getDate(), //day 
				"h+" : str.getHours(), //hour 
				"m+" : str.getMinutes(), //minute 
				"s+" : str.getSeconds(), //second 
				"q+" : Math.floor((str.getMonth()+3)/3), //quarter 
				"S" : str.getMilliseconds() //millisecond 
			} 
			if(/(y+)/.test(format)) { 
				format = format.replace(RegExp.$1, (str.getFullYear()+"").substr(4 - RegExp.$1.length)); 
			} 
			for(var k in o) { 
				if(new RegExp("("+ k +")").test(format)) { 
					format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
				} 
			} 
			return format; 
		},
		getFirstAndLastMonthDay : function ( year, month){    
            var   firstdate = year + '-' + month + '-01';  
            var  day = new Date(year,month,0);   
            var lastdate = year + '-' + month + '-' + day.getDate();//获取当月最后一天日期    
            var data = {
            	firstdate : firstdate,
            	lastdate : lastdate
            }
            return data;
         }  
	}
})(jQuery);