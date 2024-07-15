function(expValue,collection,pollingPeriod,retryCount) {
		var retry = 0;

      while (true) {
    	  
          if(retry == retryCount){
          	karate.log('Maximum retries attempted ',retryCount);
              break;
          }
        if(collection.equals('orderfulfillment')){
	    	var coll = { 'collection' : 'orderfulfillment'};
	        var results = karate.call('classpath:services/functionsInMongoDB.feature', coll)
	        if(!results.dbResults.isEmpty()){
	            var status = results.dbResults[0].tplOrderStatus;
	            karate.log('tpl Orderstatus', status); 
	        }
        } else if(collection.equals('tplorderfulfillment')){
        	var coll = { 'collection' : 'tplorderfulfillment'};
	        var results = karate.call('classpath:services/functionsInMongoDB.feature', coll)
	        if(!results.dbResults.isEmpty()){
	            var status = results.dbResults[0].status;
	            karate.log('status', status); 
	        }
        }

        if (status == expValue) {
          karate.log('condition satisfied, exiting');
          break;
        }
        retry++;
        karate.log('Waiting to retry');
        java.lang.Thread.sleep(pollingPeriod);
        
      }
      return results;
    }