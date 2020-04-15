function drawWind(dir, speed) {
    var gaugeWind = new RadialGauge({
        renderTo: 'Wind',
        width: 150, // Gauge size
        height: 150, // Gauge size
        units: speed + "m/s", // Center text
        colorUnits: "4d4d4d", // Center colour
        startAngle: 180, // Gauge start angle
        ticksAngle: 360, // Gauge circumferance
        colorPlate: "#fff", // Colour background dial 
        colorNumbers: "4d4d4d", // Colour major ticks
        needleType: "line", // Type of indicator
        needleStart: 60, // Start of indicator
        needleEnd: 99, // End of indicator
        needleWidth: 4, // Size of indicator
        needleCircleSize: 5, // Center circle
        needleCircleOuter: false,
        needleShadow: false, // Shadow on indicator
        colorNeedle: "rgba(0, 115, 177, 1)", // Needle colour
        colorNeedleEnd: "rgba(0, 115, 177, .9)", // Ens of needle colour
        colorNeedleShadowDown: "#222", // Indicator shadow
        colorNeedleCircleOuter: false, // Center circle
        colorNeedleCircleOuterEnd: "#4d4d4d", // Center circle colour
        colorMajorTicks: "4d4d4d", // Major tick colour
        colorMinorTicks: "4d4d4d", // Minor tick colour
        minValue: 0, // Value range min 
        maxValue: 360, // Value range max
        majorTicks: ["N", "NE", "E", "SE", "S", "SW", "W", "NW", "N"], // Key values
        minorTicks: "22", // Divisions
        strokeTicks: false,
        highlights: true,
        highlightsWidth: 2,
        numbersMargin: 2,
        animation: true,
        animationRule: "linear",
        valueBox: false,
        borders: true,
        borderInnerWidth: 0,
        borderMiddleWidth: 0,
        borderShadowWidth: 0,
        colorBorderOuter: "#ccc",
        colorBorderOuterEnd: "#ccc",
        value: dir,
        valueTextShadow: false,
        animateOnInit: false,
        animatedValue: false,
        fontValueSize: 40,
        fontNumbersSize: 27,
        fontUnitsSize: 40,
    });
    gaugeWind.draw();
}