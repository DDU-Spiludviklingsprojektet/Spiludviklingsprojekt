//Import of libraries for database and for making the windows resizeable
import processing.javafx.*;
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

//Variable setup, pretty self explainatory names
final static String ICON = "/sprites/icon.png";
final static String TITLE = "Raket";
final static String CURSOR_IMG = "/sprites/cursor.png";
final static String background = "/sprites/background.gif";
final static String LOGO_IMG = "/sprites/buttons.svg";
final static String BUTTONS_IMG = "/sprites/buttons.svg";
PImage backgroundimage;
PImage cursor;
PShape logo;
PShape buttons;
int cols;
int rows; 
boolean upgrade = true;
boolean menu = false;
void settings() {
  size(1280, 720, FX2D);
}

void setup() {
  frameRate(30);
  //Set custom desktop icon
  getSurface().setIcon(loadImage(ICON));
  surface.setTitle(TITLE);
  surface.setResizable(true);
  logo = loadShape(LOGO_IMG);
  buttons = loadShape(BUTTONS_IMG);
  // Load custom cursor
  cursor = loadImage(CURSOR_IMG);
  cursor(cursor, -32, -32);

  logox = width/2;
  logoy = height/4;
  logosize = width/3;
  buttonsx = width/2;
  buttonsy = height*0.7;
  buttonssize = width/3;

  boot();
}

//Code to exit fullscreen & program
void draw() {
  if (keyPressed) {
    if (key == 'u') {
      exit();
    }
  }
  
  if(menu==true) {
  home();
  }
  if(upgrade==true) {
   upgrade(); 
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
