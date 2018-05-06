modalActorFilm = new ModalScreen('modalActorFilm');
modalActorFilm.codEntitate = 'actorFilm';

modalActorFilm.add = function(context) {
	this.updateScreen('add');
	modalActorFilm.clear(context);
    $(modalActorFilm.divSelector + ' #btnCancel').unbind();
	$(modalActorFilm.divSelector + ' #btnCancel').on('click', function () { $(modalActorFilm.divSelector).hide(); });
    $(modalActorFilm.divSelector + ' #btnOk').unbind();
    $(modalActorFilm.divSelector + ' #btnOk').on('click', modalActorFilm.addSave);
	$(modalActorFilm.divSelector).show();
};

modalActorFilm.addSave = function() {
	var url = app.getUrlCreate(modalActorFilm.codEntitate);
	var idActor = $(modalActorFilm.divSelector + " [name='idActor']").val();
	var idFilm = $(modalActorFilm.divSelector + " [name='idFilm']").val();
	var personaj = $(modalActorFilm.divSelector + " [name='personaj']").val();
	url = url + "?idActor=" + idActor + "&idFilm=" + idFilm + "&personaj=" + personaj;
	$.ajax({
		url : url,
		type : 'PUT',
		async: false,
		timeout : 5000,
		contentType : 'application/json',
		dataType : 'json',
		success : function(data) { modalActorFilm.handleSuccess(data); },
		error : function(err) { modalActorFilm.handleError(err); }
	});
};

modalActorFilm.deleteModal = function(idActor, idFilm) {

		$('#deleteModal #close').unbind();
	    $('#deleteModal #close').on('click', function () { $('#deleteModal').hide(); });
		$('#deleteModal #delete').unbind();
	    $('#deleteModal #delete').on('click', function () {
	    	var url = app.getUrlCreate(modalActorFilm.codEntitate);
	    	url = url + "?idActor=" + idActor + "&idFilm=" + idFilm;
			$.ajax({
				url : url,
				type : 'DELETE',
				async: false,
				timeout : 5000,
				success : function(data) { browser.refresh(true) }
			});
	    	$('#deleteModal').hide();
	    });
 	$('#deleteModal').show();
};
