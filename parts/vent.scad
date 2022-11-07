cover_x = 267; // 266.7mm, 10.5 inches
cover_y = 64; // 63.5mm, 2.5 inches
cover_z = 4;

vent_radius = 115 / 2;
vent_depth = 30;
vent_offset_z = -cover_y / 2;
vent_offset_y = (cover_z + vent_depth) / 2;
vent_thickness = 2;

difference() {
    union() {
        // Back cover
        cube([cover_x, cover_z, cover_y], true);
        
        // Vent duct
        translate([0, vent_offset_y, vent_offset_z]) {
            rotate([90, 0, 0]) {
                difference() {
                    // Outer
                    cylinder(vent_depth, vent_radius, vent_radius, true);
                    // Inner cutout
                    cylinder(vent_depth, vent_radius - vent_thickness * 2, vent_radius - vent_thickness * 2, true);
                }
            }
        }
    }
    
    // Vent hole cutout from cover
    translate([0, 0, vent_offset_z]) {
        rotate([90, 0, 0]) {
            // Inner cutout, not translated for base plate thickness
            cylinder(vent_depth,vent_radius - vent_thickness * 2, vent_radius - vent_thickness * 2, true);
        }
    }
}