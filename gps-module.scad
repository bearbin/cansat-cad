module gps_module() {
    union() {
        // Main Board
        difference() {
            cube([26,36,1], center=true);
            // Mounting Holes
            translate([10.5, 15.5, 0]) {
                cylinder(h = 5, d = 3, center=true);
            }
            translate([-10.5, 15.5, 0]) {
                cylinder(h = 5, d = 3, center=true);
            }
            translate([10.5, -15.5, 0]) {
                cylinder(h = 5, d = 3, center=true);
            }
            translate([-10.5, -15.5, 0]) {
                cylinder(h = 5, d = 3, center=true);
            }
            // Data Holes
            translate([0,16.5,0]) {
                translate([-3.5, 0, 0]) {
                    cylinder(h=5, d= 0.6, center=true);
                }
                translate([3.5, 0, 0]) {
                    cylinder(h=5, d= 0.6, center=true);
                }
                translate([-1.2, 0, 0]) {
                    cylinder(h=5, d= 0.6, center=true);
                }
                translate([1.2, 0, 0]) {
                    cylinder(h=5, d= 0.6, center=true);
                }
            }
        }
        
        // Antenna
        translate([0,0,5]) {
            cube([26,26,9], center=true);
        }
        
        // Cable
        translate([0,-13,0]) {
            cube([16, 8,9], center=true);
        }
        
        // Components (front)
        translate([0,0,-2.5] ){
            cube([24, 24, 4], center=true);
        }
    }
}

gps_module();