  function(toFormat,minutes) {
	  var d = new Date();
	  //return d.toISOString();
	  d.setMinutes(d.getMinutes() + minutes)
	  var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
	    var sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
	    var sdf2 = new SimpleDateFormat(toFormat);
	    var ss = sdf.parse(d.toISOString());
	    return sdf2.format(ss);
  }