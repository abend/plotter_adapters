// Measurements and routines common across adapters.

band_full_thickness = 1.25;    // thickest point of the band
band_full_diameter = 16.5;  // diameter at widest point of band

// profile = [
//     [0,0],
//     [band_edge_diameter / 2, 0],
//     [band_full_diameter / 2, (band_full_thickness - band_edge_thickness) / 2],
//     [band_full_diameter / 2, band_full_thickness - ((band_full_thickness - band_edge_thickness) / 2)],
//     [band_edge_diameter / 2, band_full_thickness],
//     [0,band_full_thickness],
// ];

profile = [
    [0,0],
    [band_full_diameter / 2, 0],
    [band_full_diameter / 2, band_full_thickness],
    [0,band_full_thickness],
];

module band() {
    rotate_extrude($fn=80) polygon(points=profile);
}
