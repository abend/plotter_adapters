// Plotter pen adapter for a graphite stick
//
// Modified by Sasha Kovar <sasha-thing@arcocene.org>
// from a design by Brian Boucheron <brian@boucheron.org>

include <common.scad>;

body_outer_diameter = 11.6; // outer diameter of the main body
body_inner_diameter = 9; // inner diameter of the main body

translate([0,0,37])
rotate(a=[0,180,0]) {
    difference() {
        union() {
            translate([0,0,27.3]) band();
            translate([0,0,27.3 - 11]) cylinder(r=body_outer_diameter/2, h=20.7, $fn=50);
        }
        cylinder(r=body_inner_diameter/2, h=50, $fn=50);
    }
}
