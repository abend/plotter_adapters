// Plotter pen adapter for Copic Multiliner 0.8mm
//
// Modified by Sasha Kovar <sasha-thing@arcocene.org>
// from a design by Brian Boucheron <brian@boucheron.org>

include <common.scad>;

body_outer_diameter = 11.5;
body_inner_diameter = 9.85;
body_inner_diameter_2 = 10.25;

difference() {
    union() {
        band();
        cylinder(r=body_outer_diameter/2, h=16, $fn=80);
    }

    translate([0,0,-25]) cylinder(d=body_inner_diameter, h=50, $fn=80);
    translate([0,0,0]) cylinder(d=body_inner_diameter_2, h=2, $fn=80);
}
