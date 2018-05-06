function ModalScreen(idDivModal) {
	var self = this;
	this.idDivModal = idDivModal;
	this.divSelector = '#' + this.idDivModal;
	this.codEntitate =  null;

	this.view = function(recordId) {
 		app.read(this.codEntitate, recordId, this.viewCallback, this.handleError);
 	};

	this.edit= function(recordId) {
 		app.read(this.codEntitate, recordId, this.editCallback, this.handleError);
 	};

	this.add = function(context) {
 		this.updateScreen('add');
		self.clear(context);
	    $(self.divSelector + ' #btnCancel').unbind();
		$(self.divSelector + ' #btnCancel').on('click', function () { $(self.divSelector).hide(); });
	    $(self.divSelector + ' #btnOk').unbind();
	    $(self.divSelector + ' #btnOk').on('click', self.addSave);
 		$(self.divSelector).show();
 	};

 	this.viewCallback = function(record) {
		self.updateScreen('view');
		self.loadRecord(record, 'view');
	    $(self.divSelector + ' #btnCancel').unbind();
	    $(self.divSelector + ' #btnCancel').on('click', function () { $(self.divSelector).hide(); });
		$(self.divSelector).show();
	}

	this.editCallback = function(record) {
		self.updateScreen('edit');
		self.loadRecord(record, 'edit');
	    $(self.divSelector + ' #btnCancel').unbind();
	    $(self.divSelector + ' #btnCancel').on('click', function () { $(self.divSelector).hide(); });
	    $(self.divSelector + ' #btnOk').unbind();
	    $(self.divSelector + ' #btnOk').on('click', self.editSave);
		$(self.divSelector).show();
	}

	this.addSave = function() {
		var record = self.getRecord('add');
		app.create(self.codEntitate, record, self.handleSuccess, self.handleError);
	}

	this.editSave = function() {
		var record = self.getRecord('edit');
		app.update(self.codEntitate, record, self.handleSuccess, self.handleError);
	}

	this.handleSuccess = function() {
		$(self.divSelector).hide();
		browser.refresh(true);
	};

	this.handleError = function(err) {
		var errMsg = 'error: ' + err.code + ' : ' + err.status + ' : ' + err.message;
		console.log("ERROR: ", errMsg);
		$(self.divSelector).hide();
	};

	this.updateScreen = function(status) {
		var selector = 
			this.divSelector + ' input[type=text]' 
			+ ', ' + this.divSelector + ' input[type=checkbox]'
			+ ', ' + this.divSelector + ' select' 
			+ ', ' + this.divSelector + ' textarea';
		if (status === 'view') {
			$(selector, ':not(.v)').hide();
			$('.v').show();
			$('.v').attr("disabled", "disabled");
			$(this.divSelector + ' #btnOk').hide();
		} else if (status === 'add') {
			$(selector, ':not(.a, .ad)').hide();
			$('.a, .ad').show();
			$('.a').removeAttr("disabled");
			$('.ad').attr("disabled", "disabled");
			$(this.divSelector + ' #btnOk').show();
		} else if (status === 'edit') {
			$(selector, ':not(.e, .ed)').hide();
			$('.e, .ed').show();
			$('.e').removeAttr("disabled");
			$('.ed').attr("disabled", "disabled");
			$(this.divSelector + ' #btnOk').show();
		};
	};

	/*
	 * Control methods 
	 */
	
	this.loadControl = function(control, numeControl, record) {
		if (numeControl == null) {
			return;
		}
		var names = numeControl.split('.');
		if (names.length == 1) {
			if (control.is(':checkbox')) {
				control.prop("checked", record[numeControl]);
			} else {
				control.val(record[numeControl]);
			}

		} else {
			var newRecord = record[names[0]];
			var newNumeControl = numeControl.slice(names[0].length + 1);
			this.loadControl(control, newNumeControl, newRecord);
		}
	};

	this.saveControl = function(record, numeControl, val) {
		var names = numeControl.split('.');
		if (names.length == 1) {
			record[numeControl] = val;
		} else {
			var prop = names[0];
			if(typeof record[prop] === "undefined"){
				record[prop] = {};
			}
			var newRecord = record[prop];
			var newNumeControl = numeControl.slice(prop.length + 1);
			this.saveControl(newRecord, newNumeControl, val);
		}
	}

	/*
	 * Record methods
	 */
	
	this.preloadRecord = function(record, status) {
		var sts = null;
		if (status === 'view') {
			sts = '.v';
		} else if (status === 'edit') {
			sts = '.e, .ed';
		}
		$("input:text, input:checkbox, select, textarea", self.divSelector)
			.filter(sts)
			.filter('[name]')			
			.each(function() {

			var control = $(this);
			var numeControl = $(this).attr('name');
			self.loadControl(control, numeControl, record);
		});
		$("input[name=id]", this.divSelector).val(record.id);		
	};

	this.pregetRecord = function(status) {
		var sts = null;
		if (status === 'add') {
			sts = '.a, .ad';
		} else if (status === 'edit') {
			sts = '.e, .ed';
		}
		var record = {};
		$("input:text, input:hidden, input:checkbox, select, textarea", self.divSelector)
			.filter(sts)
			.filter('[name]')
			.each(function() {

				var numeControl = $(this).attr('name');
				if (numeControl) {
					var val = $(this).val();
					self.saveControl(record, numeControl, val);
			}
		});
		var x = 1;
		return record;
	};

	this.preclear = function() {
		$("input:text, input:checkbox, select, textarea", self.divSelector)
			.filter('.a, .ad')
			.filter('[name]')
			.each(function() {
				var control = $(this);
				if (control.is(':checkbox')) {
					control.prop("checked", false);
				} else {
					control.val('');
				}
		});
	};
	
	/*
	 * To be overriden
	 */
	
	this.loadRecord = function(record, status) { this.preloadRecord(record, status); };
	this.getRecord = function(status) { return this.pregetRecord(status); };
	this.clear = function(record) { this.preclear(); };
	

}