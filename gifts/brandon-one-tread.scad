plate_width = 800;
plate_height = 300;
plate_depth = 20;
plate_border_depth = 30;
plate_border_width = 30;
date_text_size = 50;
date_text_offset = -20;
label_text_size = 80;
text_height = 10;
    
union() {
    difference() {
        cube([
            plate_width + plate_border_width,
            plate_height + plate_border_width,
            plate_depth + plate_border_depth
        ], true);
        translate([0, 0, plate_depth]) {
            cube([
                plate_width,
                plate_height,
                plate_depth
            ], true);
        }
    }
    linear_extrude(text_height + plate_depth / 2) {
        translate([0, 0, 0]) {
            text("ONE TREAD", label_text_size, halign="center");
        }
        translate([0, -date_text_size + date_text_offset, 0]) {
            text("02/05/2021", date_text_size, halign="center");
        }
    }
}