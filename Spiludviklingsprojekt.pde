//Import of libraries for database and for making the windows resizeable
import processing.javafx.*;
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

//Variable setup, pretty self explainatory names
final static String ICON = "/sprites/Logo.png";
final static String TITLE = "Raket";
final static String CURSOR_IMG = "/sprites/cursor.png";


void settings() {
  size(1280, 720, FX2D);
}

void setup() {
  frameRate(60);
//Set custom desktop icon
  getSurface().setIcon(loadImage(ICON));
  surface.setTitle(TITLE);
  surface.setResizable(true);
// Load custom cursor
  PImage cursor = loadImage(CURSOR_IMG);
  cursor(cursor);

  boot();
}

//Code to exit fullscreen & program
void draw() {
  if (keyPressed) {
    if (key == 'u') {
      exit();
    }
  }
}
