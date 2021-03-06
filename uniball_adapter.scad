// Plotter pen adapter for uni-ball gel impact pens
//
// Modified by Sasha Kovar <sasha-thing@arcocene.org>
// from a design by Brian Boucheron <brian@boucheron.org>

include <common.scad>;

body_outer_diameter = 11.5; // outer diameter of the main body
body_inner_diameter = 6; // inner diameter of the main body
body_height = 13.5;

translate([0,0,15]) 
difference() {
    union() {
        band();
        cylinder(r=body_outer_diameter/2, h=body_height + 5, $fn=80);
        translate([0,0,-15]) cylinder(r=body_outer_diameter/2, h=body_height + 5, $fn=80);
    }

    translate([0,0,-25]) cylinder(r=body_inner_diameter/2, h=50, $fn=80);
    translate([0,0,body_height]) cylinder(r=body_inner_diameter*.7, h=6, $fn=80);
}
