//translate([21.5, 33, -24.75])
//import("eva-main-2.3.0/docs/drives/aero/stls/aero_face.stl");

$fa = 2;
$fs = 0.01;

module peg(x, y)
{
    translate([x, y])
    circle(d=2);
}

translate([-2, 18, 0])
rotate([90, 0, 0])
translate([0, 16, 0])
linear_extrude(4)
{
    difference()
    {
        offset(delta = 3, chamfer = true) offset(-3)
        square([20, 32], center = true);
        offset(delta = 1.5, chamfer = true) offset(-1.5)
        square([14, 26], center = true);
//        circle(d=25);
//        circle(d=19);
    }
}

difference()
{
    linear_extrude(4)
    {
        hull()
        {
            peg(-3, -3);
            peg(5, -3);
            peg(5, 17);
            peg(-9, 12);
            peg(-9, 17);
        }
    }
    
    // Attachment holes
    {
        translate([0, 10, 0])
        {
            translate([0, 0, -1])
            cylinder(h = 20, d = 3.3);
            translate([0, 0, 2])
            cylinder(h = 10, d = 6);
        }
        translate([0, 0, -1])
        cylinder(h = 20, d = 3.3);
        translate([0, 0, 2])
        cylinder(h = 10, d = 6);

    }
}