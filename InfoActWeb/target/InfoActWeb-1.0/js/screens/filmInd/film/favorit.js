filmFavorit = function(idFilm, fav) {
	var url = app.getUrlCreate("favorit");
	url = url + "?idFilm=" + idFilm;
	if (!fav) {
		$.ajax({
			url : url,
			type : 'PUT',
			async: false,
			timeout : 5000,
			contentType : 'application/json',
			dataType : 'json',
			success : function(data) { browser.refresh(true) }
		});
	} else {
		$.ajax({
			url : url,
			type : 'DELETE',
			async: false,
			timeout : 5000,
			contentType : 'application/json',
			dataType : 'json',
			success : function(data) { browser.refresh(true) }
		});
	}
};