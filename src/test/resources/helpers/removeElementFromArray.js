  function(arr1,elementToBeRemoved) {
	  var arr = arr1;
	  
	  //var arr = ['PAYMENT_REQUESTED','PICKUP-READY','DELIVERY-CREATED','SHOPPER-DELIVERED']
	  //arr = Array.prototype.slice.call(arr); // Array
	  var i = arr.length;
	  for (var i = arr.length - 1; i >= 0; i--) {
		  if (arr[i] === elementToBeRemoved) {
			  karate.remove('arr','$.['+i+']')
			 // delete arr[i];
			 // arr.splice(i,1);
		  }
		 }
	  return arr;
	  
  }