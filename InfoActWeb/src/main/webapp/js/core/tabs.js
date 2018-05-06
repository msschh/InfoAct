$().ready(function() {
	showLastTab();
});

function showLastTab() {
	var screenStatus = $('#screenStatus').val();
	if(screenStatus !== 'view' && screenStatus !== 'edit') {
		$('#tabHeader button').first().click();
		return;
	}
	var lastTab = getLastTab();
	if (lastTab == null) {
		$('#tabHeader button').first().click();
		return;
	}
	lastTab.click();
}

function getLastTab() {
	var ls = $('#ls').val();
	if(!ls) { return null; }
	var screenCode = $('#screenCode').val();
	if(!screenCode) { return null; }
	var activeTabId = sessionStorage[screenCode + "-activeTab"];
	if(!activeTabId) { return null; }
	if (!$('#' + activeTabId).length) { return null; }
	var activeTab = $('#' + activeTabId);
	return activeTab;
}

function openTab(sender, tabId) {
	$('#tabHeader button').removeClass('active');
	$('#' + sender.id).addClass('active');
	$('.tab').css("display", "none");
	$('#' + tabId).css("display", "block");
	var screenCode = $('#screenCode').val();
	sessionStorage[screenCode + "-activeTab"] = sender.id;
}
