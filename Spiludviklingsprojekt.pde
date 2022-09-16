//Import of libraries for database and for making the windows resizeable
import processing.javafx.*;
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;
import processing.sound.*;

//Variable setup, pretty self explainatory names
final static String ICON = "sprites/icon.png";
final static String TITLE = "Raket";
final static String CURSOR_IMG = "sprites/cursor.png";
final static String background = "sprites/background.gif";
final static String LOGO_IMG = "sprites/logo.png";
final static String BUTTONS_IMG = "sprites/buttons.svg";
final static String RAKET_IMG = "sprites/raket.svg";

PShape raket;
PImage backgroundimage;
PImage cursor;
PImage logo;
PShape buttons_img;

int cols;
int rows;
boolean upgrade_page = false;
boolean menu = true;
boolean game = false;
boolean mute = false;
SoundFile menu_sound;

void settings() {
  size(1280, 720, FX2D);
}

void setup() {
  frameRate(30);
  //Set custom desktop icon
  getSurface().setIcon(loadImage(ICON));
  menu_sound = new SoundFile(this, "sprites/title_sang.mp3");
  
  surface.setTitle(TITLE);
  surface.setResizable(true);
  logo = loadImage(LOGO_IMG);
  buttons_img = loadShape(BUTTONS_IMG);
  // Load custom cursor
  cursor = loadImage(CURSOR_IMG);
  cursor(cursor, -32, -32);

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
  if (mute == false) {
      
  }
  if (mute == true) {
   menu_sound.stop(); 
  }
  if (keyPressed) {
    if (key == 'u') {
      exit();
    }
  }
  println(mute);
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
  backgroundimage = loadImage(background);
  cols = width/backgroundimage.width;
  rows = height/backgroundimage.height;
  if ( width%backgroundimage.width> 0) {
    cols++;
  }
  if ( height%backgroundimage.height >0) {
    rows++;
  }
}
