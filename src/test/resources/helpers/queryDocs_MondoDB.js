function(mongo_url,collectionName,orderNumber){
	const MongoClient = require('mongodb').MongoClient;

	const url = mongo_url;

	MongoClient.connect(url, { useNewUrlParser: true }, (err, client) => {

	    if (err) throw err;

	    const db = client.db("3porders");

	    let collection = db.collection(collectionName);
	    let query = { orderId: '28765156' }

	    collection.findOne(query).then(doc => {

	        console.log(doc);

	    }).catch((err) => {

	        console.log(err);
	    }).finally(() => {

	        client.close();
	    });
	});
}