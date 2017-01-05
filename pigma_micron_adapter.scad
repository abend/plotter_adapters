// Plotter pen adapter for Pigma Micron pens
//
// Modified by Sasha Kovar <sasha-thing@arcocene.org>
// from a design by Brian Boucheron <brian@boucheron.org>

include <common.scad>;

body_outer_diameter = 11.5;
body_inner_diameter = 9;
body_height1 = 18;
body_height2 = 19;

module top(clip) {
	difference() {
		cylinder(r=body_outer_diameter/2, h=body_height2, $fn=80);
		cylinder(r=body_inner_diameter/2, h=50, $fn=80);
		translate([0,0,3]) cutout();
		if (clip) {
			translate([-5, -5, 18]) cube([10,10,2]);
		}
	}
}

module cutout() {
	difference() {
		cylinder(r=body_outer_diameter, h=20, $fn=80);
		cylinder(r1=body_outer_diameter, r2=0, h=20, $fn=80);
	}
}

union() {
	difference() {
		union() {
			band();
			cylinder(r=body_outer_diameter/2, h=body_height1, $fn=80);
		}

		translate([0,0,-10]) cylinder(r=body_inner_diameter/2, h=50, $fn=80);
		
		// translate([0,0,-10]) {
		// 	top();
		// }
	}
}
