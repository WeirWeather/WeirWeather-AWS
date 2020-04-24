Highcharts.getJSON('Wind.JSON', function(data) {
    Highcharts.stockChart('W', {
        rangeSelector: {
            selected: 1
        },
        title: {
            text: 'Wind'
        },
        series: [{
            name: 'Wind',
            data: data,
            type: 'areaspline',
            threshold: null,
            tooltip: {
                valueDecimals: 2
            },
            fillColor: {
                linearGradient: {
                    x1: 0,
                    y1: 0,
                    x2: 0,
                    y2: 1
                },
                stops: [
                    [0, Highcharts.getOption().colors[0]],
                    [1, Highcharts.color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                ]
            }
        }]
    });
});