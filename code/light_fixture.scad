// Some measurements of the light bulb socket. Used later to punch a hole in the
// bottom with a radius 20.5mm. Outer radius of the bottom is 40mm, which gives
// a diameter of 80mm, slightly above the outer diameter of the socket.
//
// inner D = 41mm
// outer D = 65mm (min)
// thickness = 4mm

module top() {
    union () {
        // an inverse of the bottom construction; cut in the same place
        // to make sure the decorative holes match where the top and bottom
        // meet; this could be done in a modular way rather than by copying
        // the code, but for a one-off project it was the convenient thing to
        // do
        difference () {
            cylinder(h=200, r1=100, r2=40, $fn=200);
            translate ([0,0,4]) cylinder(h=200, r1=88, r2=38, $fn=200);
            for (i = [1:32]) {
                translate ([0,0,20+5*i]) rotate ([0,0,24*i])
                scale ([0.5,0.5,1]) translate ([-500,0,0]) rotate ([0,90,0])
                    cylinder(h=1000, r1=5, r2=5, $fn=40);
            }
            cube ([500,500,200], center=true);
        }

        // add little pegs to hold the top; maybe make them fit more tightly
        // if you want them to "grip"
        for (i=[0:60:360]) {
            rotate ([0,0,i]) translate ([0,60,110]) cube([5,5,30], center=true);
        }
    }
}

module bottom() {
    difference () {
        // main cone includes "floor"; everything else is removed from it
        cylinder(h=200, r1=40, r2=100, $fn=200);

        // remove the same cone, offset up
        translate ([0,0,4]) cylinder(h=200, r1=38, r2=98, $fn=200);
        // hole for the light bulb socket; make sure not too big or small
        translate ([0,0,-5]) cylinder(h=10, r1=20.5, r2=20.5, $fn=80);
        // make holes in a pattern rotating around the center and translating up
        for (i = [1:32]) {
            translate ([0,0,20+5*i]) rotate ([0,0,24*i])
            scale ([0.5,0.5,1]) translate ([-500,0,0]) rotate ([0,90,0])
                cylinder(h=1000, r1=5, r2=5, $fn=40);
        }
        // remove part of the object; too big to print and not needed anyway
        translate ([0,0,350]) cube([500,500,500],center=true);
    }
}

// to get separate STL files, you need to comment out each of these
// in turn and leave only the top or only the bottom!
top();
bottom();
