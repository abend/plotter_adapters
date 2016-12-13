// Plotter pen adapter for a Copic brush pen
//
// Modified by Sasha Kovar <sasha-thing@arcocene.org>
// from a design by Brian Boucheron <brian@boucheron.org>

include <common.scad>;

body_outer_diameter = 11.5; // outer diameter of the main body
body_inner_diameter = 9.75; // inner diameter of the main body

difference() {
    union() {
        band();
        cylinder(r=body_outer_diameter/2, h=16, $fn=80);
    }
    translate([0,0,-25]) cylinder(r=body_inner_diameter/2, h=50, $fn=80);
}
