---
layout: post
title: "How to design a replacement light fixture."
author: Hristo
---

**OK, this one is neither a piece of jewelry**, nor particularly pretty. However it illustrates the size of objects you can print and also demonstrates an easy way of designing parts that are meant to fit together. We will develop this approach for making pieces of jewelry in follow-up posts.

_NOTE: You have to make sure what you make is safe for use. We can not guarantee that this design is fit for any specific purpose. Use your judgement because we are not liable for any damages or harm that may come from using this information._

On a very basic level, the fixture is just a shell that attaches to the lamp post, contains and covers the light bulb, lets heat escape (important!), and lets light through either directly or as it passes through a translucent medium.

The SCAD implementation speaks for itself (read the comments). In short, first we design the bottom to fit the lamp post (specifically so we can attach to the light bulb socket):

![Bottom part of the light fixture.](/images_posts/light_fixture_bottom.png)

Then we design the top to match the bottom, but also to have some pegs that protrude and stop the top from falling off. The separate top design also means you can print the top from a different material (see the final result, with a translucent top, at the end):

![Top part.](/images_posts/light_fixture_top.png)

If you structure the code well, with separate modules for the top and bottom, you can render them separately (for the purpose of saving STL files for printing), or you can render together to see how the parts fit:

![Together, check fit and look.](/images_posts/light_fixture_preview.png)

Finally, if you are designing for actual use, you can print and test. In our case, we use an LED light bulb which emits little heat and is also very efficient. The printout uses PLA which should not have heat issues in this specific scenario. In any case, *pay attention to product safety because we can not guarantee your specific use will be safe*.

![Test final printout.](/images_posts/light_fixture_actual.jpg)