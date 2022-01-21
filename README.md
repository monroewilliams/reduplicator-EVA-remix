# Reduplicator/EVA-3D remix

Some time ago, I rebuilt my Monoprice Maker Select V2 using OmNomNomagon's excellent [ReDuplicator](https://github.com/OmNomNomagon/ReDuplicator-MK3x) guide. 

Overall I've been very pleased with the way it came out, but there are a few things about the way the carriage, hotend, and part cooling duct fit together that ended up being ongoing annoyances. 

After the rebuild, I converted from the original hotend/extruder to a Titan Aero. The way its attachment works, I have to partially disassemble the hotend itself to remove either the hotend or the part cooling duct, which is not ideal. 

I'd also like to have a way to easily try out some other styles of part cooling ducts, and I haven't found a lot of options that work with this setup.

I was recently looking at building another printer with a larger build volume, and drooling over the [Rat Rig V-Core 3](https://v-core.ratrig.com). I followed the link from that site to the [EVA 3D](https://main.eva-3d.page) carriage system. The EVA design looked really clean, and modular in a simlar way to the one included with the ReDuplicator plans, but it also looked like it solved the problems that were annoying me with my current build.

The current release at the time was 2.4.2, and, sadly for me, they dropped support for the Titan Aero after 2.3.0.  Fortunately, 2.3.0 is still available in the project's github history, so I can make use of it.

This repository contains an [OpenSCAD](https://openscad.org) file that remixes the STL for the ReDuplicator backplate so that it can take the place of the [top_mgn12.stl](https://github.com/EVA-3D/eva-main/blob/2.3.0/stls/top_mgn12.stl) piece in the EVA-3D system. The rest of the [Aero](https://github.com/EVA-3D/eva-aero/blob/d51db2875f89eb52dd9c3bae03458f37f4e90506/index.md) assembly can then be built around it. 

I'm using the [Cartesian](https://github.com/EVA-3D/addon-cartesian-idex/blob/2d90e5a51830cc2a6b8e7695582e9185176c6529/index.md) back piece because I like the fan orientation it uses, but any of the back pieces should work (the transport is handled entirely by the remixed top piece, so the belt connection points on the back piece are unused). The [CoreXY](https://github.com/EVA-3D/eva-main/blob/2.3.0/docs/assets/%5BBack%5D%20CoreXY.png) backpiece should work as well, if the fan doesn't interfere with the cable chain mount.

I did have to move the attachment points about 10mm lower than I'd like, to avoid them interfering with either the LM8 fixing screws or the belt retention groove, so the extruder will be a bit lower than it was with the native ReDuplicator mount. I don't _think_ this will cause any issues for me (I built my frame a bit higher than I needed it, so the loss of a cm or so of build volume height shouldn't be noticeable).

## EVA-3D 2.4 compatibility

Looking at the differences between the EVA 2.3 and 2.4 standards, it appears that the main change that's relevant to this remix is the width of the parts cooling duct attachment. 

Since I'd like to try out the 2.4 TriHorn ducts as well, I've also created a remix of bottom_mgn12_short_duct.stl that has the proper offset for the Aero drive. This should allow me to use the 2.4 back and ducts with the Aero drive (assuming they fit otherwise).