function fn() {
    var env = karate.env;
	karate.log('karate.env system property was:', env);
	if (!env) {
		karate.fail('Environment is not defined');
	}
	var config = {
    		
		KAFKA_SERVERS_OMS : '172.21.44.39:9095'
	       
    	};
	config.env = env;
	
	
	if (env == 'qa') {
		config.KAFKA_SERVERS = 'pnpe-dk-qabr6.albertsons.com:9092,pnpe-dk-qabr7.albertsons.com:9092,pnpe-dk-qabr2.albertsons.com:9092';

		config.OSS_TOPIC = 'OSLM_WINE_SHIPMENTS_STATUS_QA';
		config.EDM_TOPIC = 'OSLM_WINE_SHIPMENTS_STATUS_QA';
		config.SHIP_STATUS = 'OSDT_ORDER_EVENTS_QA';
		config.OSLM_DATA = 'OSLM_CARRIER_SHIPMENTS_QA';
		config.SHIPMENT_QA = 'OCMF_OSCO_MP_SHIPMENT_QA';
        config.SHIPMENT_LABEL = 'OSPK_OSLM_SHIPPING_LABEL_QA';
		config.OSS_ORDER='ECOM_OSCO_OSS_ORDER_EVENT_TOPIC_QA';
		config.EDM_TOPIC_MKPL='OSCO_ESED_C02_SHIPMENT_QA';
		config.EDM_KAFKA_SERVERS='zquw-itka1br01.safeway.com:9095,zquw-itka1br02.safeway.com:9095,zquw-itka1br03.safeway.com:9095';
		config.MONGO_URI='mongodb://mongodb-oslmqa:wCvpPHQoMwIQrdpYt32xCA1ixjKgMAM4z8s4uGFgfo3nc8sn0dCRNgCpAUv39TDZNIH7P3yRWtxDlzg1S80R4g==@mongodb-oslmqa.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@mongodb-oslmqa@';
		// config.dbName='oslm_mp';
		// config.collectionName='shipment_details';
     	config.upsApiUrl='https://wwwcie.ups.com/track/v1/details/';
		config.sellershipmethodsApiUrl='https://oslm-seller-shipmethods-qa.apps.np.stratus.albertsons.com/api/v1/sellerShipMethods';
        config.invalidSellershipmethodsApiUrl='https://oslm-seller-shipmethods-qa.apps.np.stratus.albertsons.com/api/v1/sellerShipMethod';
        config.mpshipmethodsApiUrl='https://oslm-mp-shipmethods-acceptance.apps.np.stratus.albertsons.com/api/v1/shipMethods';
        config.invalidmpshipmethodsApiUrl='https://oslm-seller-shipmethods-qa.apps.np.stratus.albertsons.com/api/v1/sellerShipMe';
		config.Wine_Landing_api = 'https://oslm-wineshippingpromise-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/wineshipping/landingPromise';
		config.Wine_DPA_Promise = 'https://oslm-wineshippingpromise-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/wineshipping/shippingPromise';
		config.Shipping_Rate = 'https://oslm-wineshippingpromise-westus-qa-app-service-route.apps.np.stratus.albertsons.comhttps://oslm-wineshippinglabel-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/shippingLabels';
		config.Fnconfig_Post = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/functionalConfigs';
        config.Fnconfig_get = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/functionalConfigs/5799';
		config.UPSERT_SHIPPINGDATA = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/shippingFee';
		config.UPSERT_TRANSITDAYS = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/transitConfigs';
		config.UPSERT_PACKAGERATES = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/packageRates';
		config.Shippinglabel_get = 'https://oslm-wineshippinglabel-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/shipmentLabelDetailsForOrder/';
		config.REGENERATE_SHIPPINGLABEL = 'https://oslm-wineshippinglabel-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/regenerateShippingLabels';
		config.CONFIGTYPE_FUNCTIONALCONFIG = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=functionalConfigs';
		config.CONFIGTYPE_PACKAGERATES = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=packageConfigs';
		config.CONFIGTYPE_TRANSITDAYS = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=transitConfigs';
		config.CONFIGTYPE_SHIPPINGRATES = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=shippingFeeConfigs';
		config.CONFIGTYPE_INVALID = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=Invalid';
		config.ShippingRate_UPS = 'https://onlinetools.ups.com/ship/v1/rating/rate';
		config.UPS_SHIPRATE_SCHEDULER = 'https://oslm-wineshipscheduler-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/rateScheduler';
		config.EDD_SCHEDULER = 'https://oslm-wineshipscheduler-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/eddScheduler';
		config.upsApiUrl='https://wwwcie.ups.com/track/v1/details/';
		

	}

	else if (env == 'acceptance') {
    		config.KAFKA_SERVERS = 'pnpe-dk-qabr6.albertsons.com:9092,pnpe-dk-qabr7.albertsons.com:9092,pnpe-dk-qabr2.albertsons.com:9092';
            config.KAFKA_SERVERS_ONEPL = '172.21.224.153:9092,172.21.224.154:9092,172.21.224.155:9092'
			config.SHIPMENT_QA = 'OCMF_OSCO_MP_SHIPMENT_ACCP';
          config.OSS_ORDER = 'ECOM_OSCO_OSS_ORDER_EVENT_TOPIC_ACCEPTANCE';
		  config.EDM_KAFKA_SERVERS='zquw-itka1br01.safeway.com:9095,zquw-itka1br02.safeway.com:9095,zquw-itka1br03.safeway.com:9095';
          config.EDM_TOPIC_MKPL='OSCO_ESED_C02_SHIPMENT_QA';
          config.MONGO_URI ='mongodb://mongodb-oslmaccp:NpvXk0gxArtssHsGg3iVJlfe5ACHwvJMeUoZhd1ollZMcZYV4rXCVL4tX7XfA3v9wVXtGLAdAFyFscpLIoeDAw==@mongodb-oslmaccp.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@mongodb-oslmaccp@';
          config.upsApiUrl='https://wwwcie.ups.com/track/v1/details/';
          config.sellershipmethodsApiUrl='https://oslm-seller-shipmethods-acceptance.apps.np.stratus.albertsons.com/api/v1/sellerShipMethods';
           config.invalidSellershipmethodsApiUrl='https://oslm-seller-shipmethods-acceptance.apps.np.stratus.albertsons.com/api/v1/sellerShipMethod';
           config.mpshipmethodsApiUrl='https://oslm-mp-shipmethods-acceptance.apps.np.stratus.albertsons.com/api/v1/shipMethods'
           config.invalidmpshipmethodsApiUrl='https://oslm-seller-shipmethods-acceptance.apps.np.stratus.albertsons.com/api/v1/sellerShipMe';
            config.OSRP_1PL_TOTES_TOPIC = 'OSRP_1PL_TOTES';
            config.EMOM_TOPIC = 'EMOM_ORDER_TOPIC_ACCEPTANCE';
			config.EMOM_ORDER_TOPIC = 'EMOM_ORDER_TOPIC_ACCEPTANCE';
    		config.OSS_TOPIC = 'OSLM_WINE_SHIPMENTS_STATUS_ACP';
    		config.EDM_TOPIC = 'OSLM_WINE_SHIPMENTS_STATUS_ACP';
    		config.SHIP_STATUS = 'OSDT_ORDER_EVENTS_ACCP';
    		config.OSLM_DATA = 'OSLM_CARRIER_SHIPMENTS_ACP';
    		config.SHIPMENT_LABEL= 'OSPK_OSLM_SHIPPING_LABEL_ACCP';
    		config.OSS_ORDER='ECOM_OSCO_OSS_ORDER_EVENT_TOPIC_ACCEPTANCE';
    		config.MONGO_URI='mongodb://mongodb-oslmaccp:NpvXk0gxArtssHsGg3iVJlfe5ACHwvJMeUoZhd1ollZMcZYV4rXCVL4tX7XfA3v9wVXtGLAdAFyFscpLIoeDAw==@mongodb-oslmaccp.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@mongodb-oslmaccp@';
            config.RPUI_DBURL_ENDPOINT = 'https://apim-dev-01.albertsons.com/abs/qaint/osrp/routeplanner'
    		 config.Wine_Landing_api = 'https://oslm-wineshippingpromise-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/wineshipping/landingPromise';
             config.Wine_DPA_Promise = 'https://oslm-wineshippingpromise-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/wineshipping/shippingPromise';
             config.Shipping_Rate = 'https://oslm-wineshippingpromise-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/wineshipping/shippingHandlingFee';
             config.Retieve_Shipment_Label = 'https://oslm-wineshippinglabel-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/shippingLabels';
             config.Fnconfig_Post = 'https://oslm-wineconfigservice-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/functionalConfigs';
             config.Fnconfig_get = 'https://oslm-wineconfigservice-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/functionalConfigs/5799';
             config.UPSERT_SHIPPINGDATA = 'https://oslm-wineconfigservice-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/shippingFee';
             config.UPSERT_TRANSITDAYS = 'https://oslm-wineconfigservice-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/transitConfigs';
             config.UPSERT_PACKAGERATES = 'https://oslm-wineconfigservice-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/packageRates';
             config.Shippinglabel_get = 'https://oslm-wineshippinglabel-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/shipmentLabelDetailsForOrder/';
             config.REGENERATE_SHIPPINGLABEL = 'https://oslm-wineshippinglabel-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/regenerateShippingLabels';
             config.CONFIGTYPE_FUNCTIONALCONFIG = 'https://oslm-wineconfigservice-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=functionalConfigs';
             config.CONFIGTYPE_PACKAGERATES = 'https://oslm-wineconfigservice-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=packageConfigs';
             config.CONFIGTYPE_TRANSITDAYS = 'https://oslm-wineconfigservice-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=transitConfigs';
             config.CONFIGTYPE_SHIPPINGRATES = 'https://oslm-wineconfigservice-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=shippingFeeConfigs';
             config.CONFIGTYPE_INVALID = 'https://oslm-wineconfigservice-westus-acceptance-app-service-route.apps.np.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=Invalid';
    	}
    	else if (env == 'stage'){

    	
			      config.KAFKA_SERVERS = '172.23.0.103:9092,172.23.0.104:9092,172.23.0.105:9092';
				  config.OSS_ORDER='ECOM_OSCO_OSS_ORDER_EVENT_TOPIC_STAGE';
        		  config.EDM_KAFKA_SERVERS='zquw-itka1br01.safeway.com:9095,zquw-itka1br02.safeway.com:9095,zquw-itka1br03.safeway.com:9095';
				  config.EDM_TOPIC = 'OSLM_WINE_SHIPMENTS_STATUS_STG'
            	 config.OSLM_DATA = 'OSLM_CARRIER_SHIPMENTS_STG';
            	config.SHIPMENT_LABEL= 'OSPK_OSLM_SHIPPING_LABEL_STG';
                config.OSS_TOPIC = 'OSLM_WINE_SHIPMENTS_STATUS_STG';
				  config.EDM_TOPIC = 'OSLM_WINE_SHIPMENTS_STATUS_STG';
				  config.SHIP_STATUS = 'OSDT_ORDER_EVENTS_STG';
			     config.SHIPMENTLABLE_QA = 'OSPK_OSLM_SHIPPING_LABEL_STG';
				config.MONGO_URI='mongodb://mongodb-oslmstage:VvJt0h3BtC5yJ8Jb3R2LJ2Z8@mongodb-oslmstage.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@mongodb-oslmstage@';
				  config.upsApiUrl='https://wwwcie.ups.com/track/v1/details/';
				  config.sellershipmethodsApiUrl='https://oslm-seller-shipmethods-stage.apps.np.stratus.albertsons.com/api/v1/sellerShipMethods';


    	        config.Wine_Landing_api = 'https://oslm-wineshippingpromise-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/wineshipping/landingPromise';
        		config.Wine_DPA_Promise = 'https://oslm-wineshippingpromise-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/wineshipping/shippingPromise';
        		config.Shipping_Rate = 'https://oslm-wineshippingpromise-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/wineshipping/shippingHandlingFee';
        		config.Retieve_Shipment_Label = 'https://oslm-wineshippinglabel-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/shippingLabels';
        		config.Fnconfig_Post = 'https://oslm-wineconfigservice-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/functionalConfigs';
        		config.Fnconfig_get = 'https://oslm-wineconfigservice-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/functionalConfigs/5799';
        		config.UPSERT_SHIPPINGDATA = 'https://oslm-wineconfigservice-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/shippingFee';
        		config.UPSERT_TRANSITDAYS = 'https://oslm-wineconfigservice-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/transitConfigs';
        		config.UPSERT_PACKAGERATES = 'https://oslm-wineconfigservice-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/packageRates';
        		config.Shippinglabel_get = 'https://oslm-wineshippinglabel-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/shipmentLabelDetailsForOrder/';
        		config.REGENERATE_SHIPPINGLABEL = 'https://oslm-wineshippinglabel-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/regenerateShippingLabels';
        		config.CONFIGTYPE_FUNCTIONALCONFIG = 'https://oslm-wineconfigservice-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=functionalConfigs';
        		config.CONFIGTYPE_PACKAGERATES = 'https://oslm-wineconfigservice-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=packageConfigs';
        		config.CONFIGTYPE_TRANSITDAYS = 'https://oslm-wineconfigservice-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=transitConfigs';
        		config.CONFIGTYPE_SHIPPINGRATES = 'https://oslm-wineconfigservice-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=shippingFeeConfigs';
        		config.CONFIGTYPE_INVALID = 'https://oslm-wineconfigservice-westus-stage-app-service-route.apps.prod.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=Invalid';

    	}
    	else if (env == 'RefundQA' ){
    		
    		config.KAFKA_SERVERS_REFUND = 'qgm010ccf.albertsons.com:9095,qgm010cd0.albertsons.com:9095,qgm010cd1.albertsons.com:9095,qgm010cd2.albertsons.com:9095,qgm010cd3.albertsons.com:9095';
    		config.REFUND_REQUEST_QA = 'OCRR_OSLM_REFUND_REQUEST_QA';
    		config.REFUND_RESPONSE_QA = 'OCRR_OSLM_REFUND_RESPONSE_QA';
    		config.MONGO_URI='mongodb://mongodb-oslmqa:wCvpPHQoMwIQrdpYt32xCA1ixjKgMAM4z8s4uGFgfo3nc8sn0dCRNgCpAUv39TDZNIH7P3yRWtxDlzg1S80R4g==@mongodb-oslmqa.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@mongodb-oslmqa@';
			config.EDM_TOPIC_MKPL='OSCO_ESED_C02_SHIPMENT_QA';
		    config.EDM_KAFKA_SERVERS='zquw-itka1br01.safeway.com:9095,zquw-itka1br02.safeway.com:9095,zquw-itka1br03.safeway.com:9095';
    		// config.dbName='oslm_mp';
    		// config.collectionName='shipment_details';
    		
    	}

		else if (env == 'AKS_QA' ){
			config.KAFKA_SERVERS_AKS = 'qgm010ccf.albertsons.com:9092,qgm010cd0.albertsons.com:9092,qgm010cd1.albertsons.com:9092,qgm010cd2.albertsons.com:9092,qgm010cd3.albertsons.com:9092,qgm010ccd.albertsons.com:9092,qgm010cce.albertsons.com:9092,qgm010ce3.albertsons.com:9092';
			config.SHIPMENT_LABEL= 'OSPK_OSLM_SHIPPING_LABEL_QA';
			config.OSS_TOPIC = 'OSLM_WINE_SHIPMENTS_STATUS_QA';
		config.EDM_TOPIC = 'OSLM_WINE_SHIPMENTS_STATUS_QA';
		config.SHIP_STATUS = 'OSDT_ORDER_EVENTS_QA';
		config.OSLM_DATA = 'OSLM_CARRIER_SHIPMENTS_QA';
		config.SHIPMENT_QA = 'OCMF_OSCO_MP_SHIPMENT_QA';
      config.OSS_ORDER='ECOM_OSCO_OSS_ORDER_EVENT_TOPIC_QA';
		config.EDM_TOPIC_MKPL='OSCO_ESED_C02_SHIPMENT_QA';
		config.EDM_KAFKA_SERVERS='zquw-itka1br01.safeway.com:9095,zquw-itka1br02.safeway.com:9095,zquw-itka1br03.safeway.com:9095';
		config.MONGO_URI='mongodb://mongodb-oslmqa:wCvpPHQoMwIQrdpYt32xCA1ixjKgMAM4z8s4uGFgfo3nc8sn0dCRNgCpAUv39TDZNIH7P3yRWtxDlzg1S80R4g==@mongodb-oslmqa.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@mongodb-oslmqa@';
		// config.dbName='oslm_mp';
		// config.collectionName='shipment_details';
     	config.upsApiUrl='https://wwwcie.ups.com/track/v1/details/';
		config.sellershipmethodsApiUrl='https://oslm-seller-shipmethods-qa.apps.np.stratus.albertsons.com/api/v1/sellerShipMethods';
        config.invalidSellershipmethodsApiUrl='https://oslm-seller-shipmethods-qa.apps.np.stratus.albertsons.com/api/v1/sellerShipMethod';
        config.mpshipmethodsApiUrl='https://oslm-mp-shipmethods-acceptance.apps.np.stratus.albertsons.com/api/v1/shipMethods';
        config.invalidmpshipmethodsApiUrl='https://oslm-seller-shipmethods-qa.apps.np.stratus.albertsons.com/api/v1/sellerShipMe';
		config.Wine_Landing_api = 'https://oslm-wineshippingpromise-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/wineshipping/landingPromise';
		config.Wine_DPA_Promise = 'https://oslm-wineshippingpromise-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/wineshipping/shippingPromise';
		config.Shipping_Rate = 'https://oslm-wineshippingpromise-westus-qa-app-service-route.apps.np.stratus.albertsons.comhttps://oslm-wineshippinglabel-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/shippingLabels';
		config.Fnconfig_Post = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/functionalConfigs';
        config.Fnconfig_get = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/functionalConfigs/5799';
		config.UPSERT_SHIPPINGDATA = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/shippingFee';
		config.UPSERT_TRANSITDAYS = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/transitConfigs';
		config.UPSERT_PACKAGERATES = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/packageRates';
		config.Shippinglabel_get = 'https://oslm-wineshippinglabel-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/shipmentLabelDetailsForOrder/';
		config.REGENERATE_SHIPPINGLABEL = 'https://oslm-wineshippinglabel-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/regenerateShippingLabels';
		config.CONFIGTYPE_FUNCTIONALCONFIG = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=functionalConfigs';
		config.CONFIGTYPE_PACKAGERATES = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=packageConfigs';
		config.CONFIGTYPE_TRANSITDAYS = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=transitConfigs';
		config.CONFIGTYPE_SHIPPINGRATES = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=shippingFeeConfigs';
		config.CONFIGTYPE_INVALID = 'https://oslm-wineconfigservice-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/audit/wineConfigAuditTrail?configType=Invalid';
		config.ShippingRate_UPS = 'https://onlinetools.ups.com/ship/v1/rating/rate';
		config.UPS_SHIPRATE_SCHEDULER = 'https://oslm-wineshipscheduler-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/rateScheduler';
		config.EDD_SCHEDULER = 'https://oslm-wineshipscheduler-westus-qa-app-service-route.apps.np.stratus.albertsons.com/api/v1/eddScheduler';
		config.upsApiUrl='https://wwwcie.ups.com/track/v1/details/';

	
		}

	// don't waste time waiting for a connection or if servers don't respond
	// within 5 seconds
	karate.configure('connectTimeout', 20000);
	karate.configure('readTimeout', 20000);

	karate.log(config)
	return config;
}
