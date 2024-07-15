  function(comp,value,type) {
	  var d = new Date();
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
	  return d.toISOString();
  }