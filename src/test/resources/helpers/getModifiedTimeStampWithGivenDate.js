  function(timestamp,comp,value,type,toFormat) {
	  var d = new Date(timestamp);
	  if(type.equals('future')){
	  switch(comp) {
	  case 'date':
		  d.setDate(d.getDate() + value)
	    break;
	  case 'minutes':
		  d.setMinutes(d.getMinutes() + value)
	    break;
	  case 'hours':
		  d.setHours(d.getHours() + value)
		    break;
	  }
	}
	  if(type.equals('past')){
		  switch(comp) {
		  case 'date':
			  d.setDate(d.getDate() - value)
		    break;
		  case 'minutes':
			  d.setMinutes(d.getMinutes() - value)
		    break;
		  case 'hours':
			  d.setHours(d.getHours() - value)
			    break;
		  }
		}
	  //return d.toISOString();
	  var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
	    var sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
	    var sdf2 = new SimpleDateFormat(toFormat);
	    var ss = sdf.parse(d.toISOString());
	    return sdf2.format(ss);
  }