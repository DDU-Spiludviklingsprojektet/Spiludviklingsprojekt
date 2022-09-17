//Import of libraries for database and for making the windows resizeable
import processing.javafx.*;
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;
import processing.sound.*;

//Variable setup, pretty self explainatory names
final static String TITLE = "Raket";
final static String ICON_IMG = "sprites/icon.png";
final static String CURSOR_IMG = "sprites/cursor.png";
final static String BACKGROUND_IMG = "sprites/background.gif";
final static String LOGO_IMG = "sprites/logo.png";
final static String BUTTONS_IMG = "sprites/buttons.svg";
final static String RAKET_IMG = "sprites/raket.svg";

//Initializing variabls for shapes, images and sound

PImage cursor_img;
PImage background_img;
PImage logo_img;
PShape buttons_img;
PShape raket_img;


SoundFile menu_sound;

int cols;
int rows;
//
boolean upgrade_page = false;
boolean menu = false;
boolean game = true;
boolean mute = false;


void settings() {
  size(1280, 720, FX2D);
}

void setup() {
  frameRate(30);
  //Set custom desktop icon
  getSurface().setIcon(loadImage(ICON_IMG));
  
  
  menu_sound = new SoundFile(this, "sprites/title_sang.mp3");
  menu_sound.loop();
  
  surface.setTitle(TITLE);
  surface.setResizable(true);
  
  logo_img = loadImage(LOGO_IMG);
  buttons_img = loadShape(BUTTONS_IMG);
  // Load custom cursor
  cursor_img = loadImage(CURSOR_IMG);
  cursor(cursor_img, -32, -32);

  logox = width/2;
  logoy = height/4;
  logosize = width/3;
  buttonsx = width/2;
  buttonsy = height*0.7;
  buttonssize = width/3;

  game_setup();
  upgrade_setup();
  boot();
}


//Code to exit fullscreen & program
void draw() {
  if (mute == true) {
   menu_sound.amp(0.0); 
  }
  else {
    menu_sound.amp(1.0);
  }
  
  if (keyPressed) {
    if (key == 'u') {
      exit();
    }
  }
  if (menu==true) {
    home();
  }
  if (upgrade_page==true) {
    upgrade();
  }
  if (game==true) {
    game();
  }
}

void background() {
  background_img = loadImage(BACKGROUND_IMG);
  cols = width/background_img.width;
  rows = height/background_img.height;
  if ( width%background_img.width> 0) {
    cols++;
  }
  if ( height%background_img.height >0) {
    rows++;
  }
}
