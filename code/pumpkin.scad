// git clone git@github.com:openscad/scad-utils.git
// git clone git@github.com:openscad/list-comprehension-demos.git
// cp list-comprehension-demos/sweep.scad <MYPROJECTDIR>

use <scad-utils/transformations.scad>
use <scad-utils/shapes.scad>
use <sweep.scad>

module pumpkin_body() {
    union () {
        for (angle = [0:40:360])
            rotate ([0,0,angle]) translate ([-16,0,0]) 
                sphere(20, $fn=50);
    }
}

module one_leaf_part() {
    translate ([6,0,0]) intersection () {
        cylinder(20,10,10);
        translate ([-12,0,0]) cylinder(20,10,10);
    }
}

module pumpkin_leaf() {
    translate ([0,19,0]) intersection () {
        // Three leaf parts...
        translate ([0,-5,0]) rotate ([90,0,0]) union () {
            scale ([1.5,1.2,1]) one_leaf_part();
            translate ([6,3,0]) rotate ([0,0,45]) one_leaf_part();
            translate ([-6,3,0]) rotate ([0,0,-45]) one_leaf_part();
        }
        // Intersect with a hollow sphere to cut out a pumpkin leaf.
        difference () {
            sphere(20);
            sphere(18);
        }
    }
}

module pumpkin_stem() {
    pathstep = 1;
    height = 100;

    // Star-shaped polygon which will be the base for extrusion.
    shape_points = [[-2,-2],[-1.8,0],
                    [-2,2],[0,1.8],
                    [2,2],[1.8,0],
                    [2,-2],[0,-1.8]];

    // Function to describe how the extrusion shape will shrink
    // on the way along the stem.
    function linear_down(x) = 3 - 2.5 * x;

    // Black magic for sweep below :).
    path_transforms = [for (i=[0:pathstep:height/2]) 
                       let(t=i/height) 
                            rotation([0,120*(t)*(t)*(t+0.5)*(t+0.5),0])*
                            translation([0,0,i])*
                            scaling([linear_down(t),linear_down(t),i])*
                            rotation([0,0,720*t])
                      ];
    sweep(shape_points, path_transforms);
}

module pumpkin() {
    union () {
        pumpkin_body();
        translate ([0,0,10]) scale ([0.5,0.5,0.5]) pumpkin_stem();
        // Do not add the leaf here as it will be cut by the cone
        // later. Rather add it after intersecting with the cone.
        // translate ([-3,-8,26]) rotate ([-75,0,-45])
        //     pumpkin_leaf();
    }
}

// Partitioning code for pumpkin. A cone and its inverse.

module top_cone() {
    translate ([0,0,5]) cylinder(150,0,100);
}

module bottom_inverse_cone() {
    difference () {
        cube([200,200,200],center=true);
        top_cone();
    }
}

// Printable top and bottom.

module pumpkin_top_part() {
    union () {
        intersection () {
            pumpkin();
            top_cone();
        }
        translate ([-3,-8,26]) rotate ([-75,0,-45]) pumpkin_leaf();
   }
}

module pumpkin_bottom_part() {
    intersection () {
        difference () {
            pumpkin();
            // Remove a smaller version from the inside so we use less
            // material.
            scale ([0.75,0.75,0.7]) pumpkin_body();
        }
        bottom_inverse_cone();
    }
}

// Comment out the one you are *not* printing.
// These printable parts are meant to be separate.
// If you want to print a whole pumpkin, then you
// do not need the partitioning cone above.

pumpkin_top_part();
pumpkin_bottom_part();
