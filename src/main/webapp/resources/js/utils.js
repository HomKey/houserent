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
	}
})(jQuery);