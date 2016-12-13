// Plotter adapter for the KOH-I-NOOR Toison D'Or pencil
//
// Modified by Sasha Kovar <sasha-thing@arcocene.org>
// from a design by Brian Boucheron <brian@boucheron.org>

include <common.scad>;

body_outer_diameter = 11.5; // outer diameter of the main body
body_inner_diameter = 9;
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

    translate([0,0,2])
    union() {
        translate([0,0,-20]) cylinder(d=body_inner_diameter, h=34, $fn=80);
        intersection() {
            translate([0,0,-5.5]) cylinder(d=body_inner_diameter, h=24, $fn=80);
            translate([0,0,14]) cylinder(d1=body_inner_diameter, d2=0, h=16, $fn=80);
        }
    }
}
