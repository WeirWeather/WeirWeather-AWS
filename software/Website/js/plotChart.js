function plotChart(id, weatherType, metric) {
    
    console.log("Calls function");

    console.log(id);
    console.log(weatherType);
    
    var seriesOptions = [],
        seriesCounter = 0,
        names = ['AWS', 'ExtAPI'];

    /**
    * Create the chart when all data is loaded
    * @returns {undefined}
    */
    function createChart() {

        new Highcharts.stockChart(id, {

            title: {
                text: weatherType.replace(/_/g, ' ') //Replaces _ with a space
            },

            rangeSelector: {
                selected: 4
            },

            yAxis: {
                labels: {
                    formatter: function () {
                        var compare = this.axis.series[0].userOptions.compare || 'none';
                        return (compare !== 'none' && this.value > 0 ? '' : '') + this.value +
                            { none: metric, value: metric}[compare];
                    }
                },
                plotLines: [{
                    value: 0,
                    width: 2,
                    color: 'silver'
                }]
            },

            plotOptions: {
                series: {
                    compare: 'none'
                }
            },

            tooltip: {
                pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({point.change}%)<br/>',
                valueDecimals: 2,
                split: true
            },

            series: seriesOptions
        });
    }

    function success(data) {
        console.log(data);
        var name = this.url.match(/(AWS|ExtAPI)/)[0];
        var i = names.indexOf(name);
        seriesOptions[i] = {
            name: name.replace(/Ext/g, 'External '),  //Replaces _ with space
            data: data
        };
        
        // As we're loading the data asynchronously, we don't know what order it
        // will arrive. So we keep a counter and create the chart when all the data is loaded.
        seriesCounter += 1;

        if (seriesCounter === names.length) {
            createChart();
        }
    }

    Highcharts.getJSON(
        './php/Get_Historical_Data.php?weatherType=' + weatherType + '&table=AWS',
        success
    );
    Highcharts.getJSON(
        './php/Get_Historical_Data.php?weatherType=' + weatherType + '&table=ExtAPI',
        success
    );
}