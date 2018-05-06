$().ready(function () {
	var head = $('#divDrepturi p');
	var body = $('#divDrepturi p ~ ul');
	var link = $('#divDrepturi li');

	head.on('click', function(event) {
		if ($(this).attr('class') != 'active') {
			body.slideUp(1);
			$(this).next().slideToggle(1);
			head.removeClass('active');
			$(this).addClass('active');
		} else {
			head.removeClass('active');
			body.slideUp(1);
		}
	}); 
	
	link.on('click', function(event) {
		if ($(this).attr('class') != 'active') {
			link.find("span").removeClass('active');
			$(this).find("span").addClass('active');
		} else {
			link.find("span").removeClass('active');
		}
		body.find('.drepturiHidden').css('visibility', 'hidden');
		$(this).children('.drepturiHidden').css('visibility', 'visible');
	});
});