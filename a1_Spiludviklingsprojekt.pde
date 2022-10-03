//Firstly Libraries are imported, following libraries are imported:
//JAVAFX
//Sound
//BezierSQLLib
//UiBooster

//Import of UI elements library.
import uibooster.*;
import uibooster.components.*;
import uibooster.model.*;
import uibooster.model.formelements.*;
import uibooster.model.options.*;
import uibooster.utils.*;

//Import of JavaFX library.
import processing.javafx.*;

//Import of SQL library.
import de.bezier.data.sql.mapper.*;

//Import of the sound library.
import processing.sound.*;

//String variable is declared to store the parth to files used in the program.
final static String TITLE = "Crab Space Program";
final static String ICON_IMG = "data/img/icon.png";
final static String CURSOR_IMG = "data/img/cursor.png";
final static String RAKET_IMG = "data/svg/raket.svg";
final static String MENU_SOUND = "data/audio/title_sang.mp3";
final static String ARROW_IMG = "data/svg/arrow.svg";
final static String EXIT_IMG = "data/svg/exit.svg";
String name;

//The strings are used for making PImage objects.
PImage cursor_img;
PShape raket_img;
PShape arrow_img;
PShape exit_img;

//The strings are used for making SoundFile objects.
SoundFile menu_sound;

//The following boolean statements are used to control the current page of the program.
boolean menu = false;
boolean upgrade_page = false;
boolean game = true;
boolean lb = false;

boolean mute = false;

//The function settings i used to create a window with a specific size, to start.
void settings() {
  size(1280, 720, FX2D);
}

//The function setup is used to
void setup() {
  raket_img = loadShape(RAKET_IMG);
  cursor_img = loadImage(CURSOR_IMG);
  arrow_img = loadShape(ARROW_IMG);
  exit_img = loadShape(EXIT_IMG);
  home_setup();
  upgrade_setup();
  game_setup();
  surface.setTitle(TITLE);
  //Set custom desktop icon
  getSurface().setIcon(loadImage(ICON_IMG));
  cursor(cursor_img, -32, -32);
  menu_sound = new SoundFile(this, MENU_SOUND);
  menu_sound.loop();
}

//Draws the game, depending on the current page
void draw() {
  if (menu==true) {
    home();
  }
  if (upgrade_page==true) {
    upgrade();
  }
  if (game==true) {
    game();
  }
  if (lb==true) {
    lb();
}
}

//TODO, ask for name when starting the game.
//void navnpopup() {
//  name = new UiBooster().showTextInputDialog("Navn");

//  if (navntaget(name) == true) {
//    new UiBooster().showErrorDialog("Dette navn er allerede brugt", "ERROR");
//    navnpopup();
//  } 
//}
