  function(i) {
	  var id = Math.floor(100000 + Math.random() * 900000).toString();
	  return { toteId: id , toteTempZone : tempZones[i] }
  }