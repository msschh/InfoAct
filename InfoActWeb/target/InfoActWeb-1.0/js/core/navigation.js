function changePage(pageNo)
{
	var form = document.forms[0];
	var hiddenField = document.createElement('input');
    hiddenField.setAttribute('type', 'hidden');
    hiddenField.setAttribute('name', 'pageNo');
    form.appendChild(hiddenField);
	hiddenField.setAttribute('value', pageNo);
	form.submit();
};

function jQueryDeleteModal(link, recordId, params) {
    $('#deleteModal').show();

    $('#deleteModal #delete').on('click', function () {
    	let url = link + '?id=' + recordId;
    	if (params) {
    		url += '&' + params;
    	}
        window.location = url;
    });

    $('#deleteModal #close').on('click', function () {
        $('#deleteModal').hide();
    });
}

function deleteRecord(entityCode, recordId, onSuccess, onError) {
	let url = getUrl(entityCode, recordId);
	$.ajax({
		url : url,
		type : "DELETE",
		async: true,
		timeout : 4000,
		success : function(result) { onSuccess(result); },
		error : function(err) { onError(err) },
	});
}

function infoModal(mesaj) {
	
	$('#infoModal #close').unbind();
	$('#infoModal #close').on('click', function () { 
		$('#infoModal').hide(); 
	});

	$('#infoModal #textContent').text(mesaj);
	$('#infoModal').show();
}
