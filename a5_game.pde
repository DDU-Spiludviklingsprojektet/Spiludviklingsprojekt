final static String JORDEN_IMG = "data/svg/jorden.svg";
final static String MOON_IMG = "data/svg/moon.svg";
final static String END_IMG = "data/svg/end.svg";
final static String OVERLAY_IMG = "data/svg/velocity.svg";
PShape jorden_img;
PShape moon_img;
PShape end_img;
PShape overlay_img;
Button_rect back_bt2;


//Initailisation of the objects used in the game.
Planet earth;
Planet moon;
Raket rocket;

//A lot of different values for easy tweaking.

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
float power = 200;
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
float earthradius = 63710;
//Is there an atmosphere?
boolean earthatmosphere = true;
//How far does the atmosphere go (Must still be a float with no atmosphere, but irrelevant in that case).
float earthedgeofatmosphere = 5000;
//What is the air density at surface level, in kg per cubic meters (Air on earth about 1 kg per cubic meter)
float earthairdensity = 1;
//What is the mass of the object? In kg
float earthmass = pow(5.97, 23);

//set values for moon
//Where is the planet (XY pos)
float moonpositionx = 0;
float moonpositiony = 300000;
//What is the radius of the planet in Meters
float moonradius = 17100;
//Is there an atmosphere?
boolean moonatmosphere = false;
//How far does the atmosphere go (Must still be a float with no atmosphere, but irrelevant in that case).
float moonedgeofatmosphere = 0;
//What is the air density at surface level, in kg per cubic meters (Air on earth about 1 kg per cubic meter), again irrelevant if no atmosphere
float moonairdensity = 0;
//What is the mass of the object? In kg
float moonmass = pow(5.97, 22);

//Various vaiables used for the game.
float G = pow(6.674, -11);
float G0 = 9.82;
float zoomlevel = 5;
int timewrap = 1;
int frames = 0;
float highscore = 0;

//Creates Objects
void game_setup() {
  back_bt2 = new Button_rect(back_img, width/15, height/15, 128, 128, (width/15)+1, (height/15)-14, 122, 43, 255, 10);
  
  earth = new Planet(earthpositionx, earthpositiony, earthatmosphere, earthradius, earthedgeofatmosphere, earthairdensity, earthmass);
  moon = new Planet(moonpositionx, moonpositiony, moonatmosphere, moonradius, moonedgeofatmosphere, moonairdensity, moonmass);
  rocket = new Raket(drymass, fueldensity, tanksize, ISP, power, CD, Area, Throttle);

  jorden_img = loadShape(JORDEN_IMG);
  moon_img = loadShape(MOON_IMG);
  end_img = loadShape(END_IMG);
  overlay_img = loadShape(OVERLAY_IMG);
}

void game() {
  back_bt2.update_rect();
  back_bt2.farve();
  back_bt2.render();
  
  rocket.forces();
  graphics();
  input();
  timewrap();
  highscore();
}

void graphics() {
  gamebackground();
  earth.earthdraw();
  moon.moondraw();
  rocket.draw();
  overlays();
  end();
}

void end() {
  if (rocket.getNearestplanet() == "moon" && rocket.getAltitude() <=5) {
    rotate(-rocket.getGoalheading());
    shapeMode(CENTER);
    shape(end_img, 0, 0, width, height);
  }
}

void gamebackground() {
  if (rocket.getAltitude()>earth.getedgeofatmosphere()|| rocket.getNearestplanet()!="earth") {
    background(0, 0, 0);
  } else {
    //draw background that is black if rocket.getAltitude is equal to earth.getedgeofatmosphere, and is blue if rocket.getAltitude is 0 and gradually transisions between them
    background(0, 0, 255*((earth.getedgeofatmosphere()-rocket.getAltitude())/earth.getedgeofatmosphere()));
  }
}

void overlays() {
  //Heri er alt dette der er oven på spillet
}

void highscore() {
  if (rocket.getAltitude()>highscore) {
    highscore = rocket.getAltitude();
  }
}


void timewrap() {
  if (frames == 10) {
    frames = 0;
  }
  if (frames == 0) {
    if (keyPressed) {
      if (key==',') {
        timewrap--;
      } else if (key=='.') {
        timewrap++;
      }
    }
  }
  if (timewrap <= 0) {
    timewrap = 1;
  }
  frames++;
  frameRate(30*timewrap);
  println(timewrap);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e > 0) {
    zoomlevel = zoomlevel*1.1;
  } else if (e < 0) {
    zoomlevel = zoomlevel*0.9;
  }
}


void input() {
  if (keyPressed) {
    switch(keyCode) {
      //ifShift, increase throttle 5%
    case 16:
      if (rocket.getThrottle() >= 96) {
        rocket.setThrottle(100);
        break;
      } else {
        rocket.setThrottle(rocket.getThrottle() + 5);
        break;
      }
      //if CTRL or Control decrease throttle 5%
    case 17:
      if (rocket.getThrottle() <= 4) {
        rocket.setThrottle(0);
        break;
      } else {
        rocket.setThrottle(rocket.getThrottle() - 5);
        break;
      }
      //ifESC is pressed, go to main menu
    case 27:
      game = false;
      menu = true;
      break;
      //ifLeft arrow is pressed, turn 5 degrees left
    case 37:
      rocket.setChangedirection(-1);
      break;
      //ifRight arrow is pressed, turn 5 degrees right
    case 39:
      rocket.setChangedirection( 1);
      break;
      //ifX is pressed, turn off the engine
    case 88:
      rocket.setThrottle(0);
      break;
      //ifZ is pressed, set the engine to max power.
    case 90:
      rocket.setThrottle(100);
      break;
    }
  }
}
