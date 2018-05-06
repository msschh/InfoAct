$().ready(function () {
    var head = $('#divMenu p');
    var body = $('#divMenu p ~ ul');

    head.on('click', function () {
        if ($(this).attr('class') !== 'active') {
            body.slideUp(1);
            $(this).next().slideToggle(1);
            head.removeClass('active');
            $(this).addClass('active');
        } else {
            head.removeClass('active');
            body.slideUp(1);
        }
    });

    if(
    	(typeof menuHead !== 'undefined') 
    	&& menuHead !== '' 
    	&& menuLink !=='') 
    	{
    	
        $('#divMenu #' + menuHead).prev($('p')).addClass('active');
        $('#divMenu #' + menuHead).slideToggle(0);
        $('#divMenu #' + menuLink +' a').addClass('active');
    }
});

