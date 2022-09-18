// Button class
class Button_upg {
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
  Button_upg(float tempX, float tempY, float tempW, float tempH, int tempi01, int tempi02) {
    x  = tempX;
    y  = tempY;
    w  = tempW;
    h  = tempH;
    index01 = tempi01;
    index02 = tempi02;
    on = false;  // Button always starts as off
  }

  void click(int mx, int my, Button_upg[][] b, int upg) {
    // Check to see if a point is inside the rectangle
    if (mx > x && mx < x + w && my > y && my < y + h) {
      switch(upg) {
      case 0:
        if (b[0][index02].on == false) {
          if (b[0][index02].index02 == 0 && money >= 100) {
            on = !on;
            money = money - 100;
            ISP = ISP + 20;
          } else if (b[0][index02-1].on == true && money >= 100) {
            on = !on;
            money = money - 100;
            ISP = ISP + 20;
          }
        }
        break;

      case 1:
        if (b[1][index02].on == false) {
          if (b[1][index02].index02 == 0 && money >= 200) {
            on = !on;
            money = money - 200;
            power = power + 5;
          } else if (b[1][index02-1].on == true&& money >= 200) {
            on = !on;
            money = money - 200;
            power = power + 5;
          }
        }
        break;

      case 2:
        if (b[2][index02].on == false) {
          if (b[2][index02].index02 == 0 && money >= 200) {
            on = !on;
            money = money - 200;
            drymass = drymass - 2000;
          } else if (b[2][index02-1].on == true && money >= 200) {
            on = !on;
            money = money - 200;
            drymass = drymass - 2000;
          }
        }
        break;

      case 3:
        if (b[3][index02].on == false) {
          if (b[3][index02].index02 == 0 && money >= 200) {
            on = !on;
            money = money - 200;
            fueldensity = fueldensity + 0.16;
          } else if (b[3][index02-1].on == true && money >= 200) {
            on = !on;
            money = money - 200;
            fueldensity = fueldensity + 0.16;
          }
        }
        break;

      case 4:
        if (b[4][index02].on == false) {
          if (b[4][index02].index02 == 0 && money >= 200) {
            on = !on;
            money = money - 200;
            CD = CD - 0.1;
          } else if (b[4][index02-1].on == true && money >= 200) {
            on = !on;
            money = money - 200;
            CD = CD - 0.1;
          }
        }
        break;
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
    rect(x, y, w, h);
  }

  void if_money_buy_switch(Button_upg[][] b, int upg, int amount) {
    if (money > amount) {
      if (b[upg][index02].on == false && b[upg][index02].index02 == 0 ) {
        on = !on;
      } else if (b[upg][index02-1].on == true) {
        on = !on;
      }
    }
  }
}
