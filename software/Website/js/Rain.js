function drawRain(rain) {
    var gaugeRain = new LinearGauge({
        renderTo: 'Rain',
        width: 150,
        height: 150,
        barWidth: 60,
        barLength: 80,
        colorBar: "#fff",
        colorBarProgress: "rgba(0, 115, 177, 1)",
        colorBarStroke: "#222",
        borderRadius: false,
        borders: false,
        barBeginCircle: false,
        colorUnits: "#000",
        minorTicks: 5,
        majorTicks: ["0", "10", "20", "30", "40", "50"],
        value: rain,
        fontNumbersSize: 16,
        numberSide: "right",
        tickSide: "right",
        needleType: "line",
        needleWidth: 5,
        needleSide: "right",
        colorNeedleShadowDown: "#222",
        colorNeedle: "rgba(0, 115, 177, 1)", // Needle colour
        colorNeedleEnd: "rgba(0, 115, 177, .9)", // Ens of needle colour
        animation: false,
        animationRule: "linear",
        animationDuration: 750,
        barStrokeWidth: 2,
        valueBoxBorderRadius: 5,
        valueTextShadow: false,
        valueBox: false,
        fontNumbersSize: 20,
    });
    gaugeRain.draw();
}