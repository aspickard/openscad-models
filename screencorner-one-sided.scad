// Window screen corners

tolerance = 1.10;
frameWidth = 0.75 * tolerance;
frameDepth = 0.25 * tolerance;
thickness = 0.125;
//multiplier = 25.4;
multiplier = 1;
TWO_SIDED = false;
DRILL_HOLE = false;


ScreenCorner(
    frameWidth * multiplier,
    frameDepth * multiplier,
    thickness * multiplier,
    frameWidth * multiplier * 3
);

module ScreenCorner(frameWidth=3, frameDepth=1, thickness=1, socketLength=9, $fn=false) {
    center = $fn;

    totalDepth = 2 * thickness + frameDepth;
    totalWidth = 2 * thickness + frameWidth;
    totalHeight = 2 * thickness + socketLength;
    radius = thickness * 3;
    holeOffset = frameDepth * 2;

    difference() {
        union() {
            cube([totalWidth, totalHeight, totalDepth], center);
            cube([totalHeight, totalWidth, totalDepth], center);
        }
     
        translate([thickness, thickness, thickness]) {
            cube([frameWidth, totalHeight, frameDepth], center);    
        }
        translate([thickness, thickness, thickness]) {
            cube([totalHeight, frameWidth, frameDepth], center);
        }
        translate([
            TWO_SIDED ? thickness : 0,
            TWO_SIDED ? thickness : 0,
            TWO_SIDED ? totalDepth - 2*thickness : totalDepth - thickness
        ]) {
            cube([
                totalHeight,
                totalHeight,
                TWO_SIDED ? thickness : thickness * 2
            ], center); 
        }
        if (DRILL_HOLE) {
            translate([holeOffset, holeOffset, 0]) {
                cylinder(totalDepth, radius, radius, center, $fn=50);
            }
        }
    }
       
}
