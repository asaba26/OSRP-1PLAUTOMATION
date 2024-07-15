  function(timestamp,toFormat) {
	  var date = new Date(timestamp);
	  var coff = 1000 * 60 * 5; 
	  var d = new Date(Math.ceil(date / coff) * coff);
	  var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
	    var sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
	    var sdf2 = new SimpleDateFormat(toFormat);
	    var ss = sdf.parse(d.toISOString());
	    return sdf2.format(ss);
	    
  }