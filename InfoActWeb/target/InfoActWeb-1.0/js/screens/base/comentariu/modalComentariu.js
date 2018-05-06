modalComentariu = new ModalScreen('modalComentariu');
modalComentariu.codEntitate = 'comentariu';

modalComentariu.clear = function() {
	this.preclear();
};

modalComentariu.loadRecord = function(record, status) {
	this.preloadRecord(record, status);
};

modalComentariu.getRecord = function (status) {
	return this.pregetRecord(status);
};
