module reduplicator_backplate()
{
    rotate([-90, 0, 0])
    translate([274.15, -209, 0])
    color("red")
    import("ReDuplicator-MK3x/STLs Reduplicator Core Parts/X Carriage Universal Rear Bearing Plate MK3 V3.stl", convexity=6);
}

module eva_cartesian_backplate()
{
    color("blue")
    import("eva-main/stls/back_cartesian.stl", convexity=6);
}

module aero_face()
{
    color("blue")
    import("eva-main/stls/aero_face.stl", convexity=6);
}

module lm8_cutout()
{
    $fa=4;
    $fs=0.1;
    rotate([0, 90, 0])
    cylinder(h=100, d=15.3, center=true);
}

// eva mounting hole pattern
module eva_hole()
{
    $fa=4;
    $fs=0.1;
    rotate([90, 0, 0])
    cylinder(h=100, d=3.3, center=true);
}

module eva_mount()
{
    translate([-13, 0, -24.5])
    eva_hole();
    translate([13, 0, -24.5])
    eva_hole();
    translate([17.05, 0, 23.5])
    eva_hole();
    translate([-17.05, 0, 23.5])
    eva_hole();
}

module bottom_cutout()
{
    translate([0, 0, -50 + 3 - (24.5 - (3.3/2))])
    cube([45, 100, 100], center=true);

}

module belt_section()
{
    translate([0, 10, 10])
    cube([60, 20, 20], center=true);    
}

module upper_hole_plug()
{
    // top piece for support
    hull()
    {
        translate([-11, 17, 21])
        cube([22, 27.15 - 17, 7.5]);        
    
        translate([-22, 27, 21])
        cube([44, 27.15 - 27, 7.5]);        
    }
    
    translate([-6.25, 0, 9])
    cube([11.5, 27.15, 12]);        

    // middle piece that plugs the old holes
    difference()
    {
        translate([-22, 0, 8])
        cube([44, 27.15, 7.5]);    
    
        translate([-10.5, 0, 9])
        cube([20, 28, 12]);        
    }
    
    difference()
    {
        // bottom piece for support
        translate([-17.5, 15, 2])
        cube([35, 27.15 - 15, 7]);        
        
        // relief holes for bottom adjuster
        
        {
            $fa=4;
            $fs=0.1;
            translate([13.45, 20.70, 0])
            cylinder(h=100, d=3.5, center=true);
            translate([-13.4, 20.70, 0])
            cylinder(h=100, d=3.5, center=true);
        }
    }
}

module bearing_cutouts()
{
    // The two bearings are on 45.15mm centers
    translate([0, 9.85, -10.25])
    {
        lm8_cutout();

        translate([0, 0, 45.15])
        lm8_cutout();

    }
}

module belt_cutouts()
{
    difference()
    {
        translate([-29.95, 2, 0])
        cube([59.9, 12.235, 21]);    
        
        // Mask off some structures we don't want to cut out
        union()
        {
            translate([-5, 0, 7.5])
            cube([10, 27.15, 15]);        

            translate([10, 0, 7.5])
            cube([10, 27.15, 8]);        

            translate([-20, 0, 7.5])
            cube([10, 27.15, 8]);        

            reduplicator_backplate();
        }
    }
    
    // cutouts for clearance above the slots    
    for(i = [1, -1])
    scale([i, 1, 1])
    {
        translate([5, 14, 14])
        cube([25, 20, 7]);
        translate([5, 14, 9])
        cube([4, 20, 13]);
    }

    
}

union()
{
    // The original ReDuplicator backplate, with some cuts
    difference()
    {
        union()
        {
            reduplicator_backplate();
            upper_hole_plug();
        }
        
        translate([-50, 27.15, -75])
        cube([100, 100, 100]);

        bottom_cutout();
        eva_mount();
    }

    difference()
    {
        // The mount for the fan duct on bottom_mgn12_aero is recessed 18mm from the front face.
        // The entire bottom_mgn12 piece is 27.15mm front to back.
        translate([0, 27.15, 0])
        eva_cartesian_backplate();
    }

        
    aero_face();
    
    if(0)
    difference()
    {
        union()
        {
            hull()
            {
                translate([-29.9, 0, 3 - (24.5 - (3.3/2))])
                cube([59.8, 20, 50.5]);
    
                translate([-22, 0, 3 - (24.5 - (3.3/2))])
                cube([44, 27.15, 48.5]);
            }
            
            translate([-41.8, 0, -21])
            cube([19.25, 6.75, 3]);
        }
        bearing_cutouts();
        belt_cutouts();
        eva_mount();
    }
    
    
//    belt_section();
    
    
    // Delete the piece above the extruder
//    translate([-100, 40, 1.2])
//    cube([69.08, 80, 44.1]);
    
    // Delete the entire shelf under the cooling block
//    translate([-100, 0, 1.2])
//    cube([69.08, 40, 44.1]);

    // delete the shelf overhang that's likely to droop
//    translate([-100, 0, 2.8])
//    cube([58, 40, 44.1]);
    

}