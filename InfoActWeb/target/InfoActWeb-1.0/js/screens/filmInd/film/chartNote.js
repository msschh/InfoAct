$(function() {
	var chart = $("#chartNote");

	Chart.defaults.global.defaultFontFamily = "sans-serif";
	Chart.defaults.global.defaultFontSize = 18;
	
	var dataSts3 = [];
	var dataSts4 = [];
	var dataSts8 = [];
	var dataSts9 = [];
	var dataSts15 = [];
	var labels = [];
	var sts = [];
	
	alert(noteRecenzie);
	
	$.each(recordList, function(key, value){
		var str = value.an;
		if (value.saptamana != null) {
			str = "w" + value.saptamana;
		}
		if (value.luna != null) {
			str = value.luna;
		}
		if (value.trimestru != null) {
			str = "Q" + value.trimestru;
		}
		labels.push(str);
		
		if (value.sts3 != null) {
			dataSts3.push(value.sts3);
		}
		if (value.sts4 != null) {
			dataSts4.push(value.sts4);
		}
		if (value.sts8 != null) {
			dataSts8.push(value.sts8);
		}
		if (value.sts9 != null) {
			dataSts9.push(value.sts9);
		}
		if (value.sts15 != null) {
			dataSts15.push(value.sts15);
		}
	});

	if (dataSts3.length > 0) {
		var sts3 = {
			label: 'Interviuri planificate',
			data: dataSts3,
			borderColor: '#A5D6A7',
			borderWidth: 3,
			fill: false,
			backgroundColor: '#A5D6A7'
		};
		sts.push(sts3);
	}

	if (dataSts4.length > 0) {
		var sts4 = {
			label: 'Interviuri interne',
			data: dataSts4,
			borderColor: '#81D4FA',
			borderWidth: 3,
			fill: false,
			backgroundColor: '#81D4FA'
		};
		sts.push(sts4);
	}

	if (dataSts8.length > 0) {
		var sts8 = {
			label: 'Candidati validati',
			data: dataSts8,
			borderColor: '#CE93D8',
			borderWidth: 3,
			fill: false,
			backgroundColor: '#CE93D8'
		};
		sts.push(sts8);
	}

	if (dataSts9.length > 0) {
		var sts9 = {
			label: 'Interviuri client',
			data: dataSts9,
			borderColor: '#FFE082',
			borderWidth: 3,
			fill: false,
			backgroundColor: '#FFE082'
		};
		sts.push(sts9);
	}

	if (dataSts15.length > 0) {
		var sts15 = {
			label: 'Angajari',
			data: dataSts15,
			borderColor: '#EF9A9A',
			borderWidth: 3,
			fill: false,
			backgroundColor: '#EF9A9A'
		};
		sts.push(sts15);
	}

	var dataset = {
		labels: labels,
		datasets: sts
	};

	var chartOptions = {
		scales: {
			xAxes: [{
				barPercentage: 1,
				categoryPercentage: 0.7
			}],
			yAxes: [{
				ticks : {
					beginAtZero: true
				}
			}]
		}
	};
	
	var chartType = $('#chartType').val();
	
	var myChart = new Chart(chart, {
		type: chartType,
		data: dataset,
		options: chartOptions
	});
	
	$('#chartType').change(function(){
		chartType = $('#chartType').val();
		myChart.destroy();
		myChart = new Chart(chart, {
			type: chartType,
			data: dataset,
			options: chartOptions
		});
	});
});


/*
 *  Cod luat de pe https://stackoverflow.com/questions/42585861/chart-js-increase-spacing-between-legend-and-chart pentru a pune spatiu intre legenda si chart.
 *  Pentru a modifica distanta, trebuie schimbata valoarea constantei din functia afterFit (initial 50).
 */

Chart.NewLegend = Chart.Legend.extend({
	afterFit: function() {
		this.height = this.height + 50;
	},
});

function createNewLegendAndAttach(chartInstance, legendOpts) {
	var legend = new Chart.NewLegend({
		ctx: chartInstance.chart.ctx,
		options: legendOpts,
		chart: chartInstance
	});

	if (chartInstance.legend) {
		Chart.layoutService.removeBox(chartInstance, chartInstance.legend);
		delete chartInstance.newLegend;
	}

	chartInstance.newLegend = legend;
	Chart.layoutService.addBox(chartInstance, legend);
}

// Register the legend plugin
Chart.plugins.register({
	beforeInit: function(chartInstance) {
		var legendOpts = chartInstance.options.legend;
	
		if (legendOpts) {
			createNewLegendAndAttach(chartInstance, legendOpts);
		}
	},
	beforeUpdate: function(chartInstance) {
		var legendOpts = chartInstance.options.legend;

		if (legendOpts) {
			legendOpts = Chart.helpers.configMerge(Chart.defaults.global.legend, legendOpts);

			if (chartInstance.newLegend) {
				chartInstance.newLegend.options = legendOpts;
			} else {
				createNewLegendAndAttach(chartInstance, legendOpts);
			}
		} else {
			Chart.layoutService.removeBox(chartInstance, chartInstance.newLegend);
			delete chartInstance.newLegend;
		}
	},
	afterEvent: function(chartInstance, e) {
		var legend = chartInstance.newLegend;
		if (legend) {
			legend.handleEvent(e);
		}
	}
});