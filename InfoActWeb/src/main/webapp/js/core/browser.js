browser = {
	getUrlVars: function(url) {
		var vars = {};
		var hashes = url.split("?")[1];
		var hash = hashes.split('&');
		for (var i = 0; i < hash.length; i++) {
			params=hash[i].split("=");
			vars[params[0]] = params[1];
		}
		return vars;
	},

	removeHash: function(url) {
		var newUrl = url;
		var index = url.indexOf('#');
		if (index > 0) {
			newUrl = url.substring(0, index);
		};
		return newUrl;
	},

	addVarToUrl: function(url, varr, vall) {
		var vars = browser.getUrlVars(url);
		var newUrl = browser.removeHash(url);
		if (typeof vars[varr] === 'undefined') {
			newUrl = newUrl + '&'+ varr + '=' + vall;
		}
		return newUrl;
	},

	refresh: function(ls) {
		if (ls) {
			var currentUrl = window.location.href;
			var newUrl = browser.addVarToUrl(currentUrl, 'ls', 1);
			window.location.href = newUrl;
		} else {
			location.reload();
		}
	},

	getCurrentDate: function() {
		return new Date().toJSON().slice(0,10).split('-').reverse().join('.');
	},

	deleteModal: function(codEntitate, recordId) {

 		$('#deleteModal #close').unbind();
 	    $('#deleteModal #close').on('click', function () { $('#deleteModal').hide(); });
 		$('#deleteModal #delete').unbind();
 	    $('#deleteModal #delete').on('click', function () {
 	    	app.del(codEntitate, recordId, function() {
				browser.refresh(true);
			});
 	    	$('#deleteModal').hide();
 	    });
	 	$('#deleteModal').show();
	},

	childSelect: function(parentSelect, childSelectId) {
		var globalKey = parentSelect.value;
		$('#' + childSelectId).val('');
		$('#' + childSelectId + ' option')
			.each(function(index, option) {
				var localKey = $(option).data("parent");
				if (localKey == null) { return true; }
				if (localKey == globalKey) {
					$(option).show();
				} else {
					$(option).hide();
				}
			});
	},

	childUpdate: function(globalKey, childSelectId) {
		$('#' + childSelectId + ' option[data-parent]')
			.each(function(index, option) {
				var localKey = $(option).data("parent");
				if (localKey == null) { return true; }
				if (localKey == globalKey) {
					$(option).show();
				} else {
					$(option).hide();
				}
			});
	},
	
	childSelectHidden: function(parentSelect, childHiddenId) {
		var childValue = $(":selected", parentSelect).data("child");
		$('#' + childHiddenId).val(childValue);
	}

};
