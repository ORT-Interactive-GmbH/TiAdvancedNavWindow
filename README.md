# TiAdvancedNavWindow

[![gittio](http://img.shields.io/badge/gittio-1.0.0-00B4CC.svg)](http://gitt.io/component/de.ortinteractive.navwindow)
[![License](http://img.shields.io/badge/license-MIT-orange.svg)](http://mit-license.org)


## Overview

This module provides some advanced functionality to the `Titanium.UI.iOS.NavigationWindow` object.

All custom properties and methods are injected into the Titanium NavigationWindow object. 


## Installation
### Get it [![gitTio](http://gitt.io/badge.png)](http://gitt.io/component/de.ortinteractive.navwindow)
Download the latest distribution ZIP-file and consult the [Titanium Documentation](http://docs.appcelerator.com/titanium/latest/#!/guide/Using_a_Module) on how install it, or simply use the [gitTio CLI](http://gitt.io/cli):

`$ gittio install de.ortinteractive.navwindow`

## Usage
All you need to do is, include the module in your tiapp.xml file.


## Properties

* numViewControllers _(Number)_ Returns the number of stacked Windows on the NavigationWindow object, so you don't need to keep track of it.

## Methods

* `popToRoot( args )` - Remove all existing windows on the stack and return to the root.
* args _(Object)_:
* `animated` _(Boolean)_ - defines if the transition should be animated

* `pop( args )` - Removes the active window from the stack. If the active window is the root window, nothing happens.
* args _(Object)_:
* `animated` _(Boolean)_ - defines if the transition should be animated

* `hideNavBar( args )` - Hides the navigation bar
* args _(Object)_:
* `animated` _(Boolean)_ - defines if the transition should be animated


* `showNavBar( args )` - Shows the navigation bar
* args _(Object)_:
* `animated` _(Boolean)_ - defines if the transition should be animated

## Example
```javascript
var redWin = Titanium.UI.createWindow({
    backgroundColor: 'red',
    title: 'Red Window'
});

var navWindow = Titanium.UI.iOS.createNavigationWindow({
    window: redWin
});

var blueWin = Titanium.UI.createWindow({
    backgroundColor: 'blue',
    title: 'Blue Window'
});

var button = Titanium.UI.createButton({
    title: 'Open Blue Window'
});
button.addEventListener('click', function(){
    navWindow.openWindow(blueWin, {animated:true});
    Ti.API.info("Num of Windows in Stack: " + navWindow.numViewControllers);
});

redWin.add(button);

var navBarHidden = false;
var button2 = Titanium.UI.createButton({
    title: 'Hide/Show Nav Bar'
});
button2.addEventListener('click', function(){
    if (!navBarHidden) {
        navWindow.hideNavBar();
        blueWin.setStatusBarStyle(Titanium.UI.iPhone.StatusBar.LIGHT_CONTENT);
        navBarHidden = true;
    } else {
        navWindow.showNavBar();
        blueWin.setStatusBarStyle(Titanium.UI.iPhone.StatusBar.DEFAULT);
        navBarHidden = false;
    }
});
blueWin.add(button2);

var button3 = Titanium.UI.createButton({
    title: 'Pop to Root', bottom: 100
});
button3.addEventListener('click', function(){
    navWindow.popToRoot();
});
blueWin.add(button3);

navWindow.open();
```

## License

The MIT License (MIT)

Copyright (c) 2015 ORT interactive GmbH


Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
