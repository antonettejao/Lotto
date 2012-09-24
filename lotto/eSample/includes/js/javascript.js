function checkLeadingWhiteSpace(fieldvar)
{
	return /^\s/.test(fieldvar.value);
}

function checkLength(fieldvar)
{
	if (fieldvar.value.length != 0)
		return true;
	else
		return false;
}

function checkSelectBox(fieldvar)
{
	if (fieldvar.selectedIndex != 0)
		return true;
	else
		return false;
}

function isDigit(fieldVar)
{
	if (fieldVar.length > 1)
		return false;
	var string="1234567890";
	return (string.indexOf(fieldVar) != -1);
}

function isInteger(fieldVar)
{
	for(var i=0; i<fieldVar.length; i++)
	{
		if (!isDigit(fieldVar.charAt(i)))
			return false;
	}
	return true;
}

function isNumeric(fieldVar)
{
	return(parseFloat(fieldVar,10) == (fieldVar*1));
}

function checkDate(dateStr)
{	
	var datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{4})$/;
	
	var matchArray = dateStr.match(datePat);
	if (matchArray == null)
	{
		//alert("Date is not formatted correctly");
		return false;
	}
	
	var month = matchArray[1];
	var day = matchArray[3];
	var year = matchArray[4];
	
	if (month < 1 || month > 12)
	{
		//alert("Month must be between 1 and 12.");
		return false;
	}
	
	if (day < 1 || day > 31)
	{
		//alert("Day must be between 1 and 31.");
		return false;
	}
	
	if ((month==4 || month==6 || month==9 || month==11) && day==31)
	{
		//alert("Month "+month+" doesn't have 31 days!")
		return false;
	}
	
	if (month == 2)
	{
		var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		if (day>29 || (day==29 && !isleap))
		{
			//alert("February " + year + " doesn't have " + day + " days!");
			return false;
	   }
	}
	return true;
}

///////////////////////////////////////////
function lTrim(str) {
  	var r=/\s*((\S+\s*)*)/; 
  	return str.replace(r,"$1");
}

function rTrim(str) {
  	var r=/((\s*\S+)*)\s*/;	
  	return str.replace(r,"$1");
}

function trim(str) {
  	return this.rTrim(this.lTrim(str.value));
}

function checkStrLength(str) {
	if (str.length != 0)
		return true;
	else
		return false;
}

function checkEmail(fieldvar) {
	//rfc2822 standard
	var filter = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Za-z]{2}|com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|museum)\b$/;
	//var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (filter.test(fieldvar.value))
		return true;
	else
		return false;
}

///////////////////////////////////////////////////

function checkZipCode(fieldvar)
{
	var filter = /^\d{5}([\-]\d{4})?$/;
	if (filter.test(fieldvar.value))
		return true;
	else
		return false;
}

function checkRequired(obj) {
    if (obj.value=='') {
        if ((document.all)||(document.getElementById)) {
            obj.style.backgroundColor = '#c5cdd0';
        }
    } else {
        if ((document.all)||(document.getElementById)) {
            obj.style.backgroundColor = '#ffffff';
        }
    }
}

function checkSBRequired(obj) {
    if (obj.selectedIndex == 0) {
        if ((document.all)||(document.getElementById)) {
            obj.style.backgroundColor = '#c5cdd0';
        }
    } else {
		if ((document.all)||(document.getElementById)) {
            obj.style.backgroundColor = '#ffffff';
        }
    }
}

//////////mon field validations
function checkPhone(number) {
	var filter = /^(\d{3}[-]\d{3}[-]\d{4})|(\d{3}[.]\d{3}[.]\d{4})$/;
	if (number.value.length > 0){
	 	if (!filter.test(number.value)) {
			return false;
		}
	}
	return true;	
}

function checkIfDashesIsUsed(number) {	
	if ((number.value.charAt(3) == '-') && (number.value.charAt(7) == '-')) {
		return true;
	} else {
		return false;
	} 
}

function extractPhoneOrFaxNumber(number) {
	var extractedNumber = "";
	for (iCtr = 0; iCtr < number.value.length; iCtr++) { //extract first the correct number 
		if (iCtr == 3) {
			extractedNumber = number.value.substring(0,3);
			extractedNumber += number.value.substring(4,7);
		}
	
		if (iCtr == 7) {
			extractedNumber += number.value.substring(8,12);
		}
	}
	return extractedNumber;
}

function checkFax(number) {
	var filter = /^(\d{3}[-]\d{3}[-]\d{4})|(\d{3}[.]\d{3}[.]\d{4})$/;
	if (number.value.length > 0){
	 	if (!filter.test(number.value)) {
			return false;
		}
	}
	return true;
}

function isANum(str) {
	if (str.length == 0)
		return true
	else {
		for (var i=0; i < str.length; i++) {
			var ch = str.substring(i, i+1)
			if (ch < "0" || ch > "9")
				return false
		}
	}
	return true
}

function checkLengthZip(mailZip) {
	if (mailZip.value.length >= 0 && mailZip.value.length < 5) {
		return false;
	} else {		
		return true;
	}
}

function isANum(str) {
	if (str.length == 0)
		return true
	else {
		for (var i=0; i < str.length; i++) {
			var ch = str.substring(i, i+1)
			if (ch < "0" || ch > "9")
				return false
		}
	}
	return true
}

function lTrim(str) {
  	var r=/\s*((\S+\s*)*)/; 
  	return str.replace(r,"$1");
}

function rTrim(str) {
  	var r=/((\s*\S+)*)\s*/;	
  	return str.replace(r,"$1");
}

function trim(str) {
  	return this.rTrim(this.lTrim(str.value));
}

function checkStrLength(str) {
	if (str.length != 0)
		return true;
	else
		return false;
}