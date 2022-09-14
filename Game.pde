//Creates Objects
Raket rocket;
Planet earth;
Planet moon;

//set values for rocket
// Drymass in KG
float drymass = 20000;
//Fuel density in kg per cubic meter
float fueldensity = 1000;
//Tank size in cubic meters
float tanksize = 100000;
//ISP in seconds
float ISP = 300;
//Enginepower in KN
float power = 20;
//Drag coefficient
float CD = 0.5;
//Rocket area
float Area = 10;

//set values for starting planet
float earthpositionx = 0;
float earthpositiony = 0;
boolean earthatmosphere = true;
float earthradius = 637100;
float earthedgeofatmosphere = 50000;
float earthairdensity = 1;
float earthmass = pow(5.97, 23);

//set values for moon
float moonpositionx = 0;
float moonpositiony = 0;
boolean moonatmosphere = false;
float moonradius = 17100;
float moonedgeofatmosphere = 50000;
float moonairdensity = 1;
float moonmass = pow(5.97, 23);

void game() {
  rocket = new Raket(drymass, fueldensity, tanksize, ISP, power, CD, Area);
  earth = new Planet(earthpositionx, earthpositiony, earthatmosphere, earthradius, earthedgeofatmosphere, earthairdensity, earthmass);
  moon = new Planet(moonpositionx, moonpositiony, moonatmosphere, moonradius, moonedgeofatmosphere, moonairdensity, moonmass);
  input();
  rocket.engine();
  rocket.gravity();
  rocket.drag();
  rocket.forces();
}

void input() {
  switch(keyCode) {
    //if Shift, increase throttle 5%
  case 16:
    if (rocket.getThrottle() >=96) {
      rocket.setThrottle(100);
      break;
    } else {
      rocket.setThrottle(rocket.getThrottle()+5);
      break;
    }
    //if CTRL or Control decrease throttle 5%
  case 17: 
    if (rocket.getThrottle() <= 4) {
      rocket.setThrottle(0);
      break;
    } else {
      rocket.setThrottle(rocket.getThrottle()-5);
      break;
    }
    //if ESC is pressed, go to main menu
  case 27: 
    game = false;
    menu = true;
    break;
    //if Left arrow is pressed, turn 5 degrees left
  case 37: 
    rocket.turn(5);
    break;
    //if Right arrow is pressed, turn 5 degrees right
  case 39: 
    rocket.turn(-5);
    break;
    //if X is pressed, turn off the engine
  case 88: 
    rocket.setThrottle(0);
    break;
    //if Z is pressed, set the engine to max power.
  case 90: 
    rocket.setThrottle(100);
    break;
  }
