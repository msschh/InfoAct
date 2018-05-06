
modalAtasament = {
	divSelector: '#modalAtasament'
};

modalAtasament.attachModal = function() {
	$(modalAtasament.divSelector + ' #btnCancel').unbind();
	$(modalAtasament.divSelector + ' #btnCancel').on('click', function () { $(modalAtasament.divSelector).hide(); });
	$(modalAtasament.divSelector + ' #btnOk').unbind();
	$(modalAtasament.divSelector + ' #btnOk').on('click', function() {
		var url  =  
			'/' + window.location.pathname.split('/')[1] 
			+ '/mvc/atasament/attach'
			;		
		$('#frmAtasament').attr("action", url);
		$('#frmAtasament').submit();
	});
 	$(modalAtasament.divSelector).show();
}
