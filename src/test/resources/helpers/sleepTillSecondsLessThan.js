function(seconds) {
		karate.log('Execution paused till seconds is less than ' + seconds);
      while (true) {
    	  
    	    var d = new Date();
    	   // karate.log(d.getSeconds());
          if(d.getSeconds() < seconds){
          	karate.log('Resumed Execution '+ d.toISOString());
              break;
          }
        
        
        java.lang.Thread.sleep(500);
        
      }
      
    }