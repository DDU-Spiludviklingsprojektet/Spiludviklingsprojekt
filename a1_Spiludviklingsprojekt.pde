//Firstly Libraries are imported, following libraries are imported:

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
final static String BACKGROUND_IMG = "data/background.gif";
final static String LOGO_IMG = "data/img/logo.png";
final static String BUTTONS_IMG = "data/svg/buttons.svg";
final static String RAKET_IMG = "data/svg/raket.svg";
final static String MENU_SOUND = "data/audio/title_sang.mp3";
final static String ARROW_IMG = "data/svg/arrow.svg";
final static String EXIT_IMG = "data/svg/exit.svg";
String name;

//The strings are used for making PImage objects.
PImage cursor_img;
PImage background_img;
PImage logo_img;
PShape buttons_img;
PShape raket_img;
PShape arrow_img;
PShape exit_img;

//The strings are used for making SoundFile objects.
SoundFile menu_sound;

//Declariation of variables used for creating a grid of pictures in the background of the main menu.
int cols;
int rows;

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
  //ProgressDialog dialog = new UiBooster().showProgressDialog("Please wait", "Waiting", 0, 120);

  mysql_setup();
  //dialog.setProgress(10);
y  //Set custom desktop icon
  getSurface().setIcon(loadImage(ICON_IMG));


  menu_sound = new SoundFile(this, MENU_SOUND);
  menu_sound.loop();

  surface.setTitle(TITLE);
  surface.setResizable(true);

  logo_img = loadImage(LOGO_IMG);
  buttons_img = loadShape(BUTTONS_IMG);
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
  if (mute == true) {
    menu_sound.amp(0.0);
  } else {
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

void navnpopup() {
  name = new UiBooster().showTextInputDialog("Navn");
  if (navntaget(name) == true) {
    new UiBooster().showErrorDialog("Dette navn er allerede brugt", "ERROR");
    navnpopup();
  } else {
    return;
  }
}
