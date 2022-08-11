# A soul for your flutter apps

A list of reusable responsive, themes widgets, extensions and utilities methods for your flutter app

## Features

* ⚡ Great performance
* 🦾 6 breakpoints for your widget.
* ❤️ Context extensions for checking the required breakpoint.
* ❤️ Widget extensions for padding, margin and radius properties.
<!-- ## Getting started -->

## Usage

Use the **ResponsiveSoul** widget to make your widget responsive. It works like css bootstrap framework.

```dart
ResponsiveSoul(
    xsm:MyWidget(),
    sm:MyWidget2(),
    md:MyWidget3(),
    lg:MyWidget4(),
    xl:MyWidget5(),
    xxl:MyWidget6(),
)
```

It is not necessary to put all the widgets as a parameter, use your desired breakpoint, and your widget builds from that breakpoint to so on where they find the next widget if any. For example, if you use **md && xl**, your **md** widget is set from **xsm-lg**, and **xl** is set to from **xl-xxl**.

if you want to use only single breakpoint, it will work on all the screen. To disable this behaviour set

```dart
ResponsiveSoul(
    autoManage:false,
)
```

by setting `autoManage:false` your widget only show on respected breakpoint.
<!-- ## Additional information -->
