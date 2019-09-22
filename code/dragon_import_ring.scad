module ring() {
    scale ([1,1.5,1]) translate ([0,-2.5,-7.2]) rotate ([0,90,90])
        difference () {
            // the ring itself is extruded from a rectangle here, but
            // could just as easily be the difference of two cylinders...
            // the inner radius has to be measured and specified here
            // in the translation: 6.6 => 13.2mm diameter
            rotate_extrude (angle=360, $fn=200)
            translate ([6.6,0,0])
                square([1,5]);
            // minus two cones to make the inner edges smoother so
            // getting the ring on and off will be easy
            cylinder(h=30, r1=0, r2=42, $fn=200);
            translate ([0,0,5])
            rotate ([180,0,0])
                cylinder(h=30, r1=0, r2=42, $fn=200);
        }
}

union () {
    translate ([15,-2,1.4]) rotate ([0,0,180]) scale ([0.04, 0.04, 0.04])
        import("Dragon_Knocker_8_Solid.stl");

    ring();
}