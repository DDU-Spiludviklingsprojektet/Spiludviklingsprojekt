//Importing images
final static String JORDEN_IMG = "data/svg/jorden.svg";
final static String MOON_IMG = "data/svg/moon.svg";
final static String END_IMG = "data/svg/end.svg";
final static String OVERLAY_IMG = "data/svg/velocity.svg";
final static String AGAIN_IMG = "data/svg/again.svg";

//Creating PShape objects
PShape jorden_img;
PShape moon_img;
PShape end_img;
PShape overlay_img;
PShape again_img;
//Creating button object
Button_rect back_bt2;
Button_rect tryagain_bt;


//Initailisation of the objects used in the game.
Planet earth;
Planet moon;
Raket rocket;
ParticleSystem ps;

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
int earthred = 0;
int earthgreen = 255;
int earthblue = 0;

//set values for moon
//Where is the planet (XY pos)
float moonpositionx = 0;
float moonpositiony = -300000;
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
int moonred = 100;
int moongreen = 100;
int moonblue = 100;

//Various vaiables used for the game.
float G = pow(6.674, -11);
float G0 = 9.82;
float zoomlevel = 5;
int timewrap = 1;
int frames = 0;
float highscore = 0;
boolean dead = false;
int score=0;

//Creates Objects
void game_setup() {
  back_bt2 = new Button_rect(back_img, width/15, height/15, 128, 128, (width/15)+1, (height/15)-14, 122, 43, 255, 10);
  tryagain_bt = new Button_rect(empty_img, 100, 100, 200, 60, width/2.092, height/1.351, 640, 185, 1, 20);
  jorden_img = loadShape(JORDEN_IMG);
  moon_img = loadShape(MOON_IMG);
  end_img = loadShape(END_IMG);
  overlay_img = loadShape(OVERLAY_IMG);
  again_img = loadShape(AGAIN_IMG);
  earth = new Planet(earthpositionx, earthpositiony, earthatmosphere, earthradius, earthedgeofatmosphere, earthairdensity, earthmass, jorden_img, earthred, earthgreen, earthblue);
  moon = new Planet(moonpositionx, moonpositiony, moonatmosphere, moonradius, moonedgeofatmosphere, moonairdensity, moonmass, moon_img, moonred, moongreen, moonblue);
  rocket = new Raket(drymass, fueldensity, tanksize, ISP, power, CD, Area, Throttle);
  ps = new ParticleSystem(new PVector(0, 0));
  timewrap = 1;
  frames = 0;
  highscore = 0;
  dead = false;
  score = 0;
}

//Draws the game physics etc.
void game() {
  rocket.forces();
  graphics();
  input();
  timewrap();
  highscore();
}

//Draws the graphics
void graphics() {
  background(0);
  earth.draw();
  moon.draw();
  rocket.draw();
  overlays();
  end();
  death();
  back2();
}

//Creates the back button
void back2() {
  shapeMode(CORNERS);
  translate(-width*0.5, -height*0.5);
  back_bt2.update_rect();
  back_bt2.farve();
  back_bt2.render();
  if (back_bt2.isClicked()) {
    clear();
    game = false;
    upgrade_page = true;
    money+=score;
  }
}

//Creates the end screen
void end() {
  if (rocket.getNearestplanet() == "moon" && rocket.getAltitude() <=5) {
    shapeMode(CENTER);
    shape(end_img, 0, 0, width, height);
  }
}

void death() {
  if (rocket.collision()) {
    dead = true;
  }
  if (dead) {
    translate(-width*0.5, -height*0.5);
    shapeMode(CORNERS);
    shape(again_img, -4, 0, width, height);
    tryagain_bt.update_rect();
    tryagain_bt.farve();
    tryagain_bt.render();
    if (tryagain_bt.isClicked()) {
      clear();
      game = false;
      upgrade_page = true;
      money+=score;
    }
  }
}

//Creates the text information on screen
void overlays() {
  rotate(-rocket.getGoalheading());
  textFont(bit8);
  textSize(20*width/1280);
  fill(255);
  text("Fuel: " + int(rocket.getFuel()) +  "\nThrottle: " + int(rocket.getThrottle()) + "\nAltitude: " + int(rocket.getAltitude()) + "\nTimewrap: " + timewrap + "\nScore: " + score, -width/2+width/20, -height/2+height/8);
}

//Calculates the highscore based on the highest altitude reached
//TODO, it kinda works, but not as intended, and is kind of broken. But it is not a priority to fix it. Therefore it is still here, broken.
void highscore() {
  if (calculateScore()>score) {
    score = calculateScore();
  }
}

int calculateScore() {
  float defaultdistance = (moon.getPosition().mag()-moon.getRadiusMag()+earth.getRadiusMag());
  float currentdistance = (rocket.getMoondistance()-moon.getRadiusMag());
  return int(((defaultdistance-currentdistance)/defaultdistance)*500);
}

//Crates timewrap to make the game more playable and reduce gametime.
//TODO, make the game based on time, instead of frames, so slower computers can timewrap.
//Also move the keypresses to the input function, and find a better way to do the delay.
void timewrap() {
  if (keyPressed == true) {
    if (key==',') {
      timewrap--;
    } else if (key=='.') {
      timewrap++;
    }
  }
  if (timewrap <= 0) {
    timewrap = 1;
  }
}

//Zooms in and out
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e < 0) {
    zoomlevel = zoomlevel*1.1;
  } else if (e > 0) {
    zoomlevel = zoomlevel*0.9;
  }
}

//Take input from the user
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
      //ifLeft arrow is pressed, turn 5 degrees left
    case 37:
      rocket.setChangedirection(-1);
      break;
      //ifRight arrow is pressed, turn 5 degrees right
    case 39:
      rocket.setChangedirection( 1);
      break;
    case 38:
      if (rocket.getThrottle() >= 96) {
        rocket.setThrottle(100);
        break;
      } else {
        rocket.setThrottle(rocket.getThrottle() + 5);
        break;
      }
    case 40:
      if (rocket.getThrottle() <= 4) {
        rocket.setThrottle(0);
        break;
      } else {
        rocket.setThrottle(rocket.getThrottle() - 5);
        break;
      }
    }
  }
}
