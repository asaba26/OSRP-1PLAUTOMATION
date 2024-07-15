  function(date1,date2,type) {
	  
	  var date1 = new Date(date1); 
	  var date2 = new Date(date2); 
	  var diff = 0;
	  var Difference_In_Time = date2.getTime() - date1.getTime(); 
	  
	  if(type.equals('minutes') && !Difference_In_Time.equals(0)){
		  
		  diff = Difference_In_Time / (1000 * 60);
		  diff = diff.toFixed(0);
	}
	  if(type.equals('days') && !Difference_In_Time.equals(0)){
		 
		  var diff = Difference_In_Time / (1000 * 3600 * 24);
		  diff = diff.toFixed(0);
		}
	  return diff;
  }