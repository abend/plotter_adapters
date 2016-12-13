// Plotter pen adapter for uni-ball 207 Signo
//
// Modified by Sasha Kovar <sasha-thing@arcocene.org>
// from a design by Brian Boucheron <brian@boucheron.org>

include <common.scad>;

body_outer_diameter = 11.5; // outer diameter of the main body
body_inner_diameter = 6.5; // inner diameter of the main body
body_height = 13.5;

translate([0,0,33.5]) 
rotate([180,0,0])
translate([0,0,15]) 
difference() {
    union() {
        band();
        cylinder(r=body_outer_diameter/2, h=body_height + 5, $fn=80);
        translate([0,0,-15]) cylinder(r=body_outer_diameter/2, h=body_height + 5, $fn=80);
    }

    translate([0,0,-15]) cylinder(r=body_inner_diameter/2, h=24, $fn=80);
    translate([0,0,0]) cylinder(r=4/2, h=25, $fn=80);
}
