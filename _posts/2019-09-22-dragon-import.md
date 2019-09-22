---
layout: post
title: "Importing an STL file to attach to a ring or bracelet."
author: Hristo
---

**We will now see how to combine an existing 3D model** with a wearable jewelry design that you create in OpenSCAD. This technique is very versatile as it lets you use an existing design to make your own creation stand out.

We will assume that you have the model to import and it has been _cleaned up_ so that it has no degenerate features. If OpenSCAD refuses to import an STL file you have, the model may be malformed. See the post on finding, downloading, and cleaning up an STL file for import to learn about how to solve problems like this.

We start out with a simple ring, and import the STL file that contains a model of a dragon knocker, making sure we position the two appropriately:

![Dragon ring.](/images_posts/dragon_import_ring.png)

When we print, we see that the dragon model has features that are very minute and better seen as part of a bracelet, so we make a simple "slip-on" type piece:

![Dragon bracelet.](/images_posts/dragon_import_bracelet.png)

We test a cheap printout first and then off to a more sophisticated process for a piece that someone would wear:

![Plastic printouts.](/images_posts/dragon_import_actual.jpg)

You can get the code for the [bracelet](/code/dragon_import_bracelet.scad) and the [ring](/code/dragon_import_ring.scad). Don't forget to get the [dragon model itself](/assets/Dragon_Knocker_8_Solid.stl) which is based on a [design from Shira](https://www.thingiverse.com/thing:1458545) on Thingiverse.