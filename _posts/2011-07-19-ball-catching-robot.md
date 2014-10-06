---
layout: post
title: Ball Catching Robot
description: ""
modified: 2011-07-19
category: project
tags: [Robotics, Video]
image:
  feature: rowland_web_banner.jpg
comments: true
share: true
---

This video shows the Mitsubishi PA-10 robotic arm (7 DOF) from the Kameyama Lab at Tohoku Univ catching a ball that is thrown at it ... <!-- more --> well catching it half the time. Working with this robot was my research assignment in the Kameyama Lab for the year in undergrad that I studied abroad in Japan.

Two stationary cameras behind the robot identify the moving ball by its bright yellow color. Stereo vision techniques are used to determine the ball's position relative to the robotic arm. A trajectory is then estimated using a least squares fit to a parabolic curve. Based on the trajectory and known range of the robotic arm an intercept point is computed. Inverse kinematics are calculated to move the catching net of the robotic arm to the proper location. This routine takes place 32 times a second or once per video frame and written entirely in C++.

* * *

[See All My Projects -->](http://www.rowlandoflaherty.com/projects/)
