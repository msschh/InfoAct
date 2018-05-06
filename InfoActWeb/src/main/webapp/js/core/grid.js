$().ready(function() {
	initHeaders();
});

function initHeaders() {
	var screenStatus = $('#screenStatus').val();
	if(screenStatus !== 'list') { return; } 	
	
	var sorterField = $('#sorterField');
	var sorterDirection = $('#sorterDirection');
	if ( !sorterField || !sorterDirection) { return; }

	$('.tblGrid th[data-sortby]')
		.addClass('sortable')
		.on('click', function() {
			var field = $(this).attr('data-sortby');
			sortBy(field);
		})
	if(sorterField.val()) {
        $('.tblGrid th[data-sortby=' + sorterField.val() + ']')
            .removeClass('sortable')
            .addClass(sorterDirection.val());
    }
}

function sortBy(fieldName) 
{
	var sorterField = $('#sorterField');
	var sorterDirection = $('#sorterDirection');
	if ( !sorterField || !sorterDirection) { return; }
	var newDirection = ((sorterField.val() === fieldName && sorterDirection.val() === 'asc') ? 'desc' : 'asc'); 
	$('#sorterField').val(fieldName);
	$('#sorterDirection').val(newDirection);
	var form = document.forms[0];
	form.submit();
}
