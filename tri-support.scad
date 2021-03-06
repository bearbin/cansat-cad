use <gps-module.scad>;

module tri_support() {
    union() {
        translate([0, 0, 41]) circle_support();
        translate([0, 0, -41]) circle_support();
        circle_support();
        resize([0, 0, 92], auto=[false, false, true]) wside_seg();
    }
}



module circle_support() {
    difference() {
        cylinder(h=12, d=65.5, center=true, $fn=120);
        union() {
            cylinder(h=25, d=62, center=true, $fn=3);
            rotate(a=2) cylinder(h=25, d=61.5, center=true, $fn=3);
            rotate(a=-2) cylinder(h=25, d=61.5, center=true, $fn=3);
            rotate(a=4) cylinder(h=25, d=61.5, center=true, $fn=3);
            rotate(a=-4) cylinder(h=25, d=61.5, center=true, $fn=3);
            cylinder(h=25, d=56, center=true, $fn=120);
        }
    }
}

module tri_circle() {
    difference() {
        union() {
            // Main Body
            resize ([0, 0, 88], auto=[false, false, true]) circle_support();
            // Mounting Flange
            translate([0, 0, 41]) {
                difference() {
                    cylinder(h=6, d=65.5, center=true, $fn=120);
                    translate([0,0,-4])  cylinder(h=12, d1=65.5, d2=46, center=true, $fn=120);
                    cylinder(h=6, d=46, center=true, $fn=120);
                }
            }
        }
        // Side vent holes
        union() {
            translate([16, 27.7, 21]) rotate(a=[0,90,60]) cylinder(h=20, d=36, center=true, $fn=120);
            translate([16, 27.7, -21]) rotate(a=[0,90,60]) cylinder(h=20, d=36, center=true, $fn=120);
            rotate(a=[0,0,120]) {
                translate([16, 27.7, 21]) rotate(a=[0,90,60]) cylinder(h=20, d=36, center=true, $fn=120);
                translate([16, 27.7, -21]) rotate(a=[0,90,60]) cylinder(h=20, d=36, center=true, $fn=120);
            }
            rotate(a=[0,0,-120]) {
                translate([16, 27.7, 21]) rotate(a=[0,90,60]) cylinder(h=20, d=36, center=true, $fn=120);
                translate([16, 27.7, -21]) rotate(a=[0,90,60]) cylinder(h=20, d=36, center=true, $fn=120);
            }
        }
        
    }
}        

module iside_seg() {
    intersection() {
        circle_support();
        translate([30, 0, 0]) {
            cube([20, 20, 20], center=true);
        }
    }
}

module wside_seg() {
    iside_seg();
    rotate(a=120) iside_seg();
    rotate(a=-120) iside_seg();
}

tri_circle();