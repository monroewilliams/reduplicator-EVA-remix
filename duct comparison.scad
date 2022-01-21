// This is just a way for me to overlay the 2.3 and 2.4 ducts to see where they differ.

translate([15, -9, 0])
rotate([-90, 0, 0])
color("blue")
import("eva-main-2.3.0/docs/addons/fan-ducts/stls/Duct v2.1 Straight.stl");
//import("eva-main-2.3.0/docs/addons/fan-ducts/stls/Duct v2.1 Straight Low.stl");
//import("eva-main-2.3.0/docs/addons/fan-ducts/stls/Duct v2.1 Straight Wide.stl");
//import("eva-main-2.3.0/docs/addons/fan-ducts/stls/Duct v2.1 Straight Wide High.stl");

translate([0, -7, 0])
color("red", 0.5)
//import("eva-main-2.4.2/docs/addons/layer_cooling/stls/TriHorn Duct Default.stl");
import("eva-main-2.4.2/docs/addons/layer_cooling/stls/TriHorn Duct High Narrow.stl");
//import("eva-main-2.4.2/docs/addons/layer_cooling/stls/TriHorn Duct Wide Low.stl");
