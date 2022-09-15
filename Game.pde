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
//Rocket area in square Meters
float Area = 10;
//Starting throttle in %
int Throttle = 0;

//set values for starting planet
//Where is the planet (XY pos)
float earthpositionx = 0;
float earthpositiony = 0;
//What is the radius of the planet in Meters
float earthradius = 637100;
//Is there an atmosphere?
boolean earthatmosphere = true;
//How far does the atmosphere go (Must still be a float with no atmosphere, but irrelevant in that case).
float earthedgeofatmosphere = 50000;
//What is the air density at surface level, in kg per cubic meters (Air on earth about 1 kg per cubic meter)
float earthairdensity = 1;
//What is the mass of the object? In kg
float earthmass = pow(5.97, 23);

//set values for moon
//Where is the planet (XY pos)
float moonpositionx = 0;
float moonpositiony = 0;
//What is the radius of the planet in Meters
float moonradius = 17100;
//Is there an atmosphere?
boolean moonatmosphere = false;
//How far does the atmosphere go (Must still be a float with no atmosphere, but irrelevant in that case).
float moonedgeofatmosphere = 50000;
//What is the air density at surface level, in kg per cubic meters (Air on earth about 1 kg per cubic meter), again irrelevant if no atmosphere
float moonairdensity = 1;
//What is the mass of the object? In kg
float moonmass = pow(5.97, 23);

//Physics variables, used for later calculation
float pi = 3.14;
float G = pow(6.674, -11);
float G0 = 9.82;

void game() {
  rocket = new Raket(drymass, fueldensity, tanksize, ISP, power, CD, Area, Throttle);
  earth = new Planet(earthpositionx, earthpositiony, earthatmosphere, earthradius, earthedgeofatmosphere, earthairdensity, earthmass);
  moon = new Planet(moonpositionx, moonpositiony, moonatmosphere, moonradius, moonedgeofatmosphere, moonairdensity, moonmass);
  input();
  rocket.engine();
  rocket.gravity();
  rocket.drag();
  rocket.forces();
}

void input() {
  if (keyPressed == true) {
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
      rocket.setTurn(5);
      break;
      //if Right arrow is pressed, turn 5 degrees right
    case 39:
      rocket.setTurn(-5);
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
  }
}
