//Import of libraries for database and for making the windows resizeable
import processing.javafx.*;
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

//Variable setup, pretty self explainatory names
final static String ICON = "/sprites/icon.png";
final static String TITLE = "Raket";
final static String CURSOR_IMG = "/sprites/cursor.png";
final static String background = "/sprites/background.gif";
final static String LOGO_IMG = "/sprites/logo.png";
final static String BUTTONS_IMG = "/sprites/buttons.png";
PImage backgroundimage;
PImage cursor;
PImage logo;
PImage buttons;
int cols;
int rows;


void settings() {
  size(1280, 720, FX2D);
}

void setup() {
  frameRate(60);
//Set custom desktop icon
  getSurface().setIcon(loadImage(ICON));
  surface.setTitle(TITLE);
  surface.setResizable(true);
  logo = loadImage(LOGO_IMG);
  buttons = loadImage(BUTTONS_IMG);
  background();
// Load custom cursor
  cursor = loadImage(CURSOR_IMG);
  cursor(cursor, -32, -32);

  boot();
}

//Code to exit fullscreen & program
void draw() {
  if (keyPressed) {
    if (key == 'u') {
      exit();
    }
  }
  home();
}

void background() {
  backgroundimage = loadImage(background);
  cols = width/backgroundimage.width;
  rows = height/backgroundimage.height;
  if( width%backgroundimage.width> 0){cols++;}
  if ( height%backgroundimage.height >0){rows++;}
  println(cols);
  println(rows);
 
}
