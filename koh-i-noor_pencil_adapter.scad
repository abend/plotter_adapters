// plotter adapter for the KOH-I-NOOR Toison D'Or pencil

// created January, 2014 by Brian Boucheron <brian@boucheron.org>

band_full_thickness = 2;    // thickest point of the band
band_edge_thickness = 0.6;  // thinnest point of the band
band_full_diameter = 16.5;  // diameter at widest point of band
band_edge_diameter = 15;    // diameter where band starts to angle in


// sharpie outer diameter measured at 10.64mm
// plotter outer diameter measured at 11.50mm
body_outer_diameter = 11.5; // outer diameter of the main body
body_inner_diameter = 8.3;
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

	translate([0,0,2])
	union() {
		translate([0,0,-20]) cylinder(d=body_inner_diameter, h=34, $fn=6);
		intersection() {
			translate([0,0,-5.5]) cylinder(d=body_inner_diameter, h=24, $fn=6);
			translate([0,0,14]) cylinder(d1=body_inner_diameter, d2=0, h=16, $fn=80);
		}
	}

	//translate([0,0,-9]) #cube([20,20,35], true);
}
