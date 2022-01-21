

module bottom_mgn12()
{
    rotate([0, 0, 180])
    translate([0, -19, -4.1])
    import("eva-main-2.4.2/docs/drives/bowden/stls/bottom_mgn12_short_duct.stl", convexity=6);
}

// The 2.3 aero bottom piece, for comparison:
if(0)
{   
    // These two statements overlay them
//    translate([0, 31, 0])
//    rotate([0, 0, 180])
    translate([0, 35, 27.15])
    rotate([-90, 0, 0])
    import("/Volumes/monroe/home/Documents/3D printer/reduplicator-EVA-remix/eva-main-2.3.0/docs/drives/aero/stls/bottom_mgn12_aero.stl");
}

union()
{
    bottom_mgn12();

    // The bottom piece is 27.15 front to back, and the Aero duct mount is 18mm from the front.
    linear_extrude(27.15 - 18)
    intersection()
    {
        projection()
        bottom_mgn12();
        
        translate([-25, 0])
        square([50, 20]);
    }
}
