function(timestamp) {
	karate.log('Execution paused till ' + timestamp);
      while (true) {
    	  
    	    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
    	    var sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    	    var sdf2 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    	    var ss = sdf.parse(new Date().toISOString());
    	    var currTime = sdf2.format(ss);
    	    //karate.log(currTime);
          if(timestamp == currTime){
          	karate.log('Resumed Execution '+ currTime);
              break;
          }
        
        java.lang.Thread.sleep(500);
        
      }
      
    }