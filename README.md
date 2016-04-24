# simple-calc
INFO 498B - Project 6

## Spec. Requirements

### Part 1 (due Apr. 21)
#### Details
* call this "simple-calc"
* iPhone 4.7-inch app (iPhone 6 screen)
* iOS 8 or 9
* only changes should be to Main.storyboard and ViewController.swift

#### Classic "text field and buttons" display
* ten digit buttons (0, 1, 2, ... 9)
* operations add, sub, mul, div, mod
* equals button
* when user enters number, then operation, then number, then equals, calculate result

#### Add a few new (multi-operand) operations
* "count": count the number of input
  * 10 count 4 count 25 equals => 3
* "avg": average all the inputs
  * 2 avg 4 avg 6 avg 8 avg 10 equals => 6
* "fact": calculate factorial
  * 5 fact => 60
  * fact can only accept one number

### Part 2 (due Apr. 26)
#### Details
* Extending the previous version
* Support any screen size
  * Support any device
    * UI should look "more or less" the same across different devices
    * Meaning buttons, in roughly the same place, same relative size, etc --> use AutoLayout to create a generic display
* Support rotating the device
  * Be able to use the device in any orientation
* Show a "history" view"
  * Add a new button labeled "History"
  * Segue to a new screen that contains a UIScrollView
    * should in turn contain UILabels as children
    * each label should have a "history" of the most recent callculations
    * display as "2+2=4" "4/4=1" and so on
  * Have a button to return to the main display

#### Grading 
* 2 pts = AutoLayout functionality
* 2 pts = "History" screen
* 1 pt = screen rotation