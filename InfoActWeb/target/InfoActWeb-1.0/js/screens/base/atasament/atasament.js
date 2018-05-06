atasament = {

	upload: function() {
		$('#uploadFile').click();
	},

	onUpload: function() {
        atasament.load();
        atasament.setTitle(atasament.filename);
        atasament.setExtension(atasament.ext);
	},

	load: function() {
		var fileUpload = document.getElementById("uploadFile");
		var fullPath = fileUpload.value;
        var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
        var filename = fullPath.substring(startIndex);
        if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
        	filename = filename.substring(1);
        }
        filename = filename.substring(0, filename.lastIndexOf('.'));
        var ext = fullPath.split('.').pop().toLowerCase();

        atasament.path = fullPath;
        atasament.filename = filename;
        atasament.ext = ext;
	},

	setTitle: function(filename) {
		$('#txtTitlu').val(filename);
	},

	setExtension: function(ext) {
		$('#txtTipFisier').val(ext);
	}
}
