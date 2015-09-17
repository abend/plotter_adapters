// plotter pen adapter for Sharpie Fine Point markers
// created January, 2014 by Brian Boucheron <brian@boucheron.org>

band_full_thickness = 2;    // thickest point of the band
band_edge_thickness = 0.6;  // thinnest point of the band
band_full_diameter = 16.5;  // diameter at widest point of band
band_edge_diameter = 15;    // diameter where band starts to angle in


// sharpie outer diameter measured at 10.64mm
// plotter outer diameter measured at 11.50mm
body_outer_diameter = 11.6; // outer diameter of the main body
body_inner_diameter = 9; // inner diameter of the main body

profile = [
    [0,0],
    [band_edge_diameter / 2, 0],
    [band_full_diameter / 2, (band_full_thickness - band_edge_thickness) / 2],
    [band_full_diameter / 2, band_full_thickness - ((band_full_thickness - band_edge_thickness) / 2)],
    [band_edge_diameter / 2, band_full_thickness],
    [0,band_full_thickness],
    // end body
];

translate([0,0,37])
rotate(a=[0,180,0]){

    difference() {

        union() {
            translate([0,0,27.3])
            rotate_extrude($fn=50)
            polygon(points=profile);
            translate([0,0,27.3-11])
            cylinder(r=body_outer_diameter/2, h=20.7, $fn=50);
        }

        cylinder(r=body_inner_diameter/2, h=50, $fn=50);

    }
}
