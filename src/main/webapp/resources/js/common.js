;(function($) {
	//number转货币类型
	//(参数：保留小数位数，货币符号，整数部分千位分隔符，小数分隔符
	/*
	 * 反向转化
	 * var price = (12345.99).formatMoney(); // "$12,345.99"

    // Remove non-numeric chars (except decimal point/minus sign):
    priceVal = parseFloat(price.replace(/[^0-9-.]/g, '')); // 12345.99
    这个方法仅仅应用于小数分隔符为"."的模式，如果小数分隔符是"," 那么正则表达式为/[^0-9-,]/g
	 */
	Number.prototype.formatMoney = function (places, symbol, thousand, decimal) {
	    places = !isNaN(places = Math.abs(places)) ? places : 2;
	    symbol = symbol !== undefined ? symbol : "$";
	    thousand = thousand || ",";
	    decimal = decimal || ".";
	    var number = this,
	        negative = number < 0 ? "-" : "",
	        i = parseInt(number = Math.abs(+number || 0).toFixed(places), 10) + "",
	        j = (j = i.length) > 3 ? j % 3 : 0;
	    return symbol + negative + (j ? i.substr(0, j) + thousand : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousand) + (places ? decimal + Math.abs(number - i).toFixed(places).slice(2) : "");
	};

})(jQuery);