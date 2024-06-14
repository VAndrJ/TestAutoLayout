# TestAutoLayout


[![StandWithUkraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)
[![Support Ukraine](https://img.shields.io/badge/Support-Ukraine-FFD500?style=flat&labelColor=005BBB)](https://opensource.fb.com/support-ukraine)


A simple example to compare layout construction times.


First, the time was measured from `didFinishLaunchingWithOptions` to `viewDidAppear` without constraints added.
Then the time was measured with the addition of constraints.
The difference is the approximate amount of time required to calculate the layout and display.


The goal is not to measure accurately, only to show trends.


![Measurements](https://raw.githubusercontent.com/VAndrJ/TestAutoLayout/master/Resources/layout_time.png)
