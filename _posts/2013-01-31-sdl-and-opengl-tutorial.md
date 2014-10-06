---
layout: post
title: SDL and OpenGL Tutorial
description: ""
modified: 2013-01-31
category: tutorial
tags: [SDL, Xcode]
image:
  feature: rowland_web_banner.jpg
comments: true
share: true
---

Recently I wanted to use a game pad to control one of my robots. A standard way to program with game pad/joystick is to use the [Simple Directmedia Layer (SDL)](http://www.libsdl.org) library. I had some trouble finding a good through tutorial on how to use SDL on a Mac. That is until I came across [Lazy Foo' Productions](http://lazyfoo.net) website. Salvador the author of the site has done a great job putting together a step-by-step tutorial to get anyone up and going with SDL on three different OSs ([Mac Instrustions for Xcode 4.4](http://lazyfoo.net/SDL_tutorials/lesson01/mac/xcode/index.php)).

<!-- more -->

Although I did have a little trouble... In the first lesson in "Setting up SDL for Xcode" to get two thing are missing.

First when you set up your project make sure the "Use Automatic Reference Counting" is unchecked on the "Choose options for you new project:" screen.

Second, to be able to load images, which is done in almost every lesson you need to set you working directing in Xcode. This took me a little be to figure out. If you don't do this you just get a black screen when you run you program instead of having the image show up.

To set your working directory in Xcode: click the left side of the Scheme bar in the top left hand side of the Xcode toolbar. Then select Edit Scheme.

[![Edit Scheme In Xcode](http://www.rowlandoflaherty.com/wp-content/uploads/2013/01/Edit-Scheme-In-Xcode-1024x664.png)](http://www.rowlandoflaherty.com/wp-content/uploads/2013/01/Edit-Scheme-In-Xcode.png)

Select the Run SDL_SetUp (<-- will be name of your program) tab from the left column and select the Options tab along the top. Check the box for Working Directory and add the current directory of where your program is located. Press Ok and you should be all set.

[![Set Working Directory In Xcode](http://www.rowlandoflaherty.com/wp-content/uploads/2013/01/Set-Working-Directory-In-Xcode-1024x700.png)](http://www.rowlandoflaherty.com/wp-content/uploads/2013/01/Set-Working-Directory-In-Xcode.png)
