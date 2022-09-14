//Creates Objects
Raket rocket;
Planet earth;
Planet moon;

//set values for rocket
float drymass = 20000;
float fueldensity = 1;
float tanksize = 100000;
float ISP = 300;
float power = 20;
float CD = 0.5;
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
}

void input() {
  switch(keyCode) {
  case 16: //Shift
    if (rocket.getThrottle() >=96) {
      rocket.setThrottle(100);
      break;
    } else {
      rocket.setThrottle(rocket.getThrottle()+5);
      break;
    }
  case 17: //CTRL
    if (rocket.getThrottle() <= 4) {
      rocket.setThrottle(0);
      break;
    } else {
      rocket.setThrottle(rocket.getThrottle()-5);
      break;
    }
  case 27: //Escape
    game = false;
    menu = true;
    break;
  case 37: //Left arrow
    rocket.turn(5);
    break;
  case 39: //Right arrow
    rocket.turn(-5);
    break;
  case 88: //X
    rocket.setThrottle(0);
    break;
  case 90: //Z
    rocket.setThrottle(100);
    break;
  }
