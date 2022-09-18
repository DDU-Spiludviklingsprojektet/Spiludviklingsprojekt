import uibooster.*;
import uibooster.components.*;
import uibooster.model.*;
import uibooster.model.formelements.*;
import uibooster.model.options.*;
import uibooster.utils.*;

//Import of libraries for database and for making the windows resizeable
import processing.javafx.*;
import de.bezier.data.sql.mapper.*;
import processing.sound.*;

//Variable setup, pretty self explainatory names
final static String TITLE = "Crab Space Program";
final static String ICON_IMG = "data/img/icon.png";
final static String CURSOR_IMG = "data/img/cursor.png";

final static String RAKET_IMG = "data/svg/raket.svg";
final static String MENU_SOUND = "data/audio/title_sang.mp3";
final static String ARROW_IMG = "data/svg/arrow.svg";
final static String EXIT_IMG = "data/svg/exit.svg";
String name;
//Initializing variabls for shapes, images and sound

PImage cursor_img;

PShape raket_img;
PShape arrow_img;
PShape exit_img;


SoundFile menu_sound;

boolean menu = true;
boolean upgrade_page = false;
boolean game = false;
boolean lb = false;
boolean mute = false;

void settings() {
  size(1280, 720, FX2D);
}

void setup() {
  //ProgressDialog dialog = new UiBooster().showProgressDialog("Please wait", "Waiting", 0, 120);

  mysql_setup();
  //dialog.setProgress(10);
  frameRate(30);
  //Set custom desktop icon
  getSurface().setIcon(loadImage(ICON_IMG));


  menu_sound = new SoundFile(this, MENU_SOUND);
  menu_sound.loop();

  surface.setTitle(TITLE);
  //surface.setResizable(true);


  raket_img = loadShape(RAKET_IMG);
  // Load custom cursor
  cursor_img = loadImage(CURSOR_IMG);
  arrow_img = loadShape(ARROW_IMG);
  exit_img = loadShape(EXIT_IMG);
  cursor(cursor_img, -32, -32);
  //dialog.setProgress(60);
  logox = width/2;
  logoy = height/4;
  logosize = width/3;
  buttonsx = width/2;
  buttonsy = height*0.7;
  buttonssize = width/3;
  home_setup();
  game_setup();
  upgrade_setup();
  boot();
  //dialog.setProgress(120);
  //dialog.setMessage("Ready");
  //dialog.close();
}


//Code to exit fullscreen & program
void draw() {
  //if (name == null) {
  //navnpopup();
  //}
  //println(s);

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


void navnpopup() {
  name = new UiBooster().showTextInputDialog("Navn");
  if (navntaget(name) == true) {
    new UiBooster().showErrorDialog("Dette navn er allerede brugt", "ERROR");
    navnpopup();
  } else {
    return;
  }
}
