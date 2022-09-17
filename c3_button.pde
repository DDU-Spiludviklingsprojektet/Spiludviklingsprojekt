// Exercise 9-8: Write a Button class (see Example 5-5 for a non-object-oriented button). The button 
// class should register when a mouse is pressed over the button and change color.  Create button objects 
// of different sizes and locations using an array. Before writing the main program, sketch out the 
// Button class. Assume the button is off  when it first appears.  

// Button class
class Button  {    

  // Button location and size
  float x;   
  float y;   
  float w;   
  float h;   
  // Is the button on or off?
  boolean on;
  int index01;
  int index02;

  // Constructor initializes all variables
  Button(float tempX, float tempY, float tempW, float tempH, int tempi01, int tempi02)  {    
    x  = tempX;   
    y  = tempY;   
    w  = tempW;   
    h  = tempH;
    index01 = tempi01;
    index02 = tempi02;
    on = false;  // Button always starts as off
  }    

  void click(int mx, int my, Button[][] b, int upg) {
    // Check to see if a point is inside the rectangle
    if (mx > x && mx < x + w && my > y && my < y + h) {
      if(b[upg][index02].on == false) {
        if (b[upg][index02].index02 == 0 ) {
      on = !on;
        }
      else if (b[upg][index02-1].on == true) {
        on = !on;
      }
      }
    }
  }

  // Draw the rectangle
  void display() {
    rectMode(CORNER);
    stroke(0);
    // The color changes based on the state of the button
    if (on) {
      fill(175);
    } else {
      fill(0);
    }
    rect(x,y,w,h);
  }
  
} 