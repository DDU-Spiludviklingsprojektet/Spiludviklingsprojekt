import processing.javafx.*;
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

final static String ICON = "/sprites/Logo.png";
final static String TITLE = "Raket";
final static String CURSOR_IMG = "/sprites/cursor.png";


void settings() {
  size(1280, 720, FX2D);
}

void setup() {
  frameRate(60);
  getSurface().setIcon(loadImage(ICON));
  surface.setTitle(TITLE);
  surface.setResizable(true);

  PImage cursor = loadImage(CURSOR_IMG);
  cursor(cursor);

  boot();
}

void draw() {
  if (keyPressed) {
    if (key == 'u') {
      exit();
    }
  }
}
