union () {
    // Import the STL file and place it appropriately.
    translate ([-25,-37.2,10])
    rotate ([0,-90,0])
    rotate ([0,0,90])
    scale ([0.1,0.1,0.1])
        import("Dragon_Knocker_8_Solid.stl");

    // A simple bracelet.
    difference () {
        // From a main cylinder...
        cylinder(h=30, r1=23, r2=23, $fn=200);
        // Remove the inside...
        translate ([0,0,-5]) cylinder(h=40, r1=21, r2=21, $fn=200);
        // Then also make a few decorative "holes"...
        for (i=[30,150,230,310]) {
            rotate ([0,0,i]) translate ([0,0,10]) rotate ([90,0,0])
                cylinder(h=30, r1=0, r2=6, $fn=100);
            rotate ([0,0,i]) translate ([0,0,20]) rotate ([90,0,0])
                cylinder(h=30, r1=0, r2=6, $fn=100);
        }
        // Remove a round "outer shape" so the slot becomes round
        difference () {
            // A cube...
            translate ([25,0,15]) rotate ([0,0,45])
                cube([25,25,40], center=true);
            // minus two cylinders.
            translate ([18.4,-12,-7]) cylinder(h=50,r=1.5,$fn=40);
            translate ([18.4,12,-7]) cylinder(h=50,r=1.5,$fn=40);
        }
        // Also remove two cones to cut away the bracelet's inner ring edge.
        cylinder(h=100, r1=0, r2=71, $fn=100);
        translate ([0,0,-70]) cylinder(h=100, r1=71, r2=0, $fn=100);
    }
}
