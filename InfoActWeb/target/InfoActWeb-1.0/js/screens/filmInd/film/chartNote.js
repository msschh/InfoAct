$(function() {
	var chart = $("#chartNote");

	Chart.defaults.global.defaultFontFamily = "sans-serif";
	Chart.defaults.global.defaultFontSize = 18;
	
	var note = [];
	note.push(noteRecenzie[0].nrNote1);
	note.push(noteRecenzie[0].nrNote2);
	note.push(noteRecenzie[0].nrNote3);
	note.push(noteRecenzie[0].nrNote4);
	note.push(noteRecenzie[0].nrNote5);
	note.push(noteRecenzie[0].nrNote6);
	note.push(noteRecenzie[0].nrNote7);
	note.push(noteRecenzie[0].nrNote8);
	note.push(noteRecenzie[0].nrNote9);
	note.push(noteRecenzie[0].nrNote10);
	
	var dataset = {
		labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
		datasets: [{
			label: 'Note',
			data: note,
			borderColor: '#81D4FA',
			borderWidth: 3,
			fill: false,
			backgroundColor: '#81D4FA'
		}]
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
	
	var myChart = new Chart(chart, {
	    type: 'bar',
		data: dataset,
		options: chartOptions
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