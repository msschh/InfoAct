app = {

	//urlWs:  'http://localhost:8081/kepres2Ws/api/rs/',
	urlWs: '/' + window.location.pathname.split('/')[1] + '/api/rs/',

	// pt. read & update & delete
	getUrl: function(entityCode, recordId) {
		//let url = 'http://localhost:8081/kepres2Ws/api/rs/' + entityCode + '/' + recordId;
		//let url = '/' + window.location.pathname.split('/')[1] + '/api/rs/' + entityCode + '/' + recordId;
		let url = app.urlWs + entityCode + '/' + recordId;
		return url;
	},

	getUrlCreate: function(entityCode) {
		let url = app.urlWs + entityCode;
		return url;
	},

	getUrlFilter: function(entityCode) {
		let url = app.urlWs + entityCode + '/m/filter';
		return url;
	},

	readFilter: function(entityCode, filter, onSuccess, onError) {
		var url = this.getUrlFilter(entityCode);
		var jsonData = JSON.stringify(filter);
		$.ajax({
			url : url,
			type : 'POST',
			async: false,
			timeout : 4000,
			contentType : 'application/json',
			dataType : 'json',
			data: jsonData,
			success : function(data) { onSuccess(data); },
			error : function(err) { onError(err); }
		});
	},

	read: function(entityCode, recordId, onSuccess, onError) {
		var url = this.getUrl(entityCode, recordId);
		$.ajax({
			url : url,
			type : 'GET',
			async: false,
			timeout : 4000,
			contentType : 'application/json',
			dataType : 'json',
			success : function(data) { onSuccess(data); },
			error : function(err) { onError(err); }
		});
	},

	update: function(entityCode, record, onSuccess, onError) {
		var url = this.getUrl(entityCode, record.id);
		var jsonData = JSON.stringify(record);
		$.ajax({
			url : url,
			type : 'POST',
			async: false,
			timeout : 5000,
			contentType : 'application/json',
			dataType : 'json',
			data: jsonData,
			success : function(data) { onSuccess(data); },
			error : function(err) { onError(err); }
		});
	},

	create: function(entityCode, record, onSuccess, onError) {
		var url = this.getUrlCreate(entityCode);
		var jsonData = JSON.stringify(record);
		$.ajax({
			url : url,
			type : 'PUT',
			async: false,
			timeout : 5000,
			contentType : 'application/json',
			dataType : 'json',
			data: jsonData,
			success : function(data) { onSuccess(data); },
			error : function(err) { onError(err); }
		});
	},

	del: function(entityCode, recordId, onSuccess, onError) {
		var url = app.getUrl(entityCode, recordId);
		$.ajax({
			url : url,
			type : 'DELETE',
			async: false,
			timeout : 5000,
			success : function(data) { onSuccess(data); },
			error : function(err) { onError(err); }
		});
	}

};
