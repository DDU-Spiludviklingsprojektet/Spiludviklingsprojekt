//String variable is declared to store the parth to files used in the program.
final static String BACKGROUND_IMG = "data/svg/forside_baggrund.svg";
final static String LOGO_IMG = "data/img/logo.png";
final static String BUTTONS_IMG = "data/svg/buttons.svg";
final static String BUTTONS_RED_IMG = "data/svg/buttons_red.svg";
final static String EMPTY_IMG = "data/svg/empty.svg";


PShape background_img;
PImage logo_img;
PShape buttons_img;
PShape empty_img;

Button_rect start_bt;
Button_ell mute_bt;


String is_mute;
float rectX, rectY;      // Position of square button
float circleX, circleY, circle2X, circle2Y;  // Position of circle button
int rectwidth;  // Diameter of rect
int rectheight;
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
float circleSize;  // Diameter of circle
color currentColor;
boolean rectOver = false;
boolean circleOver1 = false;
boolean circleOver2 = false;


void home_setup() {
  background_img = loadShape(BACKGROUND_IMG);
  logo_img = loadImage(LOGO_IMG);
  buttons_img = loadShape(BUTTONS_IMG);
  empty_img = loadShape(EMPTY_IMG);
  
  
  start_bt = new Button_rect(empty_img, 100, 100, 200, 60, width/1.99, height/1.365, 200, 60, 255, 0);
  mute_bt = new Button_ell(200, 200, 60, 60);


}

void home() {

  shapeMode(CORNERS);
  shape(background_img, 0, 0, width, height);
  shapeMode(CENTER);
  imageMode(CENTER);
  image(logo_img, width/2, height/4, width/3, width/3);
  shape(buttons_img, (width/2), (height*0.7), width/3, width/3);

  if (start_bt.isClicked()) {
    println("Upgrade");
    clear();
    menu = false;
    upgrade_page = true;
  }
  if (mute_bt.isClicked()) {
  
  
  }
  start_bt.update_rect();
  start_bt.render();
  mute_bt.update_ell();
  mute_bt.render();
  
}


void mute() {
  if (mute == false) {
    menu_sound.amp(0.0);
    mute = true;
    buttons_img = loadShape(BUTTONS_RED_IMG);
  } else if (mute == true) {
    menu_sound.amp(1.0);
    mute = false;
    buttons_img = loadShape(BUTTONS_IMG);
  }
}
