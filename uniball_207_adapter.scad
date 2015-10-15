// plotter pen adapter for uni-ball 207 signo

// created January, 2014 by Brian Boucheron <brian@boucheron.org>

band_full_thickness = 2;    // thickest point of the band
band_edge_thickness = 0.6;  // thinnest point of the band
band_full_diameter = 16.5;  // diameter at widest point of band
band_edge_diameter = 15;    // diameter where band starts to angle in


// sharpie outer diameter measured at 10.64mm
// plotter outer diameter measured at 11.50mm
body_outer_diameter = 11.5; // outer diameter of the main body
body_inner_diameter = 6.5; // inner diameter of the main body
body_height = 13.5;

profile = [
    [0,0],
    [band_edge_diameter / 2, 0],
    [band_full_diameter / 2, (band_full_thickness - band_edge_thickness) / 2],
    [band_full_diameter / 2, band_full_thickness - ((band_full_thickness - band_edge_thickness) / 2)],
    [band_edge_diameter / 2, band_full_thickness],
    [0,band_full_thickness],
    // end body
];

translate([0,0,33.5]) 
rotate([180,0,0])
translate([0,0,15]) 
difference() {
	union() {
		rotate_extrude($fn=80) polygon(points=profile);
		cylinder(r=body_outer_diameter/2, h=body_height + 5, $fn=80);
		translate([0,0,-15]) cylinder(r=body_outer_diameter/2, h=body_height + 5, $fn=80);
	}

	#translate([0,0,-15]) cylinder(r=body_inner_diameter/2, h=24, $fn=80);
	#translate([0,0,0]) cylinder(r=4/2, h=25, $fn=80);
}
