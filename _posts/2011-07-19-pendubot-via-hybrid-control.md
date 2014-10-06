---
layout: post
title: Pendubot via Hybrid Control
description: ""
modified: 2011-07-19
category: project
tags: [Control, Robotics, Video]
image:
  feature: rowland_web_banner.jpg
comments: true
share: true
---

Using hybrid control a two link planar robot, called the pendubot, is stabilized to its upright equilibrium from any initial condition <!-- more -->despite large disturbances in a robust globally asymptotic fashion. This is work I did during my master's at UCSB.

You can read more about this work in the paper:
[Robust global swing-up of the pendubot via hybrid control](http://ieeexplore.ieee.org/Xplore/login.jsp?url=http%3A%2F%2Fieeexplore.ieee.org%2Fstamp%2Fstamp.jsp%3Ftp%3D%26arnumber%3D4586692%26isnumber%3D4586444&authDecision=-201g) (with R. O'Flaherty and A. R. Teel) Proc. 27th American Control Conference, 1424--1429, 2008.

This video shows the pendubot being stabilized from a few different positions. The current controller being applied to the pendubot is indicated by variable q. When q is positive an open-loop control effort is being applied to move the pendubot from one equilibrium point to another equilibrium point. When q is negative a closed-loop control effort is being applied to stabilize the pendubot to a particular equilibrium. When q is equal to zero an energy removal controller is used to quickly bring the pendubot back towards the stable downward equilibrium point.

At the beginning of the video the pendubot starts in the stable downward equilibrium and q is initialized zero. The pendubot is then moved to a neighborhood of the unstable upright equilibrium using an open-loop controller (indicated by q = 2). It is then stabilized to the upright equilibrium by a closed-loop controller (indicated by q = -3). A large disturbance then disrupts the pendubot and the energy removal controller (indicated by q = 0) quickly brings the pendubot back towards the resting equilibrium. A closed-loop controller is used to bring the pendubot to a nearby point of the downward equilibrium (indicated by q = -2), before it is brought to the upright position again. The pendubot is then positioned in different equilibrium position (first link up, second link down) from the two its been in before. An open-loop controller is used to bring the pendubot from this equilibrium to the resting equilibrium (indicated by q = 1), from where it is brought to the upright equilibrium position again.





* * *



[See All My Projects -->](http://www.rowlandoflaherty.com/projects/)
