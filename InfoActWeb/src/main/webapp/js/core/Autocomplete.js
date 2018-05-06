function Autocomplete(idCtl, idCtl2) {
	var self = this;
	this.idCtl = idCtl;
	this.ctlSelector = '#' + this.idCtl;
	this.idCtl2 = idCtl2;
	this.codEntitate =  null;

	
    //$(self.ctlSelector).unbind();
	//$(self.ctlSelector).keyup(function() {
	//	var txt = $(self.ctlSelector).val();
	//	alert("Key up detected");
	//});
	
	//this.search = function(txt) {
 		//cauta pe server dupa txt
		//app.read(this.codEntitate, recordId, this.viewCallback, this.handleError);
 	//};

 	//this.searchCallback = function(recordList) {
 		//
	//}

	/*	
	$("#txtCompany").autocomplete({
		source: function( request, response ) {
			var filter = '{""}'
			app.readFilter(self.entityCode, filter, onSuccess, onError);
			$.getJSON( "search.php", {term: extractLast( request.term )}, response );
		},
		minLength: 2,
		select: function(event, ui) {
			alert(ui);
		}
	});
	*/
}